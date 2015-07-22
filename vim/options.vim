
" javascript folding
" set foldmethod=manual
" set foldnestmax=1
" set nofoldenable            " have folds open by default

" line numbers
set number
"set relativenumber
:set numberwidth=2

" Keep 8 lines above or below the cursor when scrolling.
set scrolloff=8

" Keep 15 columns next to the cursor when scrolling horizontally.
set sidescroll=1
set sidescrolloff=15

" Set minimum window size to 79x5.
set winwidth=79
set winheight=5
set winminheight=5

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
