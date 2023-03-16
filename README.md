# nimtemplate:scroll:

A template to jump start your Nim library or project.

* Tests using [balls](https://github.com/disruptek/balls)
* Github Actions [workflows](../../actions)
  * Runs tests
  * Builds and deploys [docs on GitHub Pages](https://Gruruya.github.io/nimtemplate/nimtemplate.html)

_Click [here](../../../nimtemplate/generate) to begin_  

---
[![GitHub CI](../../actions/workflows/build.yml/badge.svg)](../../actions/workflows/build.yml)
[![Minimum supported Nim version](https://img.shields.io/badge/Nim-1.6.11+-informational?logo=Nim&labelColor=232733&color=F3D400)](https://nim-lang.org)
[![License](https://img.shields.io/github/license/Gruruya/nimtemplate?logo=GNU&logoColor=000000&labelColor=FFFFFF&color=663366)](LICENSE.md)

Usage
---
Pick a new project name, note that the resulting module's name has to be a valid Nim identifier, for instance it can't have a `-` in it.  
```sh
nimble prepare PROJNAME GITHUBUSER
```

License
---
Distributed under the AGPL-3.0-only License. See [LICENSE.md](LICENSE.md) for more information.  

You can change the license freely in your generated project.  
