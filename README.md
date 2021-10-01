# dot dot dot

built on [dotbot](https://github.com/anishathalye/dotbot)

## Install

```sh
./install
```

## To Complete Setup

### Font

This setup relies on `OperatorMono Nerd Font` - need to add that to system fonts.
Its set up by running patching `Operator Mono` via https://github.com/ryanoasis/nerd-fonts#font-patcher.
This is a requirement for `nvim-web-devicons` to work.

### nvim

### eslint_d

This relies on eslint_d, to install:

```sh
npm install -g eslint_d
```

#### Packer

Need to run PackerInstall first time opening `nvim`

```sh
:PackerInstall
```

#### TSInstall

```sh
:TSInstall javascript typescript json css scss yaml lua
```

#### LspInstall

```sh
:LspInstall typescript
```
