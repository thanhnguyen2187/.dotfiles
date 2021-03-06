# oh my zsh
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
export DISABLE_AUTO_TITLE='true'

fpath=(
    $ZSH_CUSTOM/functions
    $ZSH_CUSTOM/completions
    $fpath
)
plugins=(
    # asdf
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    autojump
    poetry
    task
)
# ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

# other paths
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/snapd/desktop/"

# initialize asdf here
# since using it within "plugins" greatly slows the initialization down
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

# Generated for envman. Do not edit.
# [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

