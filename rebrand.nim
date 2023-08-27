## Rebranding script - for nimtemplate.
# Copyright © 2023 Gruruya <gruruya.chi4c@slmails.com>
# SPDX-License-Identifier: AGPL-3.0-only

## Script to rebrand this template repository.

import std/[os, strutils]

let input = commandLineParams()
if input.len notin {1, 3}:
  echo "Usage: rebrand <project_name> [<author> <email>]"
  quit 1

if input.len == 3:
  for file in ["rebrand.nim", "README.md", "nimtemplate.nimble", "nimtemplate.nim", "nimtemplate/common.nim", "tests/test.nim", ".github/dependabot.yml", ".github/workflows/build.yml", ".github/workflows/documentation.yml", ".github/workflows/reuse.yml", ".github/workflows/nim-run/action.yml", ".gitignore"]:
    file.writeFile file.readFile.multiReplace(("nimtemplate", input[0]), ("gruruya.chi4c@slmails.com", input[2]), ("Gruruya", input[1]))
else:
  for file in ["rebrand.nim", "README.md", "nimtemplate.nimble", "nimtemplate.nim", "nimtemplate/common.nim", "tests/test.nim", ".github/dependabot.yml", ".github/workflows/build.yml", ".github/workflows/documentation.yml", ".github/workflows/reuse.yml", ".github/workflows/nim-run/action.yml"]:
    file.writeFile file.readFile.replace("nimtemplate", input[0])

moveFile("nimtemplate.nimble", input[0] & ".nimble")
moveFile("nimtemplate.nim", input[0] & ".nim")
moveDir("nimtemplate", input[0])

echo "Done"
