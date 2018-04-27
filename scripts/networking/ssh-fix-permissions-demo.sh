#!/bin/bash

[ -d "$demoToolsDir" ] || exit 1

sshConfigDir=$demoToolsDir/ssh

# Invoke generic command to secure permissions of SSH files in module form.
dir-permission-template-ssh "$sshConfigDir" || exit 1

# Do any special operations here.
