# nimtemplate:scroll:

A template to jump start your Nim library or project.

* Tests using [balls](https://github.com/disruptek/balls)
* Github Actions workflows
  * Runs tests
  * Builds and deploys [docs](https://Gruruya.github.io/nimtemplate/nimtemplate.html) on GitHub Pages

_Click [here](../../../nimtemplate/generate) to begin_  

---
[![GitHub CI](../../actions/workflows/build.yml/badge.svg)](../../actions/workflows/build.yml)
[![Minimum supported Nim version](https://img.shields.io/badge/Nim-1.6.11+-informational?logo=Nim&labelColor=232733&color=F3D400)](https://nim-lang.org)
[![License](https://img.shields.io/github/license/Gruruya/nimtemplate?logo=GNU&logoColor=000000&labelColor=FFFFFF&color=663366)](LICENSE.md)

Usage
---
Pick a new name, do note that the module's name has to be a valid Nim identifier, for instance it can't have a `-` in it.  
```sh
## Pick a NEWNAME and change from nimtemplate to it
sed -i 's/nimtemplate/NEWNAME/g' README.md nimtemplate.nimble src/nimtemplate.nim tests/test.nim .github/workflows/documentation.yml  
rename nimtemplate NEWNAME * src/*

## Swap-out my GitHub username for your USERNAME
sed -i 's/Gruruya/USERNAME/g' README.md  
```
License
---
Distributed under the AGPL-3.0-only License. See [LICENSE.md](LICENSE.md) for more information.  

Do note this template is not licensed under the AGPL-3.0, it's just a template for making a project which is.  
You can change the license freely in your generated project.  
The template itself should be considered as being under the [CC0](https://creativecommons.org/publicdomain/zero/1.0/) license and in the public domain.
