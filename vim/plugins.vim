call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
"Plug 'sheerun/vimrc'
Plug 'bling/vim-airline'
Plug 'Valloric/YouCompleteMe'

" colors
Plug 'Lokaltog/vim-distinguished'
Plug 'Slava/vim-colors-tomorrow'
Plug 'sheerun/vim-wombat-scheme'
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'
Plug 'jdkanani/vim-material-theme'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jpo/vim-railscasts-theme'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/seoul256.vim'
Plug 'chriskempson/base16-vim'
Plug 'sjl/badwolf/'

Plug 'blueyed/vim-diminactive'

" TODO: not working
" Plug 'junegunn/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow'
" markdown
Plug 'shime/vim-livedown', {'for': 'markdown'}
Plug 'dag/vim2hs', {'for': 'haskell'}
" Plug 'junegunn/vim-pseudocl'
" Plug 'junegunn/vim-oblique'

Plug 'junegunn/vim-easy-align'
" change order of arguments
Plug 'PeterRincker/vim-argumentative'
" JSX Syntax highlighting
Plug 'mxw/vim-jsx'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'vim-scripts/JavaScript-Indent'
Plug 'pangloss/vim-javascript'
Plug 'lukaszb/vim-web-indent'

" Plug 'flowtype/vim-flow'

" json syntax
" Plug 'helino/vim-json'
Plug 'elzr/vim-json'
" Automatically match pairs intelligently.
Plug 'Raimondi/delimitMate'
"Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim' " Comment things out

"fuzzy finder
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'terryma/vim-expand-region'
" Indentation Highlighting
Plug 'Yggdroot/indentLine'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'marijnh/tern_for_vim'
" Plug 'scrooloose/nerdtree'
" Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'Valloric/MatchTagAlways'
Plug 'airblade/vim-gitgutter'

" stylesheet syntax highlighting
Plug 'groenewege/vim-less'
" Plug 'digitaltoad/vim-jade'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/html5-syntax.vim'
Plug 'othree/html5.vim'

Plug 'godlygeek/tabular'

Plug 'haya14busa/incsearch.vim'
"Plug 'plasticboy/vim-markdown'
Plug 'adimit/prolog.vim'
Plug 'EinfachToll/DidYouMean'
" smart pairs, easily select closures of brackets
Plug 'gorkunov/smartpairs.vim'
Plug 'tpope/vim-surround'
" repeat for plugins
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'

" color highlighting
Plug 'chrisbra/Colorizer'

" Meteor
Plug 'Slava/vim-spacebars'

" ultisnips start, not working yet
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'cmather/vim-meteor-snippets'

Plug 'maksimr/vim-jsbeautify'
Plug 'einars/js-beautify'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'adlawson/vim-sorcerer'

Plug 'edkolev/tmuxline.vim'
Plug 'ryanoasis/vim-devicons'
" Plug 'millermedeiros/vim-esformatter'

call plug#end()
