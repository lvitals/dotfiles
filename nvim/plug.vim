call plug#begin('~/.config/nvim/plugged')

" fzf is a general-purpose command-line fuzzy finder.
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

"Shows a git diff summary in the sign column and stages/reverts individual hunks
Plug 'airblade/vim-gitgutter'

" using nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Themes
Plug 'tomasiser/vim-code-dark', { 'name': 'codedark' }

" buffer list that lives in the tabline
Plug 'ap/vim-buftabline'

" Dadbod is a Vim plugin for interacting with databases.
Plug 'kristijanhusak/vim-packager', { 'type': 'opt' }
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" Initialize plugin system
call plug#end()

" Config plugins

" Set theme
colorscheme codedark

" Set NERDTree
let g:NERDTreeMinimalUI = v:true
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeStatusline = "%{exists('g:NERDTreeFileNode')&&" .
      \ "has_key(g:NERDTreeFileNode.GetSelected(),'')?" .
      \ "g:NERDTreeFileNode.GetSelected().path.getLastPathComponent(0):''}"

" Set dadbod
let g:db_ui_auto_execute_table_helpers = 1
let g:db_ui_show_help = 0
let g:db_ui_default_query = 'select * from "{table}" limit 200'
let g:db_ui_save_location = '~/.local/share/db_ui'
