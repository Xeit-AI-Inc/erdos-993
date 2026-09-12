# Verification Record — r21/r22 O14 Multibase Hall (2026-09-12)

This record binds the public summaries to the two sealed terminal experiments
without publishing raw model returns, hidden prompts, or private filesystem
paths.

## Terminal Binding

### r21 parent

| Artifact | SHA-256 |
|---|---|
| Terminal manifest file | `e0c680588cba9d6b5d677fba66958ab6c4f3b68183a222f375d22e17172621bd` |
| Terminal manifest embedded seal | `7e000ab1159769d56400245f3141cbc3098e5163df60719b02be224edc4b2b37` |
| Final reconciliation | `5418ce2a2a224470d1c07c45e3de3955fd636f722b24f7c00b3c6bb6590edc9b` |
| Terminal report | `4894e1614922a8c8edb647365ef2faff2d6ea7b546a17d451cb69b0e3d723d42` |
| Terminal ledger | `01a812a4c16983248c1b0ad4a949a807d906be2dc2a698024bfd280e1bfbe53c` |

### r22 continuation

| Artifact | SHA-256 |
|---|---|
| Terminal manifest file | `2d7a0c62efbf7716edf79f0d5e96336cf9c35d6f66c5f2e84ff9f1251f3ed546` |
| Terminal manifest embedded seal | `6da39c0b21f34a69a57175ee36b4c43b512b1298e4f9b83882c1c105a1286ded` |
| Final reconciliation | `5d57f03e3117950ca5d745fac2959a608efeefc67cfd65a98ce36c9b6cbf0e08` |
| System evaluation | `61f203985c337e1c16642f7118c5a90cb77b6c59a3f46402642a479acf44e102` |
| Terminal report | `b6672ec8e54be2fcf595441bcf9b63a28e8ad105c2f7b94dad1eef58e552cc35` |
| Terminal checkpoint | `967a2932341a3f8d392eaadd6c4f6f2d1c3b3e2982185a413617d949f528067e` |
| Terminal ledger | `f063116b2406f80ecb6e18f802c6b77c62ef6d7fb68f76299785c49d54f30508` |
| Cycle 9 Stage 7 manifest file | `68729214d6664d4b7f9cadb10d3abf3cffd664295a4bd287b35e7a19989809b3` |
| Cycle 9 Stage 7 embedded seal | `c8aa7bfdb7eb8514526e02915416a3ecc1e099e5ff6adba27a3d56e236f6a78d` |
| Closeout validation | `0120cdcd5cf3649715736b775e54e1cdfc0bb34e6a0a4744bbceb9fa2accbfac` |

## Formally Verified Auxiliary Declarations

Each row records the frozen theorem-contract, successful kernel receipt, and
independent statement-fidelity receipt. All declarations use Lean `4.32.2`,
Mathlib revision `905b95818eb32af7874a58b427f50c1711a5e96c`, and only the
axioms permitted by their contracts.

| Run/cycle | Declaration | Contract | Kernel | Fidelity |
|---|---|---|---|---|
| r21 C1 | `inclusionMinimalHallDeficiency` | `def0f06f72e50e920f0c62a601bc63dd8db5533ba4ddc4c2fe04caec53fba091` | `ffa1eeac608a960a01fbf9ac6ff352f153e8c3637d3e5472b89a9a167b50ef58` | `0b754b49bdd8756f8b5047d413005c2af9ac31d0ae8cd48295a7a08dd007713d` |
| r21 C2 | `OrdinaryShadow.ordinary_shadow_identities` | `7e67be541221ed3c7bb2f1d276e96317e3e11e22567dfced1aa1ca7bf9bd5644` | `07d59b637277ad25942b6bd17dee15e0fb5d1bad30ff7cb1444a3e71a692ff7a` | `7ec13a85c6c64f40b0931813adf6ddfbc1d3d9e9aa648b54f129af13e116a588` |
| r22 pre-C4 | `c3_s7_01_cc_residual` | `902fa01254686a8df9224c117fe9763697ce16709752a6f4f4cdc94c47ea25e3` | `14f99354406ca18e9f50d8078c92f809bcafaf5b513801c36d891a2950324d2a` | `7092a96f51c551474fd373db29fd3b03ac4efca9262965385663f8ea5e2d8061` |
| r22 C4 | `c4_s7_01_multibase_collision` | `d06b09e9eed2ec516364ce9d774575a76e4bd5f8e305e423fa3352bc2e08f282` | `7eb914982fdaa9dba726a85c8835eeee3177166db6e082f402371ac2f42463ac` | `42204ce4f05fdd80c7d6cb57389e89735d2feb4872fe34928d4c481a0aaf188b` |
| r22 C5 | `C5S7FixedCarrierCollision.c5_s7_01_fixed_carrier_collision_monotonicity` | `5f24ef24cd918e2541b1a27688b53d526bc8c3285754782c3999c9a4a4783139` | `98a2b43856ad0aa45bc1b17543cf03d9b26b86b26c80db147c4957bd95028043` | `a72409e14c79a3172f26b30dfcf8f15bfed39100f40348d1fb8bcc2b0904ca0d` |
| r22 C6 | `C6S7PairCollision.c6_s7_01_pair_collision_capacity` | `0d5deb91a5b641e8d6087398ae5b39cc19b0803b743e1bc7197bcae2af9ab25d` | `f288fb7af517ea5d146bad9178ee739a673e57adcdad57ca1ff4cf3500ee7934` | `74aa322c6e003cd95750e7cab50568b0383aa65b7a718751397bc11008927841` |
| r22 C7 | `C7S7MinimalDeficientCore.c7_s7_01_minimal_deficient_core_structure` | `184a437ffaf998957d109cfc94dc66c7d4b46ba5073034c9a053022a68f1699b` | `513da5f6e58293931ee32a2b3366d495b006e13aee59937858df38146af9d72b` | `a1b1a420392d30e4610de86e8c3ef11cc2eb96b14e48d4e63b65509e439ae87a` |
| r22 C8 | `C8S7TreeIncidenceMinimalCore.c8_s7_01_tree_incidence_minimal_core` | `25243c417b1aa1bef5570be27773d3faf612c5923f555083e67d4ad85e38dda5` | `1fa4f8e3d9f51ef31931ec167f4aedd3836aaf063e5dc6ca7e92ae8dbaaa925a` | `d2dde8d6cd9e5a4b19bdb61924773e72f1ddfc511d0b09be2faa54f34cb6cd52` |
| r22 C9 | `C9S7MobiusCollisionWeightUniqueness.c9_s7_01_mobius_collision_weight_uniqueness` | `6c29492fac920023fd0bcd2079967552885fa24e517802459f785435d50e2a9e` | `4aec2de7551390133bf4164f655761f901a375be9edc92a80c1fa6be0a28f6ea` | `15fa481d526f09d912850da38450e9ea7e872df04f8b3426f777ecf86162ba8d` |

## Exact Boundary

These are nine formal artifacts, not nine independent mathematical claims.
In particular, r22 Cycle 7 strengthens and repackages the parent
minimal-deficiency theorem. Every declaration is auxiliary and generic or
conditional at the stated scope.

None authenticates the governed Delete/Retag relation, proves the fixed-Gamma
Hall theorem, proves the favorable-leaf aggregate, or resolves TREE, FOREST,
TRANSFER, or Erdős #993. `E993-BETA-AGG` and
`E993-R19-FIXED-GAMMA-HALL` remain open. This release is a receipt index; the
Lean source projects remain in the sealed internal evidence lineage.
