#!/bin/sh

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

## Now copy the files
./copy_dot_files.sh "$DEST" || exit 1
scp image_setup_from_source.sh image_setup_standard_packages.sh "$DEST": || exit 1
