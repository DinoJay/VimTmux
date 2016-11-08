set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" use 256 colors in Console mode if we think the terminal supports it
" if &term =~? 'mlterm\|xterm'
" let g:tomorrow_termcolors=256
" let g:solarized_termcolors=256
" let g:hybrid_use_Xresources=1
" let g:enable_bold_font = 1
" let g:seoul256_background = 234
syntax enable
" let base16colorspace=256
" colorscheme seoul256

" let base16colorspace="256"
" set t_Co=256
set background=dark " or light if you prefer the light version
let g:two_firewatch_italics=1
colo two-firewatch
let g:airline_theme='twofirewatch' " if you have Airline installed and want the associated theme
" let g:airline_theme='twofirewatch'
" let g:tmuxline_theme = 'twofirewatch'
" set t_Co=88
" colorscheme PaperColor


" show whitespace
set list
set ts=2 sw=2 et
let g:indent_guides_start_level = 2
let indent_guides_guide_size = 1

" set line length marker
set colorcolumn=80

" highlight crusor
"highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
" set cursorline
