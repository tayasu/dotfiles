#PATH
PATH=/usr/local/bin:$PATH

# alias
alias ls='ls -GF'
alias grep='grep -sn'
alias e='open -a Emacs'
alias emacs='TERM=xterm-256color /usr/local/Cellar/emacs/24.3/bin/emacs'

# colors
autoload -Uz colors
colors

# PROMPT
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%s:%b'
zstyle ':vcs_info:*' actionformats '%s:%b|%a'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

PROMPT="%F{blue}[%~]%f %1(v|%F{green}%1v%f|)
%F{yellow}♕%f  %B%F{green}%n%f⚡ %F{red}%m%f%b ➪  "

TRUMP=("%B%F{blue}FU♠ K OFF%f%b" "%B%F{green}FU♣ K OFF%f%b" "%B%F{red}FU♥ K OFF%f%b" "%B%F{yellow}FU♦ K OFF%f%b")
RPROMPT=$'$TRUMP[$[$RANDOM % ${#TRUMP[@]} + 1]]'


# zsh-completions
fpath=(~/.zsh/zsh-completions/src $fpath)
autoload -U compinit; compinit

# Hide rprompt when command exec
setopt transient_rprompt

# No beep
setopt no_beep

# Save move dir % cd -[TAB]
setopt auto_pushd

# auto_pushd ignore duplicate directory
setopt pushd_ignore_dups

# Correct wrong command
SPROMPT="%{$fg_bold[red]%}correct%{$reset_color%}: %R -> %r ? "
setopt correct

#setopt print_eight_bit

# Correct uppercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*:default' menu select

# Trace command exec
#setopt xtrace

# zsh-syntax-highlighting
#source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# z
_Z_CMD=j
source ~/.zsh/z/z.sh
precomd() {
  _z --add "$(pwd -P)"
}
 
# auto-fu
if [ -f ~/.zsh/auto-fu.zsh/auto-fu.zsh ]; then
  source ~/.zsh/auto-fu.zsh/auto-fu.zsh
  function zle-line-init() {
    auto-fu-init
  }
  zle -N zle-line-init
  zstyle ':completion:*' completer _oldlist _complete
fi
