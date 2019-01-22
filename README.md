## Introduction

This is a collection of simple command-line scripts, bash aliases, and bash utilities that make using `node` and `npm` even easier.

The command-line scripts include:

* sc - make working with "scripts" inside `package.json` easier

The command-line scripts are written in Ruby 2.x using just the standard libraries and do not require any gems to be installed.
For OS X users, these should just work out-of-box.

## Installation

Node Version Manager

Install Node using the [Node Version Manager](docs/NVM.md)

Clone this repository

```
mkdir -p ~/GitHub/rkiel && cd $_
git clone https://github.com/rkiel/node-utilities.git
```

To update your `.bash_profile` and `.bashrc`.

```
cd ~/GitHub/rkiel/node-utilities
./install/bin/setup
```

## sc utility

### Usage

```unix
sc add [name] as [words...[then||and||or]]
sc delete [name] (alias for remove)
sc help
sc init
sc list
sc remove [name]
sc show (alias for list)
sc tab [pattern]
```
