" TODO: wrap in if clause
au BufNewFile,BufRead *.pl set filetype=prolog
au FileType prolog set foldmethod=syntax
au FileType prolog set foldnestmax=10
" au FileType prolog set nofoldenable
au FileType prolog set foldlevel=1
