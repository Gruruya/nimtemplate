# Copyright © 2023 Gruruya <gruruya.chi4c@slmails.com>
# SPDX-License-Identifier: AGPL-3.0-only

## This is just an example to get you started. You may wish to put all of your
## tests into a single file, or separate them into multiple `test1`, `test2`
## etc. files (better names are recommended, just make sure the name starts with
## the letter 't').
##
## To run these tests, simply execute `nimble test`.

import pkg/balls
import ../nimtemplate

suite "example":
  block operation:
    check 1 + 1 == 2
