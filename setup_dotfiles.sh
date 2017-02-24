# setup dotfiles TODO: some clean up
command_exists () {
  type "$1" &> /dev/null ;
}

if [ -L "~/.vimrc" ]; then
  ln -T ~/.dotfiles/vim/.vimrc ~/.vimrc
fi

if [ -L "~/.config/nvim/init.vim" ]; then
  ln -T ~/.dotfiles/vim/.vimrc ~/.config/nvim/init.vim
else
  echo "nvim conf" already exists
fi

if [ -L "~/.tmux.conf" ]; then
  ln -T ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
else
  echo "tmux conf" already exists
fi


if [ -L "~/.bashrc" ]; then
  ln -T ~/.dotfiles/bash/.bashrc ~/.bashrc
else
  echo "bash conf" already exists
fi

if [ -L "~/.editorconfig" ]; then
  ln -T ~/.dotfiles/vim/.editorconfig  ~/.editorconfig
else
  echo "editorconfig" already exists
fi

if [ ! -d ~/.fonts/ ]; then
  mkdir ~/.fonts
else
  echo "fonts" already exists
fi

if [ -d ./fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf ]; then
  sudo cp ./fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf ~/.fonts
  fc-cache -vf ~/.fonts/
else
  echo "./fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf" does not exist
fi

# python neovim client

if ! command_exists ag ; then
  # required for ctrl-p
  sudo apt install silversearcher-ag
fi

# pip install neovim

# and for node
if ! command_exists node ; then
  curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi

if ! command_exists eslint_d ; then
  sudo npm i eslint_d --global
fi

if ! command_exists tern ; then
  sudo npm i tern --global
fi


if ! command_exists cargo ; then
  sudo apt-get install cargo
fi

if ! command_exists ripgrep ; then
  cargo install ripgrep
fi

