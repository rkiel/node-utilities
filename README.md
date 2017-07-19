## Introduction

This is a collection of simple command-line scripts, bash aliases, and bash utilities that make using `node` and `npm` even easier.

The command-line scripts include:

* sc - make working with "scripts" inside `package.json` easier

The command-line scripts are written in Ruby 2.x using just the standard libraries and do not require any gems to be installed.
For OS X users, these should just work out-of-box.

## Installation

Clone the repository

```
mkdir -p ~/GitHub/rkiel && cd $_
git clone https://github.com/rkiel/node-utilities.git
```

To add the scripts to your path, add the following to `.bash_profile`

```
export NODE_UTILITIES_BIN="~/GitHub/rkiel/node-utilities/bin"

export PATH=${NODE_UTILITIES_BIN}:$PATH
```

To enable tab completion for the `sc` script, add the following to `.bashrc`.

```
source ~/GitHub/rkiel/node-utilities/dotfiles/bashrc
```

## sc utility

### Usage

```unix
sc add [name] as [words...]
sc delete [name] (alias for remove)
sc help
sc init
sc list
sc remove [name]
sc show (alias for list)
sc tab [pattern]
```
