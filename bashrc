#! /usr/bin/env bash
# ~/.bashrc
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
export STARSHIP_CONFIG=~/.dotfiles/starship-bash.toml
eval "$(starship init bash)"

################################################################################
# ALIAS TO SOURCE .ZSHRC
################################################################################
alias src='[ -r ~/.bashrc ] && source ~/.bashrc'

################################################################################
# STOP THE WARN
################################################################################
export BASH_SILENCE_DEPRECATION_WARNING=1

################################################################################
# ALIASES
################################################################################
[ -r ~/.dotfiles/aliasrc ] && . ~/.dotfiles/aliasrc

################################################################################
# BREW COMPLETION
################################################################################
if type brew &>/dev/null
then
    HOMEBREW_PREFIX="$(brew --prefix)"
    if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
    then
        source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    else
        for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
        do
            [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
        done
        unset COMPLETION
    fi
fi
