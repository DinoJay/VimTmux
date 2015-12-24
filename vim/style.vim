" set term=screen-256color
" use 256 colors in Console mode if we think the terminal supports it
" if &term =~? 'mlterm\|xterm'
" 	set t_Co=256
" endif
" let g:tomorrow_termcolors=256
" let g:solarized_termcolors=256
" let g:hybrid_use_Xresources=1
" let g:enable_bold_font = 1
let g:seoul256_background = 234
syntax enable
" let base16colorspace=256
colorscheme seoul256

let base16colorspace="256"
" set t_Co=256
set background=dark
let g:airline_theme="zenburn"
" colorscheme PaperColor


let g:tmuxline_theme = 'airline_visual'
" let g:PaperColor_Dark_Override = { 'background' : '#1c1c1c', 'cursorline' : '#abcdef', 'matchparen' : '#3a3a3a', 'comment' : '#5f875f' }

" show whitespace
set list
" indent lines setup
let g:indentLine_color_dark = 1
let g:indentLine_color_term = 239
" let g:indentLine_char = '|'

" set line length marker
set colorcolumn=80

" highlight crusor
"highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline
