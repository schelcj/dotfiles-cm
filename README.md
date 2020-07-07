# dotfiles (managed by chezmoi)

I'm managing my dotfiles with [chezmoi](https://www.chezmoi.io/) these days.

## Initial setup on new host

    ssh-keygen -t ed25519 # or whatever type is recommended these days
    cat ~/.ssh/id_ed25519.pub
    # add key to github ssh keys
    # install chezmoi https://www.chezmoi.io/docs/install/
    sudo apt-get install lastpass-cli
    lpass login <email>
    bin/chezmoi init git@github.com:schelcj/dotfiles-cm.git
    bin/chezmoi -v apply # ignore error about solarized for vim, vundle will install it
