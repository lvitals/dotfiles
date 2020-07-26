
function! InsertStatuslineColor(mode)
    if a:mode == 'i'
        hi statusline guibg=Blue ctermfg=7 guifg=White ctermbg=55
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
au InsertLeave * hi statusline guibg=Blue ctermfg=7 guifg=Front ctermbg=25

" default the statusline to green when entering Vim
hi statusline guibg=Blue ctermfg=7 guifg=Front ctermbg=25

" Formats the statusline
set statusline=%f\                                  " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'},     " file encoding
set statusline+=%{&ff}]                             " file format
set statusline+=%y                                  " filetype
set statusline+=%h                                  " help file flag
set statusline+=%m                                  " modified flag
set statusline+=%r\                                 " read only flag
set statusline+=%=                                  " align left
set statusline+=Col:%c\                             " current column
set statusline+=Line:%l/%L[%p%%]                    " line X of Y [percent of file]
"set statusline+=Buf:%n                              " Buffer number
"set statusline+=[%b][0x%B]                          " ASCII and byte code under cursor
set statusline+=%{StatuslineGit()}                  " git brach

