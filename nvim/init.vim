syntax on                  " Enable syntax highlighting.
filetype plugin indent on  " Load plugins according to detected filetype.

set nowrap
set laststatus=2
set encoding=UTF-8
set autoindent             " Indent according to previous line.
set copyindent
set expandtab              " Use spaces instead of tabs.
set preserveindent

set tabstop=4              " Tab key indents by 4 spaces.
set shiftwidth=0           " >> indents by 0 spaces.

set hidden                 " Switch between buffers without having to save first.
set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set wrapscan               " Searches wrap around end-of-file.
set report=0               " Always report changed lines.
set synmaxcol=1000         " Only highlight the first 1000 columns.

"set cursorline
set list
set listchars=tab:>-,trail:∙,extends:>,precedes:<,eol:⏎

if !has('gui_running')
  set t_Co=256
endif

if &term =~ '256color'
  " disable Background Color Erase (BCE)
  set t_ut=
endif

" plug-vim
source ~/.config/nvim/plug.vim

" Set config dadbod dbs
source ~/.config/nvim/dbs-config.vim

" Statusline
source ~/.config/nvim/statusline.vim

" Set shortcuts
source ~/.config/nvim/shortcuts.vim

