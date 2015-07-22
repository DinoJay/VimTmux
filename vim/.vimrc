source ~/.dotfiles/vim/plugins.vim
source ~/.dotfiles/vim/plugin_settings.vim
source ~/.dotfiles/vim/mappings.vim
source ~/.dotfiles/vim/style.vim
source ~/.dotfiles/vim/options.vim

" file type specific settings
for f in split(glob('~/.dotfiles/vim/filetypes/*.vim'), '\n')
    exe 'source' f
endfor
