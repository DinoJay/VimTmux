" Plugins Settings

" ctrl-p ignore
set wildignore+=*/packages/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|packages)$'
let g:ctrlp_custom_ignore = '\v[\/]\.client/packages$'

" Airline
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" tagbar
nmap <C-t> :TagbarToggle<CR>

" Autocomplete
" let g:ycm_add_preview_to_completeopt=0
" let g:ycm_confirm_extra_conf=0
" set completeopt-=preview

" For autocompletion, complete as much as you can.
set wildmode=longest,full

" syntastic
" let g:syntastic_check_on_open=1
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_error_symbol = "✗"
" Syntastic Errors
map <silent> <Leader>e :Errors<CR>
map <silent> <leader>ln :lnext<CR>
map <silent> <leader>lp :lprev<CR>

" neomake
let g:neomake_list_height = 2
let g:neomake_open_list = 2
let g:neomake_verbose = 3
let g:neomake_javascript_eslint_exe = 'eslint_d'
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_jsx_eslint_exe = 'eslint_d'
autocmd! BufWritePost *.js silent! Neomake
autocmd! BufWritePost *.jsx silent! Neomake

" fast fold
let g:js_fold = 1

" deoplete
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" deoplete tab-complete
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

let g:SuperTabDefaultCompletionType = '<c-n>'

" neomake
" let g:neomake_javascript_enabled_makers = ['eslint']
" nmap <Leader><Space>o :lopen<CR>      " open location window
" nmap <Leader><Space>c :lclose<CR>     " close location window
" nmap <Leader><Space>, :ll<CR>         " go to current error/warning
" nmap <Leader><Space>n :lnext<CR>      " next error/warning
" nmap <Leader><Space>p :lprev<CR>      " previous error/warning
" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Match tags, TODO: check which plugin
let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'xhtml' : 1,
      \ 'xml' : 1,
      \ 'jinja' : 1,
      \ 'javascript' : 1,
      \}


" diminactive
" let g:diminactive_use_syntax = 1
let g:haskell_conceal=0

" indent guides
nnoremap <silent> <leader>ti :IndentGuidesToggle<CR>
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=1

" augroup indent_guide_settings
"   autocmd!
"   autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermfg=white ctermbg=234
"   autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=white ctermbg=236
" augroup END

" hayabusa incsearch
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)


" let g:fixmyjs_use_local = 1
" let g:fixmyjs_executable = 'path/to/eslint'
" let g:fixmyjs_engine = 'eslint'
" TODO: nasty hack
let g:fixmyjs_executable = '~/dev/home_page/node_modules/eslint/bin/eslint.js'
" let g:fixmyjs_executable = '~/node_modules/eslint/bin/eslint.js'

" au BufWrite * :Autoformat
au BufWritePre *.js :Fixmyjs
au BufWritePre *.jsx :Fixmyjs

" au BufWrite * :call JsBeautify()
" autocmd TextChanged <buffer> call JsBeautify()
"
function! Lint()
  if &filetype =~ 'javascript'
    Neomake eslint --fix
  else
    Neomake
  end
endfunction

augroup lint_events
  autocmd!
  autocmd BufWritePost * call Lint()
augroup end
