## Metadata for nimble to build, package, and place nimtemplate.
# Copyright © 2023 Gruruya <gruruya.chi4c@slmails.com>
# SPDX-License-Identifier: AGPL-3.0-only

version      = "0.0.0"
author       = "Gruruya"
description  = "A template to jump start your Nim library or project."
license      = "AGPL-3.0-only"
srcDir       = "."
bin          = @["nimtemplate"] # If you remove this, also remove "nimble build -y" from the `testCI` task
installFiles = @["nimtemplate.nim"]
installDirs  = @["nimtemplate", "LICENSES"]

# Dependencies
#requires "nim >= 2.0.0"
# Uncomment if you require features from a specific Nim version

when declared(taskRequires):
  proc taskRequires(tasks: openArray[string]; dependency: string) =
    for task in tasks: taskRequires(task, dependency)
  taskRequires ["test", "testEx", "testCI"],
    when (NimMajor, NimMinor) >= (1, 7) and not defined(windows) and not defined(macosx):
      "https://github.com/disruptek/balls >= 4.0.0"
    else:
      "https://github.com/disruptek/balls >= 3.0.0 & < 4.0.0"
else:
  requires "https://github.com/disruptek/balls >= 3.0.0 & < 4.0.0"
  before test: exec "nimble install -y"
  before testEx: exec "nimble install -y"
  before testCI: exec "nimble install -y"

template testCmd: string =
  let balls = when defined(windows): "balls.cmd" else: "balls"
  balls & " --backend:c --mm:orc --mm:arc --define:debug --define:release --define:danger"

task test, "run tests":
  exec testCmd

task testEx, "run tests, retains exit code":
  let (output, exitCode) =
    gorgeEx testCmd
  echo output
  if exitCode != 0:
    quit exitCode

task testCI, "run tests for CI":
  template nimble: string =
    when declared(nimbleExe): nimbleExe else: "nimble"
  exec nimble & " build -y"
  testExTask()
