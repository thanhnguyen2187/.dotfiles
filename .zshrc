# oh my zsh
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

fpath=(
    $ZSH_CUSTOM/functions
    $ZSH_CUSTOM/completions
    $fpath
)
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  autojump
  poetry
)
# ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

# other paths
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/snapd/desktop/"
