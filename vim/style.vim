" set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
" set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto
set termguicolors

" set term=screen-256color
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
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
colo base16-eighties
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

" hi Cursor guifg=#121212 guibg=#afd700

if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;white\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;blue\x7"
  silent !echo -ne "\033]12;blue\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

hi Normal ctermbg=None

" highlight crusor
"highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
 set cursorline


