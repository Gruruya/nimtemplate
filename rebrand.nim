## Script to rebrand this template repository.

import std/[os, strutils]

let input = commandLineParams()
if input.len notin {1, 2}:
  echo "Usage: rebrand [PROJECT NAME] {AUTHOR}"
  quit 1

template project: untyped = input[0]
for file in ["README.md", "nimtemplate.nimble", "tests/test.nim", ".github/workflows/documentation.yml", "rebrand.nim"]:
  file.writeFile file.readFile.replace("nimtemplate", project)

if input.len == 2:
  template author: untyped = input[1]
  for file in ["README.md", "nimtemplate.nimble", "rebrand.nim"]:
    file.writeFile file.readFile.replace("Gruruya", author)

moveFile("nimtemplate.nimble", project & ".nimble")
moveFile("src/nimtemplate.nim", "src/" & project & ".nim")
moveDir("src/nimtemplate", "src/" & project)

echo "Done"
