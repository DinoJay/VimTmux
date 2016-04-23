set foldmethod=manual

set foldlevelstart=1
set foldnestmax=2
set foldclose=all

let javaScript_fold=0

" line numbers
set number
"set relativenumber
set numberwidth=2

" Keep 8 lines above or below the cursor when scrolling.
set scrolloff=8

" Keep 15 columns next to the cursor when scrolling horizontally.
set sidescroll=1
set sidescrolloff=15

" Set minimum window size to 79x5.
set winwidth=79
set winheight=5
set winminheight=5

set relativenumber
set number


set hlsearch " show all search hits
set incsearch           " search as characters are entered
" Ignore case when searching.
set ignorecase

" Don't ignore case when search has capital letter (although also don't ignore case by default).
set smartcase

" Show mode in statusbar, not separately.
set noshowmode

" and removes them when switch to insert mode
autocmd InsertEnter * :let @/=""
autocmd InsertLeave * :let @/=""

" Disable any annoying beeps on errors.
set noerrorbells
set visualbell

" Don't parse modelines (google 'vim modeline vulnerability').
set nomodeline


" Enable mouse for scrolling and window resizing.
set mouse=a

" Disable swap to prevent annoying messages.
set noswapfile

" Save up to 100 marks, enable capital marks. TODO: understand
set viminfo='100,f1

" Use dash as word separator. TODO: understand
set iskeyword+=-

" Disable output, vcs, archive, rails, temp and backup files.
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

" TODO: watch for file changes of .vimrc
" autocmd BufWritePost ~/.vimrc source %

" vim indentations
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent


" Use Q to intelligently close a window (if there are multiple windows into
" the same buffer) or kill the buffer entirely if it's the last window looking
" into that buffer
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif
  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction
nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

" Use Silver Searcher for CtrlP plugin (if available) Fallback to git ls-files
" for fast listing. Because we use fast strategies, disable caching.
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git',
    \ 'cd %s && git ls-files . -co --exclude-standard',
    \ 'find %s -type f' ]
endif

" Make sure pasting in visual mode doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" for copying painless
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
" copy end


" Removes trailing spaces when writing
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

" Set window title by default.
set title

" open every file in split right
set splitright

" Send more characters to the terminal at once.
" Makes things smoother, will probably be enabled by my terminal anyway.
set ttyfast

" Stops macros rendering every step.
set lazyredraw

" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" If opening buffer, search first in opened windows.
set switchbuf=usetab

" Hide buffers instead of asking if to save them.
set hidden

" Wrap lines by default
set wrap linebreak
set showbreak=" "


" copy into global clipboard
set guioptions+=a
set clipboard=unnamedplus

let g:js_indent_log = 1

" spell check
autocmd BufRead,BufNewFile *.md setlocal spell

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

" set viewoptions-=options
" augroup vimrc
"     autocmd BufWritePost *
"     \   if expand('%') != '' && &buftype !~ 'nofile'
"     \|      mkview
"     \|  endif
"     autocmd BufRead *
"     \   if expand('%') != '' && &buftype !~ 'nofile'
"     \|      silent loadview
"     \|  endif
" augroup END

" autocmd BufWinLeave *.* mkview!
" autocmd BufWinEnter *.* silent loadview
set viewoptions=cursor,folds,slash,unix
