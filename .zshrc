parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
eval "$(rbenv init - zsh)"

export EDITOR="/usr/bin/vim"

setopt PROMPT_SUBST
PS1="%F{069}|%F{165}Artium Config%F{069}| "
PS1+="%F{142}\$(parse_git_branch)"$'\n'
PS1+="%F{069}%n%F{255}@%F{035}%m:%F{045}%~%F{255}$ "
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export PATH=$PATH:/usr/local/sbin
zstyle ':completion:*' list-colors 'di=36:ln=1;31:so=37:pi=1;33:ex=35:bd=37:cd=37:su=37:sg=37:tw=32:ow=32'
zstyle ':completion:*:*:git:*' script ~/git-completion.zsh
autoload -U compinit && compinit
alias ll="ls -la"
alias dc="docker compose"
alias tf="terraform"

alias dps="docker ps"
alias gfp="git push --force-with-lease origin head"
alias gap="git add -p"

alias dockerrmleaves="docker rmi \$(docker images -f 'dangling=true' -q)"
alias dockerrmstopped="docker rm \$(docker ps -a -q)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lizjohnson/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/lizjohnson/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lizjohnson/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/lizjohnson/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(direnv hook bash)"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
