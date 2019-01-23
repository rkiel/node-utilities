### Node Version Manager (nvm)

This blog article discusses nvm in more detail: [Installing Node.js Tutorial: Using nvm](https://nodesource.com/blog/installing-node-js-tutorial-using-nvm-on-mac-os-x-and-ubuntu/)

Remember which version, if any, you already have installed and where it is installed. This will be known at the system version.

```bash
node --version
which node
```

#### Installation

Check the [Node Version Manager home page](https://github.com/creationix/nvm) for the latest installation version and instructions.

```bash
NVM=v0.34.0
```

The following script clones the nvm repository to `~/.nvm`.

```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/$NVM/install.sh | bash
```

The previous script also adds the following source line to your profile (`~/.bash_profile`,`~/.zshrc`,`~/.profile`, or`~/.bashrc`).

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
```

#### Verification

Open another bash terminal.

```bash
nvm --version
```

#### Install the latest Node 8.x

Show which versions are available.

```bash
nvm ls-remote | grep v8.
```

```bash
NODE8=8.
```

Install the specific version. For example,

```bash
nvm install $NODE8
```

#### Install the latest Node 10.x

Show which versions are available.

```bash
nvm ls-remote | grep v10.
```

```bash
NODE10=10.
```

Install the specific version. For example,

```bash
nvm install $NODE10
```

#### Choose your default Node version

This will be the version that is enabled whenever you open a new bash terminal.

```bash
nvm alias default $NODE8

nvm alias default $NODE10

nvm alias default system
```

#### Show installed versions

Use `ls` to show which versions you have installed locally on your machine.

```bash
nvm ls
```

#### Switch between versions

Use `use` to switch between versions. The effect of this command is within just the specific bash terminal.

```bash
nvm use $NODE8

nvm use $NODE10

nvm use system
```
