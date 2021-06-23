
# BUILDING

- [BUILDING](#building)
	- [Dependencies](#dependencies)
		- [Windows](#windows)
		- [OS *nix (Ubuntu)](#os-nix-ubuntu)
	- [Building](#building-1)


## [Dependencies](https://en.wikipedia.org/wiki/Dependency)

A program may require one or more other programs to run (the "dependencies").

 * [Graphviz](https://graphviz.org/)


### [Windows](https://www.microsoft.com/windows)

In [OS](https://en.wikipedia.org/wiki/Operating_system) [Windows](https://www.microsoft.com/windows) [Graphviz](https://graphviz.org/) can be installed via:

 * Manual install from [official website](https://graphviz.org/download/);
 * [chocolatey](https://community.chocolatey.org/packages/Graphviz) (needs to install it first, **plus** `choco.exe` needs to be in the [`PATH` environment variable](https://en.wikipedia.org/wiki/PATH_(variable))):

```bash
choco.exe install graphviz
```


### OS [*nix](https://en.wikipedia.org/wiki/Unix-like) (Ubuntu)

In [OS](https://en.wikipedia.org/wiki/Operating_system) [Ubuntu](https://ubuntu.com/) [Graphviz](https://graphviz.org/) can be installed via two simple [commands](https://en.wikipedia.org/wiki/Bash_(Unix_shell)):

```shell
$ sudo apt-get update -y
$ sudo apt-get install graphviz libgraphviz-dev pkg-config -y
```


## [Building](https://en.wikipedia.org/wiki/Software_build)

 * [Visual Studio Code](https://code.visualstudio.com/) (VS Code):
 * * Open this repository root folder as project;
 * * Press `Ctrl+Shift+B` to build.
 * [Windows](https://www.microsoft.com/windows):
 * * Run (Double-click of [LMB](https://en.wikipedia.org/wiki/LMB)) `./scripts/compile.bat` to build (will closes immediately in end).
 * [Ubuntu](https://ubuntu.com/):
 * * Run `./scripts/compile.sh` to build (will closes immediately in end).
