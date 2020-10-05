# setup dotfiles TODO: some clean up
command_exists () {
  type "$1" &> /dev/null ;
}


ln ~/dev/dotfiles/vim/.vimrc ~/.config/nvim/init.vim
ln ~/dev/dotfiles/vim/.vimrc ~/.vimrc

if [ -L "~/.tmux.conf" ]; then
  ln ~/dev/dotfiles/tmux/.tmux.conf ~/.tmux.conf
else
  echo "tmux conf" already exists
fi


