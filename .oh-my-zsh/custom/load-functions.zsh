for file ($ZSH_CUSTOM/functions/*(N)); do
  autoload -Uz $file
done
unset file
