# Save command history
setopt EXTENDED_HISTORY
# If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event).
setopt HIST_IGNORE_ALL_DUPS
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTORY_IGNORE="(ls|cd|pwd|exit|cd ..|history)"
HISTSIZE=99999
HISTFILESIZE=999999
SAVEHIST=$HISTSIZE
HIST_STAMPS="%d/%m/%y %T"


# zsh-autosuggestions 
#source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# 修正找不到zsh-autosuggestions的問題
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/Users/hsuhua/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# To activate the syntax highlighting, add the following at the end of your .zshrc:
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Make sure zsh-git-prompt is loaded from your .zshrc:
source "/opt/homebrew/opt/zsh-git-prompt/zshrc.sh"
#function precmd {
#    local git_branch=""
#    # 檢查當前目錄是否位於Git工作樹內
#    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
#	# 如果在Git工作樹內，獲取並顯示當前Git分支的名稱
#        # 並將分支名稱的顏色設置為白色
#        git_branch="%F{white} ($(git symbolic-ref --short HEAD 2>/dev/null))%f"
#    fi
#    
#    local current_dir="${PWD##*/}"  # 獲取當前目錄名稱
#    local parent_dir="${PWD%/*}"    # 獲取當前目錄的父目錄路徑
#    parent_dir="${parent_dir##*/}"  # 獲取當前目錄的父目錄名稱
#    local grandparent_dir="${PWD%/*/*}"
#    grandparent_dir="${grandparent_dir##*/}"  # 獲取當前目錄的父目錄的父目錄名稱
#    
#    PROMPT="%{$fg[green]%}$grandparent_dir/$parent_dir/$current_dir$git_branch%{$fg[red]%}~%{$fg[white]%}࿔ %{$reset_color%}"
#}

# 路徑將顯示從使用者家目錄開始的完整路徑，如果當前目錄在使用者家目錄內，則顯示為~，而不僅僅是目錄名稱。
function precmd {
    local git_branch=""
    # 檢查當前目錄是否位於Git工作樹內
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        # 如果在Git工作樹內，獲取並顯示當前Git分支的名稱
        # 並將分支名稱的顏色設置為白色
        git_branch="%F{white} ($(git symbolic-ref --short HEAD 2>/dev/null))%f"
    fi

    local current_dir="$PWD"  # 獲取當前目錄的完整路徑
    local home_dir="$HOME"    # 獲取使用者家目錄的路徑

    # 如果當前目錄在使用者家目錄內，將路徑改為使用者家目錄的簡稱（~）
    if [[ "$current_dir" == "$home_dir"* ]]; then
        current_dir="~${current_dir#$home_dir}"
    fi

    PROMPT="%{$fg[green]%}$current_dir$git_branch%{$fg[red]%}~%{$fg[white]%}࿔ %{$reset_color%}"
}








#ruby is keg-only, which means it was not symlinked into /opt/homebrew,
#because macOS already provides this software and installing another version in
#parallel can cause all kinds of trouble.

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

