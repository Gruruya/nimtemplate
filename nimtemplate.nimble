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
# uncomment if you need a Nim stdlib feature from a specific version

when compiles(taskRequires):
  taskRequires "test", "https://github.com/disruptek/balls ^= 3.0.0"
else:
  requires "https://github.com/disruptek/balls >= 3.0.0 & < 4.0.0"
  before test: exec "nimble install -y"

task test, "run tests":
  let balls =
    when defined(windows):
          "balls.cmd"
    else: "balls"
  exec balls & " --backend:c --mm:orc --mm:arc --mm:refc --define:debug --define:release --define:danger"
  
task prepare, "setup template":
  if paramCount() != 10: quit("Usage: nimble template NEWNAME GITHUBUSERNAME")
  if findExe("sed") == "" or findExe("rename") == "":
    quit("sed and rename are not available.\nYou will need to find another way to replace nimtemplate with " & paramStr(9) & " and Gruruya with " & paramStr(10) &
      "\nLook at the prepare task in nimtemplate.nimble if you want to see what files need changed.")
  exec("sed -i 's/nimtemplate/" & paramStr(9) & "/g' README.md nimtemplate.nimble src/nimtemplate.nim tests/test.nim .github/workflows/documentation.yml")
  exec("rename nimtemplate " & paramStr(9) & " * src/*")
  exec("sed -i 's/Gruruya/" & paramStr(10) & "/g' README.md")
