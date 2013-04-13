autoload colors
colors
 
 for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
     eval _$color='%{$terminfo[bold]$fg[${(L)color}]%}'
     eval $color='%{$fg[${(L)color}]%}'
     (( count = $count + 1 ))
     done
     FINISH="%{$terminfo[sgr0]%}"

#export PS1="$YELLOW[$CYAN%n@%m$RED%d$YELLOW]$ "
#RPROMPT=$(echo "$RED%D %T$FINISH")
PROMPT=$(echo "$YELLOW%n@%m:$GREEN%/$_YELLOW\$$FINISH ")

export EDITOR=vim
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zhistory
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY
setopt PUSHD_IGNORE_DUPS

function histall { convhistory =(allhistory) |
sed '/^.\{20\} *cd/i\\' }


#自动补全功能 {{{
setopt AUTO_LIST
setopt AUTO_MENU
#开启此选项，补全时会直接选中菜单项
#setopt MENU_COMPLETE
 
 autoload -U compinit
 compinit
  
   
#自动补全选项
   zstyle ':completion:*' verbose yes
   zstyle ':completion:*' menu select
   zstyle ':completion:*:*:default' force-list always
   zstyle ':completion:*' select-prompt '%SSelect:  lines: %L  matches: %M  [%p]'
    
    zstyle ':completion:*:match:*' original only
    zstyle ':completion::prefix-1:*' completer _complete
    zstyle ':completion:predict:*' completer _complete
    zstyle ':completion:incremental:*' completer _complete _correct
    zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
     
#路径补全
     zstyle ':completion:*' expand 'yes'
     zstyle ':completion:*' squeeze-shlashes 'yes'
     zstyle ':completion::complete:*' '\\'
       
#修正大小写
       zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
#错误校正
       zstyle ':completion:*' completer _complete _match _approximate
       zstyle ':completion:*:match:*' original only
       zstyle ':completion:*:approximate:*' max-errors 1 numeric
        
#kill 命令补全
        compdef pkill=kill
        compdef pkill=killall
        zstyle ':completion:*:*:kill:*' menu yes select
        zstyle ':completion:*:*:*:*:processes' force-list always
        zstyle ':completion:*:processes' command 'ps -au$USER'
         
#补全类型提示分组
         zstyle ':completion:*:matches' group 'yes'
         zstyle ':completion:*' group-name ''
         zstyle ':completion:*:options' description 'yes'
         zstyle ':completion:*:options' auto-description '%d'
         zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
         zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
         zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
         zstyle ':completion:*:corrections' format $'\e[01;32m -- %d (errors: %e) --\e[0m'
          
# cd ~ 补全顺序
          zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
#}}}
##行编辑高亮模式 {{{
# Ctrl+@ 设置标记，标记和光标点之间为 region
          zle_highlight=(region:bg=magenta #选中区域
          special:bold      #特殊字符
          isearch:underline)#搜索时使用的关键字
#}}}
#[Esc][h] man 当前命令时，显示简短说明
          alias run-help >&/dev/null && unalias run-help
          autoload run-help

          setopt extended_glob
          TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace')
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
bindkey -e
