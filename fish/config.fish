if status is-interactive
    # Commands to run in interactive sessions can go here
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
zoxide init fish | source

set -x PYENV_ROOT $HOME/.pyenv
set -x PATH  $PYENV_ROOT/bin $PATH
pyenv init - | source
