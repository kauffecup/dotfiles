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
" Intellisense Engine
" Run `:CocInstall coc-tsserver coc-eslint coc-json coc-prettier coc-css`
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Fuzzy file and other searching
" relios on `brew install fzf` and `brew install ripgrep`
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" === Git Plugins === "
" Enable git changes to be shown in sign column
Plug 'mhinz/vim-signify'

" Fun git stuff, also necessary to show branch in airline
Plug 'tpope/vim-fugitive'

" === Syntax Highlighting === "
" All the things
Plug 'sheerun/vim-polyglot'

" === UI === "
" File explorer with git indications
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Colorscheme
Plug 'https://github.com/joshdick/onedark.vim.git'

" Customized vim status line
Plug 'vim-airline/vim-airline'

" Initialize plugin system
call plug#end()
