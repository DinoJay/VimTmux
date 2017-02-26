" leader key
let mapleader = ","
" let mapleader = "\<Space>"

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

" map! ü <C-]>
" map! ö [
" map! ä ]
" map! Ö {
" map! Ä }
" map! ß /

nnoremap j gj
nnoremap k gk

" cnoremap ö [
" cnoremap ä ]

autocmd BufNewFile,BufRead *.less set filetype=less
autocmd FileType less set omnifunc=csscomplete#CompleteCSS


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

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
      \|    if empty(bufname('%'))
        \|        browse confirm write
        \|    else
          \|        confirm write
          \|    endif
          \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>

function! GetVisual() range
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save
  return selection
endfunction

vmap <leader>z :%s/<c-r>=GetVisual()<cr>/

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

