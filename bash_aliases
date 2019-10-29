alias securityupdates="apt -s dist-upgrade | grep \"^Inst\" | grep -i securi | awk -F ' ' {'print \$2'} | sudo xargs apt install"

alias ftbstart="tmux new -d -s ftb && tmux send-keys -t ftb 'cd ~/FTBInteractions && ./ServerStart.sh' ENTER"
alias ftb="tmux a -t ftb"

ssh() {
	if [[ $@ == "-data" ]]; then
		command ssh PURDUEUSER@PURDUEHOST
	elif [[ $@ == "-home" ]]; then
		command ssh -p 5273 HOMEUSER@HOMEHOST
	else
		command ssh "$@"
	fi
}
