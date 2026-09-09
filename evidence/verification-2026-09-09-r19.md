# Verification Record — r19 Aggregated Beta-Prime (2026-09-09)

This record binds the public r19 summary to the sealed terminal run without
publishing raw model returns or internal operational paths.

## Terminal Binding

| Artifact | SHA-256 |
|---|---|
| Terminal manifest file | `21893684d1cd6aadbf52083f98a6efe78478a5bb9abeb01141622fd0ea8bfb60` |
| Terminal manifest embedded seal | `c8cb79a423be0bd554591e0ee845fdb7327d3f4ec3b27314ff1aa6718dfd6d4b` |
| Final reconciliation | `673ed7dd5006664a5bee90747d2990e2c96c17100acb4aba74f14fc9927e0554` |
| System evaluation | `643d42b8e47d7af0e5fdc5f9910d8f8585cc2c2084902f1ef4c903e180478062` |
| Terminal report | `6908d19b556f9a2255ab468fb029be7a218fd132e52a4d76dd72857da96ae75d` |
| Terminal checkpoint | `27c58e73a6862e71d7f472b967f083db0a34dd3d69caff8df4a57a9f18e4c304` |
| Terminal ledger | `81315c9570a5b5a3c885606df4dd054c57b5037a31145aa740cfdb7f116ff100` |
| Final claim identity snapshot | `0aef67b9e916e0f68b8699fa37a5531bfddedb09567dce7d769c2931a6aa9a32` |

The system-evaluation digest in the table is exactly the digest embedded in
the terminal manifest. The public repository does not contain that internal
artifact; this row is a provenance binding, not a public source hash.

## Formally Verified Auxiliary Declarations

Each row records the theorem-contract, kernel-receipt, and independent
fidelity-receipt digests from the successful governed workflow.

