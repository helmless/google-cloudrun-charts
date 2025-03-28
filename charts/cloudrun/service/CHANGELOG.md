# Changelog

## [0.3.0](https://github.com/helmless/google-cloudrun-charts/compare/google-cloudrun-service-v0.2.1...google-cloudrun-service-v0.3.0) (2025-03-29)


### Features

* add globals for project and region ([#5](https://github.com/helmless/google-cloudrun-charts/issues/5)) ([f3c3230](https://github.com/helmless/google-cloudrun-charts/commit/f3c3230732bc65c06c17825c7d7d46351b803033))
* revert 1.0.0 release and stick with non stable for now ([ae46f9b](https://github.com/helmless/google-cloudrun-charts/commit/ae46f9baf3016dd66f6e0dc1a9c3185c3b2a584e))


### Bug Fixes

* **deps:** update common chart dependency ([aee27ae](https://github.com/helmless/google-cloudrun-charts/commit/aee27ae4108575f429a0578c4742a17a490ff371))


### Miscellaneous Chores

* release 0.3.0 ([ca817bb](https://github.com/helmless/google-cloudrun-charts/commit/ca817bbc14b8aa186cb931188a475e414b043273))
* release 1.0.0 ([9d28835](https://github.com/helmless/google-cloudrun-charts/commit/9d28835f7d426e028019a850f9cb784341d0a898))

## [0.2.1](https://github.com/helmless/helmless/compare/google-cloudrun-service-v0.2.0...google-cloudrun-service-v0.2.1) (2025-03-21)


### Bug Fixes

* trigger release and set new icon ([81d71db](https://github.com/helmless/helmless/commit/81d71db60bcbf5f405fe8bc6711b38b3f81454f2))

## [0.2.0](https://github.com/helmless/helmless/compare/google-cloudrun-service-v0.1.1...google-cloudrun-service-v0.2.0) (2025-03-20)


### Features

* extract common helm chart and schema ([d8e1d69](https://github.com/helmless/helmless/commit/d8e1d69f6cda8832236b2daba71f0c8439b50a8c))


### Bug Fixes

* derefenrence schema before commit ([637b754](https://github.com/helmless/helmless/commit/637b7546f2e9356d67f1b0c15b48de0031107bfa))

## [0.1.1](https://github.com/helmless/helmless/compare/google-cloudrun-service-v0.1.0...google-cloudrun-service-v0.1.1) (2025-03-07)


### Bug Fixes

* add explicit global settings to the schema ([1dec277](https://github.com/helmless/helmless/commit/1dec27734d27032f73b739b002bd363b33dd1007))
* **cloudrun-service:** allow additional properties, e.g. global ([ae5b74d](https://github.com/helmless/helmless/commit/ae5b74d7d5aac054ef254eab35a11f677e3edb24))
* **test:** exclude volatile version from snapshot test ([d46096c](https://github.com/helmless/helmless/commit/d46096c4d219864e50c5bb51916981b310283329))

## 0.1.0 (2024-12-04)


### Features

* cloudrun service chart ([#6](https://github.com/helmless/helmless/issues/6)) ([38836de](https://github.com/helmless/helmless/commit/38836dedf6fc86e5c6ec955c9d515ceec6251df8))
* **docs:** add support for enums in schema ([07d12d8](https://github.com/helmless/helmless/commit/07d12d8f0f7aa9701841987c2e2c5268cefef080))
* finish docs refactor and add chart schema renderer ([1ebea3b](https://github.com/helmless/helmless/commit/1ebea3bc94bb21e68eb89453494269b83e6c6c70))
* move google cloud run helm chart back into monorepo ([74cc7a1](https://github.com/helmless/helmless/commit/74cc7a1589cc0f272155508bdf6e78761ac69551))
* **schema:** add really nice schema rendering and examples ([cad3df6](https://github.com/helmless/helmless/commit/cad3df6694e7710d0694939048dd985a2a2ee664))
* **schema:** extend cloud run service schema ([99268c2](https://github.com/helmless/helmless/commit/99268c220d6aeba55e90442bb0f25a80f7af5773))


### Bug Fixes

* **cloudrun-service:** do not autoset region, let the cli do it ([770fd3c](https://github.com/helmless/helmless/commit/770fd3cbdbc2b4a4dbedc7fe7d7a2241ba7d4809))
* **docs:** update the changelog heading regex ([64976d8](https://github.com/helmless/helmless/commit/64976d84ab85f219f8b8f8690a9b725c4b1bc3b6))
* **release:** set correct component name ([992f319](https://github.com/helmless/helmless/commit/992f319bae98c6020508a1dd49126852badedccb))
* **release:** update snapshots in release pr ([f2ebcff](https://github.com/helmless/helmless/commit/f2ebcff110e7f690c226b50330767573e57a672b))
* render nested props correctly ([3794a01](https://github.com/helmless/helmless/commit/3794a01add8fe7b28ea516428d3a9c0b5e0d131f))
* **schema:** cleanup chart values file and schema ([808585e](https://github.com/helmless/helmless/commit/808585ec0475c486b81e18bd9114e3741ca7e9c7))
* **schema:** move properties under correct key ([111da47](https://github.com/helmless/helmless/commit/111da479fb84c75dbd0fd3afbd1c5f02d19a424a))
* **schema:** update renderer to correctly indent nested props ([a6d1f58](https://github.com/helmless/helmless/commit/a6d1f58405e109e40648988a37ac800d608e23d0))


### Miscellaneous Chores

* release 0.1.0 ([f455943](https://github.com/helmless/helmless/commit/f455943078e9462aa1de9937a575a0f644174866))
