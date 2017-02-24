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
" map <silent> <Leader>e :Errors<CR>
" map <silent> <leader>ln :lnext<CR>
" map <silent> <leader>lp :lprev<CR>

" neomake
let g:neomake_list_height = 2
let g:neomake_open_list = 2
let g:neomake_verbose = 3

nnoremap <Leader>m :lnext<CR>
nnoremap <Leader>n :lprevious<CR>
nnoremap <Leader>e :ll<CR>
nnoremap <Leader>n :lprevious<CR>

" you can set your enabled makers globally (like below) or on the buffer level as part of an autocmd - see Neomake docs for details
" let g:neomake_javascript_enabled_makers = ['eslint']
" " let g:neomake_jsx_enabled_makers = ['eslint']
"
" function! NeomakeESlintChecker()
"   let l:npm_bin = ''
"   let l:eslint = 'eslint'
"
"   if executable('npm')
"     let l:npm_bin = split(system('npm bin'), '\n')[0]
"   endif
"
"   if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
"     let l:eslint = l:npm_bin . '/eslint'
"   endif
"
"   let b:neomake_javascript_eslint_exe = l:eslint
" endfunction
" autocmd FileType javascript :call NeomakeESlintChecker()
"
" autocmd! BufWritePost,BufReadPost * Neomake

" when switching/opening a JS buffer, set neomake's eslint path, and enable it as a maker
"
" au BufEnter *.js let b:neomake_javascript_eslint_exe = nrun#Which('eslint')
" au BufEnter *.jsx let b:neomake_jsx_eslint_exe = nrun#Which('eslint')
" let g:neomake_javascript_eslint_exe = 'eslint_d'
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_jsx_enabled_makers = ['eslint']
" let g:neomake_jsx_eslint_exe = 'eslint_d'

" function! NeomakeESlintChecker()
"   let l:npm_bin = ''
"   let l:eslint = 'eslint'
"
"   if executable('npm-which')
"     let l:eslint = split(system('npm-which eslint'))[0]
"     return 0
"   endif
"
"   if executable('npm')
"     let l:npm_bin = split(system('npm bin'), '\n')[0]
"   endif
"
"   if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
"     let l:eslint = l:npm_bin . '/eslint'
"   endif
"
"   let b:neomake_javascript_eslint_exe = l:eslint
" endfunction
"
" autocmd FileType javascript :call NeomakeESlintChecker()
"
autocmd! BufWritePost,BufReadPost * Neomake

" autocmd! BufWritePost *.js silent! Neomake
" autocmd! BufWritePost *.jsx silent! Neomake

" autocmd! FileType javascript,BufWinEnter,BufWritePost * Neomake


" fast fold
let g:js_fold = 1

" deoplete
"
"
let g:deoplete#omni#functions = {}
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

let g:deoplete#omni#functions.javascript = [
      \ 'tern#Complete',
      \ 'jspc#omni'
      \]

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" deoplete tab-complete
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

let g:SuperTabDefaultCompletionType = '<c-n>'
" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
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

let g:mta_use_matchparen_group = 0
" let g:mta_set_default_matchtag_color = 0
highlight MatchTag ctermfg=white ctermbg=grey guifg=black guibg=lightgreen


"
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

let g:formatdef_eslint = '"eslint_d --stdin --fix-to-stdout --cache"'
let g:formatters_javascript = ['eslint']
" let g:autoformat_verbosemode=1
" au BufWritePre *.js :Fixmyjs
" au BufWritePre *.jsx :Fixmyjs
au BufWrite * :Autoformat
"

let g:neomake_error_sign = {
      \ 'text': '✗',
      \ 'texthl': 'ErrorMsg',
      \ }
hi MyWarningMsg ctermbg=3 ctermfg=0
let g:neomake_warning_sign = {
      \ 'text': '>>',
      \ 'texthl': 'MyWarningMsg',
      \ }

" function! Lint()
"   if &filetype =~ 'javascript'
"     Neomake eslint --fix
"   else
"     Neomake
"   end
" endfunction
"
" augroup lint_events
"   autocmd!
"   autocmd BufWritePost * call Lint()
" augroup end

" you can set your enabled makers globally (like below) or on the buffer level as part of an autocmd - see Neomake docs for details
let g:neomake_javascript_enabled_makers = ['eslint_d']
"  let g:neomake_javascript_eslint_exe =
" when switching/opening a JS buffer, set neomake's eslint path, and enable it as a maker
" au BufEnter *.js let b:neomake_javascript_eslint_exe = nrun#Which('eslint')
"
let g:used_javascript_libs = 'd3,react'
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction


map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)


" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1
" or just disable the preview entirely
autocmd BufEnter * set completeopt-=preview

