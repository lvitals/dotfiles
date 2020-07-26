" Set shortcuts
nnoremap <silent> <C-b> :NERDTreeToggle<cr>
nnoremap <silent> <C-l> :DBUIToggle<cr>
nnoremap <silent> <C-q> :bdelete <cr>
nnoremap <silent> <C-Right> :bnext <cr>
nnoremap <silent> <C-Left> :bprevious <cr>
nnoremap <silent> <C-s> :w! <cr>
nnoremap <silent> <C-p> :FZF <cr>
nnoremap <silent> <C-c> :Commits <cr>
nnoremap <silent> <C-t> :terminal <cr>

" Exit from terminal buffer (Neovim) more easily (remaps Esc key in
" terminal)
tnoremap <Esc> <C-\><C-n>
tnoremap <silent> <C-q> <C-\><C-n>:bdelete! <cr>

" Move between windows exactly the same way as usual
tnoremap <C-j><C-k> <C-\><C-N>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" Set command
"Remove all trailing whitespace
func! DeleteTrailingWS()
    exe "normal mz" 
    %s/\s\+$//
    exe "normal `z"
endfunc
command CleanWhiteSpaceLines :call DeleteTrailingWS()

