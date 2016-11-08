# git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Base16 Shell
eval sh $HOME/.config/base16-shell/base16-default.dark.sh

set -gx TERM screen-256color;

# alias tmux="tmux"
alias vim='nvim'
alias nv='nvim'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# start fish automatically
# test $TERM != "screen"; and exec tmux -2

alias tmux='env TERM=xterm-256color tmux'
