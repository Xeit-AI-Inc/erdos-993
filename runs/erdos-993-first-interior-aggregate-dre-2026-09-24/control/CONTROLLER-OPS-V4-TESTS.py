"""Local, isolated checks for the inactive cycle-aware controller proposal."""

import contextlib
import importlib.util
import io
import subprocess
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch


HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location("controller_ops_v4", HERE / "controller_ops_v4.py")
ops = importlib.util.module_from_spec(spec)
spec.loader.exec_module(ops)


class CycleAuthorityTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        for name in ("control", "ledgers", "receipts", "scratchpad", "cycles", "packets", "manifests"):
            (self.root / name).mkdir()
        self.root_patch = patch.object(ops, "B", self.root)
        self.root_patch.start()
        self.addCleanup(self.root_patch.stop)

    def fake_run(self, command, **kwargs):
        return subprocess.CompletedProcess(command, 0, stdout='{"ok":true}\n', stderr="")

    def test_c1_uses_frozen_initial_files_without_versioned_directory(self):
        (self.root / "ledgers").rmdir()
        with patch.object(ops.subprocess, "run", side_effect=self.fake_run) as run:
            ops.gates("C1-T1-ADMISSION")
        lint = run.call_args_list[0].args[0]
        self.assertEqual(lint[lint.index("--identity") + 1], str(self.root / "control/REGISTERED-CLAIM-IDENTITY.json"))
        self.assertEqual(lint[lint.index("--ledger") + 1], str(self.root / "OBLIGATIONS.csv"))
        self.assertEqual(run.call_count, 2)
        self.assertTrue((self.root / "receipts/C1-T1-ADMISSION-lint.json").is_file())
        self.assertTrue((self.root / "receipts/C1-T1-ADMISSION-paths.json").is_file())

    def test_later_cycle_uses_exact_versioned_pair_and_exclusive_receipts(self):
        (self.root / "control/C3-REGISTERED-CLAIM-IDENTITY.json").write_text("identity")
        (self.root / "ledgers/C3-OBLIGATIONS.csv").write_text("ledger")
        with patch.object(ops.subprocess, "run", side_effect=self.fake_run) as run:
            ops.gates("C3-AF-DISPATCH")
        lint = run.call_args_list[0].args[0]
        self.assertEqual(lint[lint.index("--identity") + 1], str(self.root / "control/C3-REGISTERED-CLAIM-IDENTITY.json"))
        self.assertEqual(lint[lint.index("--ledger") + 1], str(self.root / "ledgers/C3-OBLIGATIONS.csv"))
        self.assertEqual(run.call_args_list[1].args[0][-7:],
                         ["--prune", "scratchpad", "--prune", "control-proposals", "--prune", "governance", "--json"])
        with patch.object(ops.subprocess, "run", side_effect=self.fake_run):
            with self.assertRaises(FileExistsError):
                ops.gates("C3-AF-DISPATCH")

    def test_later_cycle_fails_before_any_gate_or_receipt_when_snapshot_missing(self):
        for missing in ("both", "identity", "ledger"):
            with self.subTest(missing=missing):
                identity = self.root / "control/C2-REGISTERED-CLAIM-IDENTITY.json"
                ledger = self.root / "ledgers/C2-OBLIGATIONS.csv"
                identity.unlink(missing_ok=True)
                ledger.unlink(missing_ok=True)
                if missing == "identity":
                    ledger.write_text("ledger")
                elif missing == "ledger":
                    identity.write_text("identity")
                with patch.object(ops.subprocess, "run") as run:
                    with self.assertRaises(FileNotFoundError):
                        ops.gates("C2-T1-ADMISSION")
                run.assert_not_called()
                self.assertFalse(list((self.root / "receipts").iterdir()))

    def test_explicit_cycle_and_conflicting_label(self):
        (self.root / "control/C4-REGISTERED-CLAIM-IDENTITY.json").write_text("identity")
        (self.root / "ledgers/C4-OBLIGATIONS.csv").write_text("ledger")
        with patch.object(ops.subprocess, "run", side_effect=self.fake_run) as run:
            ops.gates("DISPATCH", cycle=4)
        self.assertIn(str(self.root / "ledgers/C4-OBLIGATIONS.csv"), run.call_args_list[0].args[0])
        with self.assertRaises(ValueError):
            ops.gates("C2-DISPATCH", cycle=4)
        with self.assertRaises(ValueError):
            ops.gates("DISPATCH")

    def test_admit_and_case_pass_worker_cycle_to_gates(self):
        worker = "C2-T1"
        (self.root / "control/C2-REGISTERED-CLAIM-IDENTITY.json").write_text("identity")
        (self.root / "ledgers/C2-OBLIGATIONS.csv").write_text("ledger")
        src = self.root / "scratchpad" / worker
        src.mkdir()
        (src / "RETURN.json").write_text('{"claims":[]}')
        with patch.object(ops, "inventory", return_value={"workers": {}}), \
             patch.object(ops.W, "validate_return"), \
             patch.object(ops.W, "seal"), \
             patch.object(ops, "gates") as gates, \
             patch.object(ops.subprocess, "run", return_value=subprocess.CompletedProcess([], 0, stdout="", stderr="")), \
             contextlib.redirect_stdout(io.StringIO()):
            ops.admit(worker)
        gates.assert_called_once_with("C2-T1-ADMISSION", cycle=2)

        with patch.object(ops, "inventory", return_value={"workers": {}}), \
             patch.object(ops.W, "seal"), \
             patch.object(ops, "gates") as gates, \
             contextlib.redirect_stdout(io.StringIO()):
            ops.case("C2-T2", "DISPATCH-T2")
        gates.assert_called_once_with("DISPATCH-T2", cycle=2)

    def test_missing_snapshot_prevents_admission_copy_and_case_outputs(self):
        src = self.root / "scratchpad/C2-T1"
        src.mkdir()
        (src / "RETURN.json").write_text('{"claims":[]}')
        with self.assertRaises(FileNotFoundError):
            ops.admit("C2-T1")
        self.assertFalse((self.root / "cycles/cycle-2/C2-T1").exists())
        with self.assertRaises(FileNotFoundError):
            ops.case("C2-T2", "DISPATCH-T2")
        self.assertFalse((self.root / "packets/C2-T2.json").exists())
        self.assertFalse((self.root / "scratchpad/C2-T2").exists())


if __name__ == "__main__":
    unittest.main()
