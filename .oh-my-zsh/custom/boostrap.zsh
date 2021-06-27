fpath=(
    $ZSH_CUSTOM/functions
    $ZSH_CUSTOM/completions
    $fpath
)

for file ($ZSH_CUSTOM/utilities/*.zsh(N)); do
  source $file
done
unset file
