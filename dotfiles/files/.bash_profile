#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/muta/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/muta/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[ -f /home/muta/.config/.dart-cli-completion/bash-config.bash ] && . /home/muta/.config/.dart-cli-completion/bash-config.bash || true
## [/Completion]

