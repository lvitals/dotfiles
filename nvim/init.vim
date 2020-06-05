" Vim-plug
" Automatic installaion of vim-plug
call plug#begin('~/.config/nvim/plugged')

" fzf is a general-purpose command-line fuzzy finder.
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" file manager nnn
Plug 'mcchrish/nnn.vim'

" theme
Plug 'mcmartelle/vim-monokai-bold'

" tabs
Plug 'ap/vim-buftabline'

call plug#end()

" A command-line fuzzy finder Ctrl+P
nmap <C-p> :FZF<CR>

" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
" nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.
"colorscheme onedark
colorscheme monokai-bold
set mouse=r " v or r

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =1000      " Only highlight the first 1000 columns.

set nowrap " turn off word wrap.
" set number " number line enable.

hi LineNr ctermfg=DarkGrey guifg=DarkGrey " Number line change color.

:map <C-a> GVgg " Select all text <Ctrl+a>.

set laststatus=2 " statusline enable

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Blue ctermfg=12 guifg=White ctermbg=15
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=Black ctermbg=0

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=Black ctermbg=0

" Formats the statusline
set statusline=%f                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
"set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor
set statusline+=%{StatuslineGit()}          " git brach


set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

if executable("rg")
    command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
          \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
          \   <bang>0 ? fzf#vim#with_preview('up:60%')
          \           : fzf#vim#with_preview('right:50%:hidden', '?'),
          \   <bang>0)

     nmap <C-S-f> :Rg 
endif

" Disable default mappings
let g:nnn#set_default_mappings = 0

" Opens the nnn window in a split
let g:nnn#layout = 'tabnew' " new or vnew, tabnew etc.

" Or pass a dictionary with window size
let g:nnn#layout = { 'left': '~20%' } " or right, up, down

" Floating window (neovim latest and vim with patch 8.2.191)
let g:nnn#layout = { 'window': { 'width': 0.8, 'height': 0.6, 'highlight': 'Debug' } }

" Start nnn in the current file's directory
nnoremap <silent> <C-d> :NnnPicker '%:p:h'<CR>

let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> <C-h> :bprev<CR>