| Cycle | Declaration | Contract | Kernel | Fidelity |
|---|---|---|---|---|
| 1 | `conditionalFlow_total_le` | `6d4a61bb090f7908bba33c6fd1a2bd86a1a104a8d4638ad4f9fb11c04b201833` | `196e700f7760693fbdba9225f2d43654d961218441018d2a0b4c10b03b65bea5` | `24a31898465b9eb3eb5228fba98b81a8a36e916c0aeac804fd0634684b71e920` |
| 1 | `supportFibre_dichotomy` | `64fa80f11a920c5e7cd91f5cc3628511ad74d56f552a3cd13230c03e96b57209` | `816fff01b1792767efdf97ff1aadd8727d79245125f38699f2a05c3ca1f61072` | `95b1495cf2af6b13b2b7018eb57d6cdb97308b35aefc598a184b4e7fda8dc83f` |
| 1 | `finiteTransport_iff_total_le` | `29899ef86ef26aee2734611084bb5ee66553cb5c66f114f732221a9bf5459384` | `2c3cb8c869482cfc8a3d9a634b80aa7987cb783efd11ea8d5966afd7db524170` | `c5bb307f312d45a5a00e7c8eff865797689f9c2fdcd715b05a4bd66a38590981` |
| 1 | `covariance_decomposition` | `e6f225f1ebd6aab559840356ee5907e3c10f2acdf8cb08b0af57577dc190c6e9` | `c61b6ed69ca518a80f6740b876adcc1369843818b3d32a985a941315cc3ed5ee` | `6d0b6be0d214c0fd58ed357f91c4e24e370d0df8209b12e0bc41983e9c0fe72c` |
| 1 | `twoType_covariance_factor` | `63d3e8437c99d1e56cfb0b8c0a2cc27166f43c3b78927585b76cc9c721cbafdf` | `6f0ba4a8fdaf7cd4bddde09f4677f5e90bad6056afc23ddb2a6dec1586cb0b51` | `ac05a2908731a5eea850852719bf4a42bba7f66aadb0cc799357e0733c699ca9` |
| 2 | `finite_edge_counting_conditionalHall` | `b4ddaf86f67dd6dad557dab61ca47bec325896d420e7769c834215b7de176ebb` | `133250507da1253c532f093b03f9e5dadf0a3ab7e9cd9c99d429f2179cf13f13` | `c40cab7ffc862d3dbd5e1e4a2d48305a42e8784151b0fbcbf76113feef475968` |
| 2 | `tm_polynomial_operator_identity` | `a44e25f0cc56d688fa37546c452d120ab03d81a949e38b48ca2dd99dd43b13b1` | `affe893234ba779b751bf46c2c31dfbac59d00e0130e97deed54440aea0ef0cc` | `19ce982b3efb825772c0b7fc32906c83e8419742fcd7a67043951ab34aac4c0c` |
| 2 | `finite_nonempty_pairwise_covariance_identity` | `ea8a070797e606f77dc866b6311d17cc749647fae6eb8aae7e705aeb68893531` | `c9d0c99134b1e377e87b897999003fd905fca7e2a99be52cb3d55f6c2078765f` | `6126e108c309c896e25c35bcde83a2d7f4a4ee82da7bc5d2b52112e3de165c54` |
| 3 | `finite_signed_mass_nonpos_of_all_subset_hall` | `a93eb33ff305ea031bdacfe95d9344c228bf7be14217108206950816c470dd1d` | `52b25b2aea6f490c18a5e9d3eb1f4700d1a647e64c4a3a7ab6bd93c52fc3f3f0` | `0de2493b9b076be841572304aaad8ef3d4dbd3f09df8bc1ebdfa75577396905d` |
| 3 | `tm_rank_closure_of_ratio_control` | `7a5507d10f6134973d10d844e2ece5f221b7185a445bfb0634f79b3e0816a4d6` | `0a458e659d226acaa68a40147a0120885408de38dc8b39ee61d282de7f8bf974` | `ec5126300d55e0c4deeddfddb7e380122018f966fcb040138f976cf412fac045` |
| 3 | `supportMeanAggregate_nonpos_of_orbit_and_covariance` | `30909ac7ff39d4fa6ae6d558882e200b169df52c37370e2941b76a141a4a2168` | `892a26cae180aa3c17c829789ff647c2d4fddc76c8a4787bf613abee57840682` | `5702c98b3a194b9175f956ae4d8e323d056b830ca05002ee4b252d4574fef23b` |
| 4 | `c4_aux_tm_determinant_cancellation` | `76ae156bfc957c3fcc1aaca957acd7052e899ce92edb9287c5d0145830f3f4a8` | `4e53b79c069834ecbea1ebee665b5b61b82feef520057f6b3765deb53c5008e8` | `bd5f80df87449528f36d9058668c46c1097a94b03f0a7ebf2f45adca5e7236eb` |
| 4 | `c4_lean_u1_components` | `6b41e2c05607844eba4dbd1469602218fa801117268bcd8b20d528d6d3a6e6ee` | `6165c779bf8eac9a6ca7e06db0490f49682d47a3066e4c58f6cf655c7e508762` | `997c12244d2946e0cbadcb8674d2e76a927a124c92517b679ee7ae0949b15347` |
| 4 | `c4_aux_provenance_separation` | `26e1d7a14f49ae8048c45f156ea2d52ea4fa0717b68e8c4181f3a2e53362594a` | `ba9e013d937ed5adb820d7ae2b870b4bbdce4377b332e9c64e57fedce71ece54` | `89bc64a9eb5f194cfe058b7a441d3977c1a9aa801bcd0527197f07ee163bdd33` |
| 5 | `Cycle5Stage7Compensation.compensation_escape` | `ebc6bf183048b538c7f62badd9d31d951877255165ffe318e9627b869315d606` | `5a4aa2e6a8c04289cb1d78181b92c8ea00f3daf170d7115de8087510c22e6586` | `1d570a2ed1fe0ff2abe75a149f4f36f41636f4a510454d878ca945e1a805bf6f` |
| 5 | `Erdos993.C5Stage7Hm.c5_f1_hm_deleted_polynomial_identities` | `886e1e733c03f75ba13b47092728cf775e60f60abf7eb1475f45c7742e4c53b2` | `d374e3a4c4fb69425fcd0a529d1c0801938b39f6710f1945dc0733366af2f268` | `d4be2e063d82c7a44be6fe42cd8611056a34854ff93c18ef2e12d68d010286aa` |
| 6 | `C6T2Tail.c6_t2_tail_aux_package` | `8781dd2607f9d3840d26765b1ab599dd193a719f7d5c6e0759a66fbf59d0e13d` | `4ebd1bc0ac3a309b1598bde42b7cba42e84d5608c43928f9bc106425f62505e1` | `0b982204bd39005f164c5a4ffc36698eb5d0c82f3b348232d8484f5a036cfad1` |
| 6 | `Erdos993.Cycle6.Stage7.c6_f1_hm_qc_identity` | `632a98d5c6cdea67ec93d04de067fd30a42d0e4bba0e7536f625640e951ca30f` | `9d73058add224b9ee92f2bfe4ff8a807f961b15346d17c3dafb3b9b6f9df21d5` | `3097803cc00476cc41ecc9e99bd945b3589f050de2ef639c3912ec3b929358a7` |
| 6 | `Erdos993.Cycle6.Stage7.c6_u1_base_reduction` | `62aeebb188f14cbbda1b9446ac85e1b56906e2f4922b467d2dfcb68dec2712ed` | `7d2442f267ccd9c2514c30268bb033e261a47c5236f84acfce2617cc29565103` | `b7eeb3325653e4967975b52d4a90938e9c82ed0f48f3c73cf278bbaafa97ace7` |
| 6 | `Erdos993.Cycle6.Stage7.c6_t3_conditional_leaf_deletion_descent` | `42b94c8e4ca77831a5bc8d1fbf2d77763626a0bd46e98a3c735f2d4f94939116` | `0c3b2c93c998c1b67829a5a3aadeec8da1400f9cc8cc66d5c91fcbe3f007f765` | `5db21e8ce4b97568778dbc0aebc7ce84d6e245022c912833d0fc94876373955c` |
| 7 | `C7T1.highRankDeleteHall` | `6d9ad0d0ac5d1419503cf1dbed5dcca6eaab016f368738771a46391f3c6f3dd8` | `16862f3ee67056392a2204553806887315489f9200426ac25e064fa466974ccb` | `a1dcc7fe4b57336a61c3f65c34dc74bd02eb22f3ac079bce5620c51fa31d2f33` |
| 7 | `C7Stage7T2RK.c7_stage7_t2_rk_binomial_component` | `20593eec143fa38c535e3ccba3daf4610d372031c614665f7bd571c5010d660d` | `442f0ba52eac1d253f25469303738826fa541de9e61b7173ceec2f1253f20416` | `85d1debbc31c4195ae11e72dbe94bc709dfa62823cc7b7a0c9cd3e330ba157f6` |
| 7 | `c7_t3_compensator_support_negativity` | `228e8a5a1921244e117548577ce8c794fcb21800a34c0272cf1b1aed98e217b4` | `254aabb04e2ac4660fbbaccec92c270889e467649c688273b6b14dfff17225a1` | `f3acb193a0faebf3df84ea3cb0e786a246117b19e13ec77ba26f536a2f7ca502` |
| 7 | `C7T3DirectDescent.c7_t3_direct_descent_interface` | `fbb9be0f4eaa970673b1fd05e263ac99afea01f7b23ef72291e9eb0be8cf2509` | `4f1951fed6280cb267f70535ac9d48eeb32ac797a4a8db914c782fc23494949d` | `9b31d4205391ecc67eff25743f789b864e14ee02d2c91d3c9055c45ee7000188` |
| 8 | `C8T1.local_retag_blocks_saturate` | `fe3408302b68439e18186a3fa8c20d934bad9537a0eaa0a3eb04e2b94aa4a463` | `000bb9f403b8dd1771d089b201e7912d57d8648d0ea8ca2ccfa2fa3a91681ecf` | `db6e70097c0a356064fdab2e0f2ae4f53c3c53c91862ade2b05225cc8f2f60c5` |

## Exact Boundary

The 25 declarations are formally verified only at their contracted auxiliary
scopes. This release does not include their Lean source projects, so the table
is a receipt index rather than a public rebuild package. The public repository
therefore does not count these declarations among its exported Lean packages.

`E993-BETA-AGG`, PAIR-G4, Theorem A, TREE, FOREST, TRANSFER, and Erdős #993
remain open. Cycle 9 made no formal award.
