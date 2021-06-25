# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="robbyrussell"

export ZSH=$HOME/.oh-my-zsh
export DISABLE_AUTO_TITLE='true'

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  autojump
  poetry
)

ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

# bindkey -v

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

# [[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

fpath+=$HOME/.zfunc
fpath=($ZSH/custom/completions $fpath)

autoload -U compinit
compinit

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
# emulate sh -c 'source /etc/profile.d/apps-bin-path.sh'
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/snapd/desktop/"

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# Rust
source $HOME/.cargo/env

export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# Github
eval "$(gh completion -s zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# added by pipx (https://github.com/pipxproject/pipx)
export PATH="/home/thanh/.local/bin:$PATH"

source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

if command -v npm >/dev/null 2>&1; then
    export PATH=$(npm prefix -g)/bin:$PATH
fi

alias cl='clear'
alias cll='clear && ll'
alias cla='clear && la'

if command -v kubectl >/dev/null 2>&1; then
    source <(kubectl completion zsh)
    alias k='kubectl'
fi

if command -v helm >/dev/null 2>&1; then
    source <(helm completion zsh)
fi

if [[ -d "${HOME}/.krew/bin" ]]; then
    export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi

if command -v mcli >/dev/null 2>&1; then
    # mcli --autocompletion
    autoload -U +X bashcompinit && bashcompinit
    complete -o nospace -C /usr/local/bin/mcli mcli
    alias mc='mcli'
fi

if command -v batcat >/dev/null 2>&1; then
    alias bat='batcat'
fi

# if command -v just >/dev/null 2>&1; then
#     eval "$(just --completions zsh)"
# fi

function gi() {
    curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ ;
}
