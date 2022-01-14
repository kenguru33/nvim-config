# nvim-config

Neovim configuration with Lua

## Features

- Easy language server installation
- Autocompletion
- Formatting
- Linting
- Syntax highlighting with Treesitter
- Fuzzy finder functionality with Telescope
- Nice looking :-)

## Installation

**Prerequirements**
ripgrep (rg) - used by telescope

```bash
brew install rg
```

git - packer

```bash
brew install git
```

nodejs

```bash
brew install node
```

Typescript compiler (tsc) - Used by tsserver

```bash
npm install -g tsc
```

stylua - lua formatting

```bash
brew install stylua
```

prettier - formatting for many language

```bash
npm install -g prettier
```

NeoVim

```bash
brew install neovim
```

First time setup, run

```bash
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

Start using nvim

```bash
nvim
```
