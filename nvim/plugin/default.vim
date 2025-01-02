set autoindent
set expandtab " Tab literal can be insterted with <C-i>
set tabstop=4

" Rg the word currently under cursor
nnoremap K :Rg -i <cword> <CR>
