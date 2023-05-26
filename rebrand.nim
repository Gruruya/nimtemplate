# nimtemplate --- A template to jump start your Nim library or project.
# Copyright © 2023 Gruruya <gruruya.chi4c@slmails.com>
#
# This file is part of nimtemplate.
#
# nimtemplate is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, version 3 of the License.
#
# nimtemplate is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with nimtemplate.  If not, see <http://www.gnu.org/licenses/>.

## Rebrand the template repository.

import std/[os, strutils]

let input = commandLineParams()
if input.len != 3:
  echo "Usage: rebrand [PROJECT NAME] [AUTHOR] [DESCRIPTION]"
  quit 1

let name = input[0]
let author = input[1]
let description = input[2]

for file in ["README.md", "nimtemplate.nimble", "src/nimtemplate.nim", "src/nimtemplate/common.nim", "tests/test.nim", ".github/workflows/build.yml", ".github/workflows/documentation.yml", ".github/workflows/nim-run/action.yml"]:
  file.writeFile file.readFile.replace("nimtemplate", name)

for file in ["README.md", "nimtemplate.nimble", "src/nimtemplate.nim", "tests/test.nim", ".github/workflows/documentation.yml"]:
  file.writeFile file.readFile.replace("Gruruya", author)

for file in ["nimtemplate.nimble", "src/nimtemplate.nim", "src/nimtemplate/common.nim", "tests/test.nim", ".github/workflows/build.yml", ".github/workflows/documentation.yml", ".github/workflows/nim-run/action.yml"]:
  file.writeFile file.readFile.replace("Description of your program.", description)

moveFile("nimtemplate.nimble", name & ".nimble")
moveFile("src/nimtemplate.nim", "src/" & name & ".nim")
moveDir("src/nimtemplate", "src/" & name)

"rebrand.nim".writeFile "rebrand.nim".readFile.replace("nimtemplate", name)

echo "Done"
