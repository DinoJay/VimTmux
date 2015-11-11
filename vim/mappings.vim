" leader key
let mapleader = ","

" insert new line without entering insert mode
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k
" insert new line above current line
:nnoremap <NL> i<CR><ESC>


nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" disable arrow keys in normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" copy to end of line
map Y y$

" disable Ex mode
map Q <Nop>

" rename all words under cursor
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

"Automatically create directories for backup and undo files
"if !isdirectory(expand(s:dir))
  "call system("mkdir -p " . expand(s:dir) . "/{backup,undo}")
"end

" Allow easy navigation between wrapped lines.
vmap j gj
vmap k gk
nmap j gj
nmap k gk


" Auto center on matched string.
noremap n nzz
noremap N Nzz

" Visually select the text that was last edited/pasted (Vimcast#26).
noremap gV `[v`]

" Always focus on splited window.
nnoremap <C-w>s <C-w>s<C-w>w
nnoremap <C-w>v <C-w>v<C-w>w

" Prevent common mistake of pressing q: instead :q
map q: :q

" Make a simple 'search' text object.
" http://vim.wikia.com/wiki/Copy_or_change_search_hit It allows for replacing
" search matches with cs and then /././.
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" remap vim annoyance
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>

set splitbelow
set splitright

map f {{)
map ö }}(


" TODO: find better way
autocmd FileType javascript vnoremap <buffer> <silent> <leader> f :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <silent> <leader> f :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <buffer> <silent> f :call RangeCSSBeautify()<cr>

autocmd BufNewFile,BufRead *.less set filetype=less
autocmd FileType less set omnifunc=csscomplete#CompleteCSS

" Syntastic Errors
map <silent> <Leader>e :Errors<CR>

" easy align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" highlight last inserted text
nnoremap gV `[v`]

" python json formatting
" map <silent> <Leader>j !python -m json.tool<CR>
map <Leader>j %!python -m json.tool<CR>

" for vim unimpaired
" nmap < [
" nmap > ]
" omap < [
" omap > ]
" xmap < [
" xmap > ]
