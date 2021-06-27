# check if
# - tmux exists on the system
# - not in an interative shell
# - can tmux be "flat"
if command -v tmux &> /dev/null && \
    [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && \
    [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; \
then
  tmux
fi
