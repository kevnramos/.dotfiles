# ~/.zshrc
#     __      __  ______
#    /\ \  __/\ \/\  __  \
#    \ \ \/\ \ \ \ \ \_\  \
#     \ \ \ \ \ \ \ \  _  /
#      \ \ \_/ \_\ \ \ \\  \
#       \ \____^___/\ \_\ \_\
#         \/__//__/  \/_/\/_/
################################################################################
# SET UP PROMPT
################################################################################
export STARSHIP_CONFIG=~/.dotfiles/starship-zsh.toml
eval "$(starship init zsh)"
################################################################################
# TAB COMPLETION
################################################################################
# https://zsh.sourceforge.io/Doc/Release/Completion-Widgets.html#Completion-Matching-Control
# https://thevaluable.dev/zsh-completion-guide-examples/
# case-insensitive matching only if there are no case-sensitive matches
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# tab complete select visually
zstyle ':completion:*' menu select
# shift tab tab completes backwards
bindkey '^[[Z' reverse-menu-complete
# brew completion
if type brew &>/dev/null
then
    # FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    case ":$FPATH:" in
        *:$(brew --prefix)/share/zsh/site-functions:*) ;;
        *) FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}" ;;
    esac
fi
# initialize advanced tab completion
autoload -Uz compinit && compinit
# tab completion with highlighting
zmodload -i zsh/complist

################################################################################
# ALIASES
################################################################################
# alias to source .zshrc
alias src='[ -r ~/.zshrc ] && . ~/.zshrc'
# make bash help command work in zsh
help() { bash -c "help $1" }
# aliases
[ -r ~/.dotfiles/aliasrc ] && . ~/.dotfiles/aliasrc

################################################################################
# CONDA
################################################################################
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

################################################################################
# ITERM2 SHELL INTEGRATION
################################################################################
test -e "${HOME}/.iterm2_shell_integration.zsh" &&
    source "${HOME}/.iterm2_shell_integration.zsh" ||
    echo "no iterm2 shell integration"
