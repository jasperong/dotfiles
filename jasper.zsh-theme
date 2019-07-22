
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[blue]%}[%{$reset_color%}%{$fg[magenta]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[blue]%}]%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}⚡%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN=""

# PROMPT='%{$fg[cyan]%}%1~%{$reset_color%} $(git_prompt_info)%{$fg[cyan]%} => %{$reset_color%} '

autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
theme_precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' [%F{magenta}%b%c%u%B%F{blue}]'
    } else {
        zstyle ':vcs_info:*' formats ' [%F{magenta}%b%c%u%B%F{red}●%F{blue}]'
    }

    vcs_info
}

setopt prompt_subst
PROMPT='%B%F{cyan}%c%B%F{blue}${vcs_info_msg_0_}%B%F{magenta} %F{cyan}=> %{$reset_color%}% '

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd%
