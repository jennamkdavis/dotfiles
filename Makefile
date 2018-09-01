# skip macos, postfix for now
stow:
	stow bash git pet readline sh tmux vim stow

init:
	git submodule init && git submodule update --init --recursive
