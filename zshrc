urusai () {
    downloaded_script_dir=$HOME/.zsh-remote-scripts

    if [[ ! -d $downloaded_script_dir ]]; then
        mkdir $downloaded_script_dir
    fi

    github_repo=$1
    repo_file_path=$2

    local_fname="$github_repo-$repo_file_path"
    local_fname=${local_fname//\//-}
    local_script_path="$downloaded_script_dir/$local_fname"

    if [ ! -f $local_script_path ]; then
        echo "Download $github_repo/$repo_file_path"
        remote_script_url="https://raw.githubusercontent.com/$github_repo/master/$repo_file_path"
        curl $remote_script_url > $local_script_path
    fi
    source $local_script_path
}

bench() {
    for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
}

urusai robbyrussell/oh-my-zsh lib/completion.zsh
urusai robbyrussell/oh-my-zsh lib/history.zsh
urusai robbyrussell/oh-my-zsh lib/theme-and-appearance.zsh
urusai robbyrussell/oh-my-zsh lib/key-bindings.zsh
source ~/.extra.sh

alias vi="nvim -p"
export EDITOR=nvim
export PATH=$HOME/.local/bin:$PATH
export TERM=screen-256color
export PYTHONIOENCODING='utf-8'

PROMPT='%F{green}%1~%f %# '
RPROMPT=" %F{yellow}%(1j.%j.)%{$reset_color%}"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER=';'
export FZF_DEFAULT_COMMAND='ag -g ""'

#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
