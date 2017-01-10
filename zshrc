# bootstrap
export ZPLUG_HOME=$HOME/.zplug

if ! [[ -d $ZPLUG_HOME ]]; then
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
    FRESH_INSTALL=true
fi
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/colored-man-pages", from:oh-my-zsh
#zplug "plugins/rbenv", from:oh-my-zsh, if:"[ -d $HOME/.rbenv ]"
zplug "plugins/pyenv", from:oh-my-zsh, if:"[ -d $HOME/.pyenv ]"
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
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
alias vif="fzf | xargs nvim"
export EDITOR=nvim
export PATH=$HOME/.local/bin:$PATH

#export GOROOT=/usr/bin/go
#export GOPATH=~/go
#export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
