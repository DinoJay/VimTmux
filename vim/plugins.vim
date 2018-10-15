call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
"Plug 'sheerun/vimrc'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" colors
Plug 'Lokaltog/vim-distinguished'
Plug 'Slava/vim-colors-tomorrow'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'sheerun/vim-wombat-scheme'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'w0ng/vim-hybrid'
Plug 'jdkanani/vim-material-theme'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jpo/vim-railscasts-theme'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/seoul256.vim'
Plug 'chriskempson/base16-vim'
Plug 'sjl/badwolf/'
Plug 'adlawson/vim-sorcerer'
Plug 'rakr/vim-two-firewatch'
Plug 'rakr/vim-one'
Plug 'lifepillar/vim-solarized8'
Plug 'trevordmiller/nova-vim'
Plug 'mhartington/oceanic-next'

Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}


Plug 'blueyed/vim-diminactive'
Plug 'morhetz/gruvbox'
Plug 'roosta/vim-srcery'
Plug 'jacoborus/tender'
Plug 'xolox/vim-misc'
Plug 'kamwitsta/mythos'
Plug 'kamwitsta/nordisk'
Plug 'mhartington/oceanic-next'

Plug 'vim-scripts/vim-colorscheme-switcher'
" TODO: not working
" Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'luochen1990/rainbow'
" markdown
Plug 'shime/vim-livedown', {'for': 'markdown'}
Plug 'dag/vim2hs', {'for': 'haskell'}
" Plug 'junegunn/vim-pseudocl'
" Plug 'junegunn/vim-oblique'

" Plug 'junegunn/vim-easy-align'
" change order of arguments
Plug 'PeterRincker/vim-argumentative'
" JSX Syntax highlighting
Plug 'Konfekt/FastFold'
" Plug 'vim-scripts/JavaScript-Indent'
Plug 'ervandew/supertab'
" Plug 'bigfish/vim-js-context-coloring'
" Plug 'jason0x43/vim-js-indent'
" Plug 'lukaszb/vim-web-indent'

Plug 'mbbill/undotree'
Plug 'vim-scripts/restore_view.vim'
" Plug 'accelerate-smooth-scroll'

Plug 'rbong/vim-vertical'
Plug 'joeytwiddle/sexy_scroller.vim'

" Plug 'flowtype/vim-flow'

" json syntax
" Plug 'helino/vim-json'
Plug 'elzr/vim-json'
" Automatically match pairs intelligently.
Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim' " Comment things out

"fuzzy finder
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Plug 'FelikZ/ctrlp-py-matcher'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'terryma/vim-expand-region'
" Indentation Highlighting
" Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'airblade/vim-rooter'

" TODO: does not work under neovim unstable
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'marijnh/tern_for_vim', { 'do': 'npm i', 'for': 'javascript'}
" Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
"
Plug 'pangloss/vim-javascript'
Plug 'gavocanov/vim-js-indent'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'

" Plug 'othree/yajs.vim'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'neoclide/vim-jsx-improve'
" Plug 'neovim/node-host', { 'do': 'npm install' }
" Plug 'billyvg/tigris.nvim', { 'do': './install.sh' }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug '1995eaton/vim-better-javascript-completion', { 'for': [ 'javascript', 'js', 'jsx' ]}
" Plug 'chemzqm/vim-jsx-improve', { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug 'gavocanov/vim-js-indent', { 'for': [ 'javascript', 'js', 'jsx' ]}

" Toolkit - no syntax highlighting https://github.com/moll/vim-node
Plug 'moll/vim-node', { 'for': [ 'javascript', 'js', 'jsx' ]}

" Plug 'chemzqm/vim-jsx-improve', { 'for': [ 'javascript', 'js', 'jsx' ]}

Plug 'scrooloose/nerdtree'
" Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
" Plug 'scrooloose/syntastic'
" Plug 'benekastah/neomake'
Plug 'w0rp/ale'
Plug 'romainl/vim-qf'
" Plug 'blueyed/vim-qf_resize'
Plug 'othree/fecompressor.vim'


Plug 'majutsushi/tagbar'
Plug 'Valloric/MatchTagAlways'
Plug 'othree/xml.vim'
Plug 'airblade/vim-gitgutter'
Plug 'haya14busa/vim-asterisk'

" stylesheet syntax highlighting
" Plug 'groenewege/vim-less'
" Plug 'digitaltoad/vim-jade'
" Plug 'mustache/vim-mustache-handlebars'
" Plug 'othree/html5-syntax.vim'
" Plug 'othree/html5.vim'
" Plug 'othree/yajs.vim'
Plug 'vim-scripts/SyntaxComplete'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'bounceme/poppy.vim'


Plug 'christoomey/vim-tmux-navigator'
Plug 'gcmt/taboo.vim'
" Plug 'LeonB/HTML-AutoCloseTag'

Plug 'alvan/vim-closetag'
Plug 'tpope/vim-ragtag'

Plug 'godlygeek/tabular'

Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
"Plug 'plasticboy/vim-markdown'
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
" Plug 'Slava/vim-spacebars'

" ultisnips start, not working yet
Plug 'SirVer/ultisnips'

" ES2015 code snippets (Optional)
Plug 'epilande/vim-es2015-snippets'

" React code snippets
Plug 'DinoJay/vim-react-snippets'

" Snippets are separated from the engine. Add this if you want them:
" Plug 'cmather/vim-meteor-snippets'

" Plug 'maksimr/vim-jsbeautify'
" Plug 'ruanyl/vim-fixmyjs'
"
" Plug 'jaawerth/nrun.vim'
" Plug 'benjie/neomake-local-eslint.vim'

" Plug 'jaawerth/neomake-local-eslint-first'
Plug 'Chiel92/vim-autoformat'
" Plug 'sbdchd/neoformat'
" Plug 'einars/js-beautify'
" Plug 'junegunn/rainboear; rspec

Plug 'edkolev/tmuxline.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'benmills/vimux'
Plug 'jgdavey/tslime.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'ryanoasis/vim-devicons'

Plug 'rhysd/clever-f.vim'

" Plug 'mhinz/vim-startify'
" Plug 'millermedeiros/vim-esformatter'

call plug#end()
