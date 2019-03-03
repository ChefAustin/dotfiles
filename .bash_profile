export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

complete -cf sudo
complete -cf man


alias cd..="cd .."
alias cdw='cd ~/workspace'
alias cdwp='cd ~/workspace/personal'
alias cdwt='cd ~/workspace/third_party'
alias cls='clear'
alias cp='cp -i'
alias flush-dns='sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache'
alias getserial="system_profiler SPHardwareDataType | awk '/Serial/ {print $4}'"
alias ls='ls -laGH'
alias mv='mv -i'
alias stopwatch='date; read -n 1 -s; date'
alias mkdir='mkdir -p -v'
alias tree='tree -C'
