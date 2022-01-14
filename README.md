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

![](/Users/bernt/Library/Application%20Support/marktext/images/2022-01-14-12-20-16-image.png)

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

**NeoVim Setup**

Run headless installation

```bash
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

Congratulation! You now have å fully configured nvim setup.



Start nvim 

```bash
nvim
```
