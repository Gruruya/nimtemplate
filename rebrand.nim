# Copyright © 2023 Gruruya <gruruya.chi4c@slmails.com>
# SPDX-License-Identifier: AGPL-3.0-only

## Script to rebrand this template repository.

import std/[os, strutils]

let input = commandLineParams()
if input.len notin {1, 3}:
  echo "Usage: rebrand PROJECT_NAME [<AUTHOR> <EMAIL>]"
  quit 1

let project = input[0]
for file in ["rebrand.nim", "README.md", "nimtemplate.nimble", "tests/test.nim", ".github/workflows/documentation.yml"]:
  file.writeFile file.readFile.replace("nimtemplate", project)

if input.len == 3:
  let author = input[1]
  let email = input[2]
  for file in ["README.md", "nimtemplate.nimble", "rebrand.nim", "src/nimtemplate.nim", "src/nimtemplate/common.nim", "tests/test.nim", ".gitignore", ".github/dependabot.yml", ".github/workflows/build.yml", ".github/workflows/documentation.yml", ".github/workflows/nim-run/action.yml"]:
    file.writeFile file.readFile.multiReplace(("gruruya.chi4c@slmails.com", email), ("Gruruya", author))

moveFile("nimtemplate.nimble", project & ".nimble")
moveFile("src/nimtemplate.nim", "src/" & project & ".nim")
moveDir("src/nimtemplate", "src/" & project)

echo "Done"
