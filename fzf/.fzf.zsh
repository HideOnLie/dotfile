# Setup fzf
# ---------
if [[ ! "$PATH" == */home/hide/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/hide/.fzf/bin"
fi

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/hide/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/hide/.fzf/shell/key-bindings.zsh"


