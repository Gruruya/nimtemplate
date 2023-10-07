# Copyright © 2023 Gruruya <gruruya.chi4c@slmails.com>
# SPDX-License-Identifier: AGPL-3.0-only

version      = "0.0.0"
author       = "Gruruya"
description  = "A template to jump start your Nim library or project."
license      = "AGPL-3.0-only"
srcDir       = "."
bin          = @["nimtemplate"] # If you remove this, also remove "nimble build -y" from the `runCI` task
installFiles = @["nimtemplate.nim"]
installDirs  = @["nimtemplate", "LICENSES"]

# Dependencies
#requires "nim >= 2.0.0"
# Uncomment if you require features from a specific Nim version

template nimble: string =
  when declared(nimbleExe): nimbleExe else: "nimble"

task docs, "build docs":
  exec nimble & " doc --project nimtemplate.nim"

after clean:
  for dir in ["htmldocs", "nimbledeps"]:
    rmDir(dir)
  for file in ["nimtemplate.out"]:
    rmFile(file)

when declared(taskRequires):
  proc taskRequires(tasks: openArray[string]; dependency: string) =
    for task in tasks: taskRequires(task, dependency)
  taskRequires ["test", "runCI"],
    when (NimMajor, NimMinor) >= (1, 7) and not defined(windows) and not defined(macosx):
      "https://github.com/disruptek/balls >= 4.0.0"
    else:
      "https://github.com/disruptek/balls >= 3.0.0 & < 4.0.0"
else:
  requires "https://github.com/disruptek/balls >= 3.0.0 & < 4.0.0"
  before test: exec nimble & " install -y"
  before runCI: exec nimble & " install -y"

task test, "run tests":
  let balls = when defined(windows): "balls.cmd" else: "balls"
  exec balls & " --backend:c --mm:orc --mm:arc --define:debug --define:release --define:danger"

task runCI, "run tests and build, for CI":
  exec nimble & " build -y"
  testTask()
