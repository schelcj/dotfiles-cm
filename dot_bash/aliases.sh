alias whatthecommit="curl -s http://whatthecommit.com/|html2text|sed '\$d'"
alias cpu_gov="cpufreq-info|grep -A 2 current|grep governor"
alias dig="dig +nocmd +nocomments +nostats"
alias wp="~/scripts/wallpaper.pl"
alias music="tmux attach -t music"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias speed_test="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
alias mux="tmuxinator"
alias smux="~/scripts/smux.pl"
alias cm="chezmoi"

alias csnapshot='docker run -it --rm --env HOME=/tmp -v $(pwd):/app -u $(id -u ${USER}):$(id -g ${USER}) carton'
