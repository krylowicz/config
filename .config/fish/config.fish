if status is-interactive
    # Commands to run in interactive sessions can go here
end

#>>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/kkr/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

set fish_greeting

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (hostnamectl hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n $PWD
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n ':: '
	set_color normal
end


# aliases
alias python "python3"
alias cls "clear"

alias ls "eza --all --group --header --group-directories-first --long"

alias gl "git log"
alias ga "git add"
alias gm "git commit"
alias gp "git push"
alias gs "git status"
alias gd "git diff"
alias gb "git branch"

