" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

" === Editing Plugins === "
" Fuzzy file and other searching
" relies on `brew install fzf` and `brew install ripgrep`
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Uses prettier if available
Plug 'prettier/vim-prettier'

" === Git Plugins === "
" Enable git changes to be shown in sign column
Plug 'mhinz/vim-signify'

" Fun git stuff, also necessary to show branch in airline
Plug 'tpope/vim-fugitive'

" === Language Server Configuration === "
" common configurations for Neovim's built-in language server client
Plug 'neovim/nvim-lspconfig'

" lightweight companion plugin for nvim-lspconfig
" adds the missing :LspInstall <language>
Plug 'kabouzeid/nvim-lspinstall'

" adds syntax highlighting based on tree-sitter
" :TSInstall javascript typescript json css scss yaml
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " updates the parsers on update

" Auto completion plugin for nvim
Plug 'hrsh7th/nvim-compe'

" === UI === "
" File explorer with git indications
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Colorscheme
Plug 'folke/tokyonight.nvim'

" Customized vim status line
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Initialize plugin system
call plug#end()
