for f in split(glob('~/.dotfiles/vim/*.vim'), '\n')
    exe 'source' f
endfor
