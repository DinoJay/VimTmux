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
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
" color
Plugin 'Lokaltog/vim-distinguished'
Plugin 'Slava/vim-colors-tomorrow'
Plugin 'pangloss/vim-javascript'
" JSX Syntax highlighting
Plugin 'mxw/vim-jsx'
Plugin 'jelera/vim-javascript-syntax'

Plugin 'Raimondi/delimitMate'
"Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'

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

" ultisnips start
" Track the engine.
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
" show all search hits
set hlsearch
" and removes them when switch to insert mode
:set hlsearch
autocmd InsertEnter * :let @/=""
autocmd InsertLeave * :let @/=""
" set line length marker
set colorcolumn=80

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
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

" disable caps lock
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor
" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0
