#!/bin/sh

set -eu

# printf '\033[33m Warning: This action does not currently support host verification; verification is disabled. \n \033[0m\n'

SSHPATH="$HOME/.ssh"

if [ ! -d "$SSHPATH" ]
then
  mkdir "$SSHPATH"
fi

if [ ! -f "$SSHPATH/known_hosts" ]
then
  touch "$SSHPATH/known_hosts"
fi

echo "$INPUT_KEY" > "$SSHPATH/deploy_key"

KEYFILE="$SSHPATH/deploy_key"

chmod 700 "$SSHPATH"
chmod 600 "$SSHPATH/known_hosts"
chmod 600 "$SSHPATH/deploy_key"

echo "$INPUT_COMMAND" > $HOME/shell.sh
echo "exit \$?" >> $HOME/shell.sh
cat $HOME/shell.sh

echo Start Run Command

sh -c "ssh $INPUT_ARGS -i $KEYFILE -o StrictHostKeyChecking=no -p $INPUT_PORT ${INPUT_USER}@${INPUT_HOST} < $HOME/shell.sh"
