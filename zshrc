# install bootstrap
if ! [[ -d $HOME/.zplug ]]; then
    export ZPLUG_HOME=$HOME/.zplug
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
    FRESH_INSTALL=true
fi
source $HOME/.zplug/init.zsh

zplug "zplug/zplug", if:"[ -d .zplug ]"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/rbenv", from:oh-my-zsh, if:"[ -d $HOME/.rbenv ]"
zplug "plugins/pyenv", from:oh-my-zsh, if:"[ -d $HOME/.pyenv ]"
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"
zplug "~/.extra.sh", from:local

if (($+FRESH_INSTALL)); then
    zplug install
    zplug clear
fi

zplug load

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
PROMPT='%m %{$FG[010]%}%~%{$FG[208]%} $(git_prompt_info)%{$reset_color%] '
RPROMPT=" %{$fg[green]%}%(1j.%j.)%{$reset_color%}"

alias vi="nvim -p"
export EDITOR=nvim
export PATH=$HOME/.local/bin:$PATH
