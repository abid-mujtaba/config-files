# Setup fzf
# ---------
if [[ ! "$PATH" == */home/abid/.fzf/bin* ]]; then
  export PATH="$PATH:$HOME/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"

# Switch to using rg (repgrep)
# Use full path so that we avoid the alias which has --color=always
# which conflicts with fzf
export FZF_DEFAUL_COMMAND="/usr/bin/rg --files --follow"
export FZF_CTRL_T_COMMAND="$FZF_DEFAUL_COMMAND"
