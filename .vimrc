set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo


" a universal set of defaults that (hopefully) everyone can agree on.
Plugin 'tpope/vim-sensible'
"Plugin 'sheerun/vimrc'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
" color
Plugin 'Lokaltog/vim-distinguished'
Plugin 'Slava/vim-colors-tomorrow'
Plugin 'sheerun/vim-wombat-scheme'

Plugin 'pangloss/vim-javascript'
" JSX Syntax highlighting
Plugin 'mxw/vim-jsx'
Plugin 'jelera/vim-javascript-syntax'

Plugin 'Raimondi/delimitMate'
"Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'

Plugin 'terryma/vim-expand-region'
" Indentation Highlighting
Plugin 'Yggdroot/indentLine'
Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/MatchTagAlways'

" stylesheet syntax highlighting
Plugin 'groenewege/vim-less'
Plugin 'digitaltoad/vim-jade'
Plugin 'mustache/vim-mustache-handlebars'

Plugin 'godlygeek/tabular'

"Plugin 'plasticboy/vim-markdown'
Plugin 'adimit/prolog.vim'
Plugin 'EinfachToll/DidYouMean'
" smart pairs, easily select closures of brackets
Plugin 'gorkunov/smartpairs.vim'
Plugin 'tpope/vim-surround'
" repeat for plugins
Plugin 'tpope/vim-repeat'

" color highlighting
Plugin 'chrisbra/Colorizer'

" Meteor
Plugin 'Slava/vim-spacebars'

" ultisnips start, not working yet
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'cmather/vim-meteor-snippets'

" js beautify
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ultisnips end


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
filetype on
" These are the tweaks I apply to YCM's config, you don't need them but
" they might help. YCM gives you popups and splits by default that
" some people might not like, so these should tidy it up a bit for you.

" Autocomplete
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_python_checkers = ['flake8']

" vim indentations
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

" Airline
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" leader key
let mapleader = ","
" NERDTree
map <C-n> :NERDTreeToggle<CR>

" tagbar
nmap <C-t> :TagbarToggle<CR>

set term=screen-256color

set t_Co=256
let g:tomorrow_termcolors=256
syntax enable
set background=dark
colorscheme tomorrow

" show whitespace
set list

" indent lines setup
let g:indentLine_color_dark = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '|'

" line numbers
set number
"set relativenumber
:set numberwidth=2

" insert new line without entering insert mode
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k
" insert new line above current line
:nnoremap <NL> i<CR><ESC>

" Removes trailing spaces when writing
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" copy into global clipboard
set guioptions+=a
set clipboard=unnamedplus

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

" Match tags
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript' : 1,
\}

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

" highlight crusor
"highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

" disable caps lock
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

"Automatically create directories for backup and undo files
"if !isdirectory(expand(s:dir))
  "call system("mkdir -p " . expand(s:dir) . "/{backup,undo}")
"end

" Keep 8 lines above or below the cursor when scrolling.
set scrolloff=8

" Keep 15 columns next to the cursor when scrolling horizontally.
set sidescroll=1
set sidescrolloff=15

" Set minimum window size to 79x5.
set winwidth=79
set winheight=5
set winminheight=5

" If opening buffer, search first in opened windows.
set switchbuf=usetab

" Hide buffers instead of asking if to save them.
set hidden

" Wrap lines by default
set wrap linebreak
set showbreak=" "

" Allow easy navigation between wrapped lines.
vmap j gj
vmap k gk
nmap j gj
nmap k gk

" For autocompletion, complete as much as you can.
set wildmode=longest,full

" Disable any annoying beeps on errors.
set noerrorbells
set visualbell

" Don't parse modelines (google 'vim modeline vulnerability').
set nomodeline

"Do not fold by default. But if, do it up to 3 levels.
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" Enable mouse for scrolling and window resizing.
set mouse=a

" Disable swap to prevent annoying messages.
set noswapfile

" Save up to 100 marks, enable capital marks. TODO: understand
set viminfo='100,f1


" show all search hits
set hlsearch

" Ignore case when searching.
set ignorecase

" Don't ignore case when search has capital letter (although also don't ignore case by default).
set smartcase

" Show mode in statusbar, not separately.
set noshowmode

" and removes them when switch to insert mode
:set hlsearch
autocmd InsertEnter * :let @/=""
autocmd InsertLeave * :let @/=""

" set line length marker
set colorcolumn=80

" Use dash as word separator. TODO: understand
set iskeyword+=-

" Disable output, vcs, archive, rails, temp and backup files.
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

" Auto center on matched string.
noremap n nzz
noremap N Nzz

" Visually select the text that was last edited/pasted (Vimcast#26).
noremap gV `[v`]

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

" Set window title by default.
set title

" Always focus on splited window.
nnoremap <C-w>s <C-w>s<C-w>w
nnoremap <C-w>v <C-w>v<C-w>w

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

" Prevent common mistake of pressing q: instead :q
map q: :q

" Make a simple 'search' text object.
" http://vim.wikia.com/wiki/Copy_or_change_search_hit It allows for replacing
" search matches with cs and then /././.
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

