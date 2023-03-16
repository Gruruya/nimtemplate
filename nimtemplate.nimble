version     = "0.0.0"
author      = "Your name"
description = "Description of your library"
license     = "AGPL-3.0-only"

#bin = @["nimtemplate"]
# uncomment if this program includes a binary
# also add '- run: nimble build -y' to the end of the .github/workflows/build.yml file
srcDir = "src"
skipDirs = @["tests"]

# Dependencies
#requires "nim >= 1.6"
# uncomment if you need a Nim language feature from a specific version

task test, "run tests":
  requires "balls >= 3.0.0 & < 4.0.0"
  when defined(windows):
        exec "balls.cmd"
  else: exec "balls"
