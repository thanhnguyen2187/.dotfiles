# path for binary files
export PATH="/home/thanh/.local/bin:$PATH"

# enable completions
autoload -U bashcompinit
bashcompinit

eval "$(register-python-argcomplete pipx)"

