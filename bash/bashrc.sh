# keys
if [[ -r ~/.keyrc ]]; then
    source ~/.keyrc
fi

# ls
if [[ -x "$(command -v lsd)" ]]; then
    alias ls="lsd"
fi
alias ll="ls -lha"

# tre
if [[ -x "$(command -v tre)" ]]; then
    tre() {
        command tre "$@" -e && source "/tmp/tre_aliases_$USER" 2>/dev/null
    }
fi

# lazygit
if [[ -x "$(command -v lazygit)" ]]; then
    alias lg="lazygit"
fi

# lazydocker
if [[ -x "$(command -v lazydocker)" ]]; then
    alias lzd="lazydocker"
fi

# distrobox
if [[ -x "$(command -v distrobox)" ]]; then
    alias db="distrobox"
fi

# python venv
venv() {
    if [[ $# == 0 ]]; then
        local dir=$(pwd)
        while [[ $dir != '/' ]]; do
            for v in "venv" ".venv"; do
                if [[ -d "$dir/$v" && -f "$dir/$v/pyvenv.cfg" ]]; then
                    echo "Entering Virtual Environment '$dir/$v'..."
                    source "$dir/$v/bin/activate"
                    return
                fi
            done
            dir=$(dirname "$dir")
        done
        echo "Creating Virtual Environment './venv'..."
        command python3 -m venv venv
    else
        command python3 -m venv $@
    fi
}

# python uv
if [[ -x "$(command -v uv)" ]]; then
    source <(uv generate-shell-completion bash)
fi

# python conda
_setup_conda() {
    local dir
    for dir in "conda" "miniforge3" "miniconda" "miniconda3" "anaconda3" "Conda" "Anaconda"; do
        if [[ -r "${HOME}/${dir}/etc/profile.d/conda.sh" ]]; then
            source "${HOME}/${dir}/etc/profile.d/conda.sh"
            break
        fi
    done
}
_setup_conda

# gomi
if [[ -x "$(command -v gomi)" ]]; then
    alias rm="gomi"
fi

# man page
if [[ -x "$(command -v bat)" ]]; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    export MANROFFOPT="-c"
fi

# fzf
if [[ -r /usr/share/fzf/completion.bash ]]; then
    source /usr/share/fzf/completion.bash
fi
if [[ -r /usr/share/fzf/key-bindings.bash ]]; then
    source /usr/share/fzf/key-bindings.bash
fi
if [[ -x "$(command -v fzf)" ]]; then
    export FZF_DEFAULT_OPTS=" \
        --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
        --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
        --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
        --color=selected-bg:#45475A \
        --color=border:#6C7086,label:#CDD6F4"
    source <(fzf --bash)
    if [[ -x "$(command -v fd)" ]]; then
        export FZF_DEFAULT_COMMAND="fd --type f"
    fi
    if [[ -x "$(command -v bat)" ]]; then
        fzf() {
            command fzf-tmux \
                --preview " \
                    [[ -f {} ]] && bat --color=always {}; \
                    [[ -d {} ]] && ls -lhA --color=always {}"
        }
    fi
fi

# neovim
if [[ -x "$(command -v nvim)" ]]; then
    export EDITOR=nvim
    alias view="nvim -RM"
fi

# go
if [[ -x "$(command -v go)" ]]; then
    GOROOT="$(go env GOROOT)"
    GOPATH="$(go env GOPATH)"
    export GOROOT
    export GOPATH
    export PATH=$PATH:$GOROOT/bin
    alias gop="GOPROXY=https://goproxy.cn"
fi

# superfile
spf() {
    os=$(uname -s)
    # Linux
    if [[ "$os" == "Linux" ]]; then
        export SPF_LAST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"
    fi
    # macOS
    if [[ "$os" == "Darwin" ]]; then
        export SPF_LAST_DIR="$HOME/Library/Application Support/superfile/lastdir"
    fi
    command spf "$@"
    [ ! -f "$SPF_LAST_DIR" ] || {
        . "$SPF_LAST_DIR"
        command rm -f -- "$SPF_LAST_DIR" >/dev/null
    }
}

# rust
export PATH=$PATH:~/.cargo/bin

# mkj
mkj() {
    local dir="$1"
    mkdir -p "$dir"
    cd "$dir" || exit 1
}

# clear cache
uncache() {
    sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"
}

# update script
update() {
    sudo -v || return 1
    echo '[INFO] updating Omarchy'
    omarchy-update
    echo '[INFO] updating uv tool'
    uv tool upgrade --all
    echo '[INFO] updating stew'
    stew up --all
    if [[ -x "$(command -v flatpak)" ]]; then
        echo '[INFO] updating flatpak'
        sudo flatpak update -y
    fi
}

# bash vi mode
set -o vi
bind '"\C-l": clear-screen'
bind -m vi-insert '"\C-?": backward-delete-char'
bind -m vi-insert '"jj": vi-movement-mode'
bind -m vi-insert '"jk": vi-movement-mode'
