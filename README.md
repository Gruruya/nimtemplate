[
: Copyright © 2023 Gruruya <gruruya.chi4c@slmails.com>
: SPDX-License-Identifier: CC-BY-SA-4.0
]:#

# nimtemplate:scroll:

A template to jump start your Nim library or project.

* Tests using [balls](https://github.com/disruptek/balls/)
* GitHub Actions [workflows](https://github.com/Gruruya/nimtemplate/actions/)
  * Runs tests on multiple OSes and ISAs
  * Builds and deploys [API reference on GitHub Pages](https://Gruruya.github.io/nimtemplate/nimtemplate.html)
  * License header [REUSE](https://reuse.software/faq/) linting

_Click [here](https://github.com/Gruruya/nimtemplate/generate) to begin_

---
[![GitHub CI](https://github.com/Gruruya/nimtemplate/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/Gruruya/nimtemplate/actions/workflows/build.yml?query=branch%3Amaster)
[![Minimum supported Nim version](doc/badge-Nim-version.svg)](https://nim-lang.org/)
[![License](doc/badge-AGPL-3.0.svg)](LICENSES/AGPL-3.0-only.md)

Usage
---
You're gonna want to change the names in the project. I made a small utility for this, you can use it this way:
```sh
nim r rebrand.nim PROJECT_NAME AUTHOR EMAIL
```

#### Note on the licenses
You can change the licenses freely in your project generated with this template.
