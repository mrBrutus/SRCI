# Change Log
All notable changes to this project will be documented in this file.
 
The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.0.0.30] - 2025-01-02

### Added
- Missing assignment of `AxesGroup.CyclicOptional.RobToPlc.SubProgramData`.

### Changed
- Behavior of applying `RobotTask.ParCfg`.
- `RobotTask.OnCall` now cyclically updates:
  - `AxesGroup.Cyclic.PlcToRob.ClientDate`
  - `AxesGroup.Cyclic.PlcToRob.ClientTime`
- Separate telegram footer structures now used for `RobToPlc` and `PlcToRob` (due to structural differences).
- Parsing of `Telegram.RobToPlc.Footer.LifeSign` simplified in `RobotTask.ParseRecvPayloadFooter`.
