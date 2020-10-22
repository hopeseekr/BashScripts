#!/bin/bash


# Bail out if ~/.bash_profile already has the code.
# @see https://stackoverflow.com/a/4749368/430062
if ! grep -Fq "Run ssh-agent ONCE" ~/.bash_profile; then
	cat <<'LAUNCH_SSH_AGENT' >> ~/.bash_profile

# Run ssh-agent ONCE per user per system boot.
# [installed via https://github.com/hopeseekr/BashScripts]
# @see https://unix.stackexchange.com/a/217223/15780
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_
LAUNCH_SSH_AGENT
fi

if ! grep -Fqx "AddKeysToAgent yes" ~/.ssh/config ; then
	echo "" >> ~/.ssh/config
	echo "AddKeysToAgent yes" >> ~/.ssh/config
fi

source ~/.bash_profile