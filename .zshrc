
# zsh-autosuggestions 
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

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
function precmd {
    PROMPT="%{$fg[green]%}%c $(git_super_status)%{$fg[red]%}~%{$fg[white]%}࿔ %{$reset_color%}"
}


#ruby is keg-only, which means it was not symlinked into /opt/homebrew,
#because macOS already provides this software and installing another version in
#parallel can cause all kinds of trouble.

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

