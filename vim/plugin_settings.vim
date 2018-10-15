" Plugins Settings

" let g:ctrlp_map = '<c-y>'
" ctrl-p ignore
" set wildignore+=*/packages/*,*.so,*.swp,*.zip
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|packages)$'
" let g:ctrlp_custom_ignore = '\v[\/]\.client/packages$'

" Airline
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#fnamemod = ':.'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline_section_x=''
let g:airline_section_b=''
let g:airline_section_b=''
let g:airline_section_z=''
let g:airline_skip_empty_sections = 1
" set title

" tagbar
nmap <C-t> :TagbarToggle<CR>

" if executable('rg')
"   set grepprg=rg\ --color=never
"   let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
"   let g:ctrlp_use_caching = 0
" endif


" Autocomplete
" let g:ycm_add_preview_to_completeopt=0
" let g:ycm_confirm_extra_conf=0
" set completeopt-=preview

" For autocompletion, complete as much as you can.
set wildmode=longest,full


" neomake
" let g:neomake_list_height = 2
" let g:neomake_open_list = 2
" let g:neomake_verbose = 3

nnoremap <Leader>m :lnext<CR>
nnoremap <Leader>n :lprevious<CR>
nnoremap <Leader>e :ll<CR>
nnoremap <Leader>n :lprevious<CR>

" map <Leader> <Plug>(easymotion-prefix)

" you can set your enabled makers globally (like below) or on the buffer level as part of an autocmd - see Neomake docs for details
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_jsx_enabled_makers = ['eslint']
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
" autocmd! BufWritePost,BufReadPost * Neomake
"
" autocmd! BufWritePost *.js silent! Neomake eslint
" autocmd! BufWritePost *.jsx silent! Neomake eslint

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
let g:UltiSnipsExpandTrigger="<C-l>"
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



" let g:formatdef_eslint = '"eslint_d --stdin --fix-to-stdout --cache"'
" let g:formatters_javascript = ['eslint']
" let g:autoformat_verbosemode=1
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * Neoformat
" augroup END
autocmd BufWritePre *.{js,jsx,ts,tsx} ALEFix

" let g:neoformat_enabled_javascript = ['eslint_d']
" let g:neoformat_enabled_jsx = ['eslint_d']
" let g:neoformat_enabled_js = ['eslint_d']
" let g:neoformat_enabled_html = ['tidy']

" autocmd FileType javascript setlocal formatprg=prettier_dnc\ --local-only\ --pkg-conf\ --fallback
" autocmd BufWritePre,TextChanged,InsertLeave *.jsx Neoformat

" Use formatprg when available
" let g:neoformat_try_formatprg = 1
" https://github.com/sbdchd/neoformat/issues/25
" let g:neoformat_only_msg_on_error = 1


" let g:neomake_error_sign = {
"       \ 'text': '✗',
"       \ 'texthl': 'ErrorMsg',
"       \ }
" hi MyWarningMsg ctermbg=3 ctermfg=0
" let g:neomake_warning_sign = {
"       \ 'text': '>>',
"       \ 'texthl': 'MyWarningMsg',
"       \ }

let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'sass': ['prettier']
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'sass': ['prettier']
\}
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 10
" let g:ale_lint_on_insert_leave = 1
" let g:ale_lint_on_text_changed = 'never'

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

" function! neoformat#formatters#javascript#prettiereslint() abort
"     return {
"         \ 'exe': 'prettier-eslint',
"         \ 'args': ['--stdin'],
"         \ 'stdin': 1,
"         \ }
" endfunction

" you can set your enabled makers globally (like below) or on the buffer level as part of an autocmd - see Neomake docs for details
" let g:neomake_javascript_enabled_makers = ['prettiereslint']
" let g:neomake_html_enabled_makers = ['tidy', 'jsbeautify']
" let g:neomake_php_enabled_makers = ['tidy', 'jsbeautify']
" load local eslint in the project root
" modified from https://github.com/mtscout6/syntastic-local-eslint.vim
" let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
" let g:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

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



" let g:fzf_layout = { 'down': '~20%' }
" let g:fzf_files_options =
"       \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" [Buffers] Jump to the existing window if possible
" let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
" let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" command! -bang FLines call fzf#vim#grep(
"       \ 'grep -vnITr --color=always --exclude-dir=".svn" --exclude-dir=".git" --exclude=tags --exclude=*\.pyc --exclude=*\.exe --exclude=*\.dll --exclude=*\.zip --exclude=*\.gz "^$" --exclude=*\node_modules/*',
"       \ 0,
"       \ {'options': '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'})
"
" nnoremap <silent> <leader>e :FLines<cr>

" This is the default extra ke plit-window -h
" let g:fzf_action = {
"   \ 'ctrl-x': '',
"   \ 'ctrl-v': '' }

" Default fzf layout
" - down / up / left / right
"
" In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': '10split enew' }

" This is the default extra key bindings
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

function! s:find_root()
  for vcs in ['.git', '.svn', '.hg']
    let dir = finddir(vcs.'/..', ';')
    if !empty(dir)
      execute 'FZF' dir
      return
    endif
  endfor
  FZF
endfunction

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()


" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --ignore-case --hidden --follow '.shellescape(<q-args>), 1,  {'dir': s:find_git_root(), 'options': g:fzf_files_options})

set grepprg=rg\ --vimgrep
" ,ctrl-x:execute(tmux split-window nvim {})
command! -bang -nargs=* Rg
\ call fzf#run({ 'down': '20%', 'options':
\ '--bind "ctrl-v:execute(tmux split-window -h -f -l 90 nvim {}),enter:execute(tmux select-pane -m nvim {})+abort"', 'sink': 'e'})


" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
" command! -bang -nargs=* Rg
"       \ call fzf#vim#grep(
"       \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1, fzf#vim#with_preview({ 'bottom': '50%', 'dir': s:find_git_root() }),
" \ <bang>0)

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading '.shellescape(<q-args>), 1, fzf#vim#with_preview({ 'bottom': '50%', 'dir': s:find_git_root() }),
      \   <bang>0)


nmap <C-p> :Rg<CR>


" nmap <C-p> :FZF<CR>



" quickfix window
let g:qf_auto_resize=1
let g:qf_max_height=100
let g:qf_loclist_window_bottom=0
" let g:qf_loclist_window_bottom=1
" au! cursormoved * call PoppyInit()
"
"
aug QFClose
 au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" TODO: enable in normal mode
nnoremap } :Vertical f<cr>
nnoremap { :Vertical b<cr>

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.tsx"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb'

let g:clever_f_across_no_line = 1
let g:clever_f_timeout_ms = 3000
