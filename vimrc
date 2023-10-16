" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
"
"
"------------------------------------------------------------------
"Used this vimrc file from the Missing Semester-- dated 13-9-2020
"
"
" Disable compatibility with vi to avoid unexpected issues
set nocompatible
" Enable filetype detection
filetype on
" Turn on syntax highlighting.
syntax enable

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" Set shiftwidth to 4 spaces
set shiftwidth=4

" Set tab width to 4 spaces
set tabstop=4


" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Enable indentation after a loop, function, etc
set smartindent
set autoindent

" Enable the autocompletion menu after pressing TAB in the command mode
set wildmenu

" Make wildmenu behave like Bash completion
set wildmode=list:longest

" Ignore the following filetypes while in the wildmode completion
set wildignore=*.docx,*.jpg,*.png,*pyc,*exe,*.out


" -----------------------------------MAPPINGS --------------------------------
" Remapping the leader key to spacebar
let mapleader = " "
" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

"Some remaps for the NERDTreeFocus plugin
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l



"Config for spell checks and to navigate them
"[s jumps to the previous spelling mistake, picks the
"first suggestion 1z= and then jumps back `]a
"<c-g>u makes it possible to undo
"setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" -----------------------------------PLUGINS --------------------------------
call plug#begin('~/.vim/plugged')
  Plug 'dense-analysis/ale'
  " Pear tree-- a plugin for pairing various brackets
  Plug 'tmsvg/pear-tree'
  " A plugin for a nice statusline
  Plug 'vim-airline/vim-airline'
call plug#end()
" The stuff to include Vundle and install plugins
" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'

" Pear tree -- a powerful VIM auto-pair plugin
" Plugin 'tmsvg/pear-tree'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" Plugin 'https://github.com/tpope/vim-fugitive'
"
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"Plugin 'valloric/youcompleteme'
" Plugin 'scrooloose/nerdtree'
" Plugin 'bling/vim-airline'

"Installing vimtex and come customization
" Plugin 'lervag/vimtex'
" let g:tex_flavor='latex'
" let g:vimtex_quickfix_mode=0
" set conceallevel=1
" let g:tex_conceal='abdmg'
" 
" "Installing and setting some stuff for code snippets
" Plugin 'sirver/ultisnips'
" let g:UltiSnipsExpandTrigger = '<tab>'
" let g:UltiSnipsJumpForwardTrigger = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" 
" "Plugin for python lsp
" Plugin 'davidhalter/jedi-vim'
" 
" " All of your Plugins must be added before the following line
" call vundle#end()            " required
" Enable plugins and load them for the detected filetype
filetype plugin on
" Load and indent file for the detected filetype
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line"


" -----------------------------------VIMSCRIPT --------------------------------

" Enable code folding
augroup filtype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END


colorscheme monokai
