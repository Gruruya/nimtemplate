# Copyright © 2023 Gruruya <gruruya.chi4c@slmails.com>
# SPDX-License-Identifier: AGPL-3.0-only

version      = "0.0.0"
author       = "Gruruya"
description  = "A template to jump start your Nim library or project."
license      = "AGPL-3.0-only"
srcDir       = "."
bin          = @["nimtemplate"]
# If you edit this, you may also want to edit .github/workflows/build.yml
installFiles = @["nimtemplate.nim"]
installDirs  = @["nimtemplate", "LICENSES"]

# Dependencies
#requires "nim >= 2.0.0"
# Uncomment if you require features from a specific Nim version

when not declared(nimbleExe):
  const nimbleExe {.strdefine.} = "nimble"

task docs, "build docs":
  exec nimbleExe & " doc --project nimtemplate.nim"

after clean:
  for dir in ["htmldocs", "nimbledeps"]:
    rmDir(dir)
  for file in ["nimtemplate.out"]:
    rmFile(file)

when declared(taskRequires):
  taskRequires "test",
    when (NimMajor, NimMinor) >= (1, 7) and not defined(windows) and not defined(macosx):
      "https://github.com/disruptek/balls >= 4.0.0"
    else:
      "https://github.com/disruptek/balls >= 3.0.0 & < 4.0.0"
else:
  requires "https://github.com/disruptek/balls >= 3.0.0 & < 4.0.0"
  before test: exec nimbleExe & " install -y"

task test, "run tests":
  let balls = when defined(windows): "balls.cmd" else: "balls"
  exec balls & " --backend:c --mm:orc --mm:arc --define:debug --define:release --define:danger"
