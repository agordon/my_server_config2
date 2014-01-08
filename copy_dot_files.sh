#!/bin/sh

## This script copies several useful dotfiles to a newly created amazon-cloud instance.
## The dotfiles are stored in "./dot_files".
##
DEST=$1
if [ -z "$DEST" ] ; then
	echo "This script copies dot-files to a new Amazon-Cloud instance."
	echo "Please specify the amazon instance 'user@host' to copy the files to."
	exit 1
fi

##
## Check if the parameter makes sense
##
UNAME=$(ssh "$DEST" "uname")
if [ $? -ne 0 ]; then
	echo "Error: Failed to connect to remove host '$DEST' (see ssh error above).">&2
	echo "       Please verify the correct username and password." >&2
	exit 1
fi

##
## Now copy the files
##
scp ./dot_files/vimrc     "$DEST":.vimrc || exit 1
scp ./dot_files/bashrc    "$DEST":.bashrc || exit 1
scp ./dot_files/gitconfig "$DEST":.gitconfig || exit 1
