au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

" Tab specific option
au FileType haskell set tabstop=8                   "A tab is 8 spaces
au FileType haskell set expandtab                   "Always uses spaces instead of tabs

au FileType haskell set softtabstop=4               "Insert 4 spaces when tab is pressed
au FileType haskell set shiftwidth=4                "An indent is 4 spaces
au FileType haskell set shiftround                  "Round indent to nearest shiftwidth multiple
