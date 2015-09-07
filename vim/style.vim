set term=screen-256color

set t_Co=256
" let g:tomorrow_termcolors=256
" let g:solarized_termcolors=256
" let g:hybrid_use_Xresources=1
" let g:enable_bold_font = 1
set background=dark
syntax enable
" let base16colorspace=256
colorscheme base16-default

let base16colorspace="256"
set t_Co=256
set background=dark
colorscheme base16-eighties


let g:tmuxline_theme = 'airline_visual'

" show whitespace
set list
" indent lines setup
let g:indentLine_color_dark = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '|'

" set line length marker
set colorcolumn=80

" highlight crusor
"highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline
