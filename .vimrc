" Comments in Vimscript start with a `"`.

"" kitty stuff
" mouse support
set mouse=a
set ttymouse=sgr
set balloonevalterm
" styled and colored underline support
let &t_au = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_us = "\e[4:2m"
let &t_cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_ds = "\e[4:5m"
let &t_ce = "\e[4:0m"
" strikethrough
let &t_ts = "\e[9m"
let &t_te = "\e[29m"
" truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_rf = "\e]10;?\e\\"
let &t_rb = "\e]11;?\e\\"
" bracketed paste
let &t_be = "\e[?2004h"
let &t_bd = "\e[?2004l"
let &t_ps = "\e[200~"
let &t_pe = "\e[201~"
" cursor control
let &t_rc = "\e[?12$p"
let &t_sh = "\e[%d q"
let &t_rs = "\ep$q q\e\\"
let &t_si = "\e[5 q"
let &t_sr = "\e[3 q"
let &t_ei = "\e[1 q"
let &t_vs = "\e[?12l"
" focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <focusgained>=\<esc>[i"
execute "set <focuslost>=\<esc>[o"
" window title
let &t_st = "\e[22;2t"
let &t_rt = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''


" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

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

if (empty($TMUX))
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


" figure out filetype on open
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
" set expandtab


call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Essentials
Plug 'morhetz/gruvbox'							" Proper groovy 
Plug 'tpope/vim-sensible'						" Better defaults
" We already have this hard-coded in .vim/plugged
" Plug 'preservim/nerdtree'						" Actual file browser

" Autocompletion
Plug 'prabirshrestha/asyncomplete.vim' 			" auto completions please
Plug 'prabirshrestha/vim-lsp'					" language server to provide them
Plug 'prabirshrestha/asyncomplete-lsp.vim'		" link ls to completions 
Plug 'mattn/vim-lsp-settings'					" install LS for open file 

" Other
Plug 'junegunn/vim-easy-align'					" Easy alignment as it should be
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'

" Kitty integration
Plug 'NikoKS/kitty-vim-tmux-navigator' 			" Navigation with Ctrl+hjkl
Plug 'sainnhe/gruvbox-material'					" match with kitty (easy on eyes)


call plug#end()

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

set background=dark
colorscheme gruvbox

