set_bash_prompt() {
	PS1='\[\e[91;1m\]\u@kernel-devel\[\033[00m\]: \[\e[33;1m\]\W \[\e[32;1m\]\$ \[\033[0m\]'
}

PROMPT_COMMAND=set_bash_prompt
