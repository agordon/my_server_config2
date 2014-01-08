#!/bin/sh

##
## Run this script after installing all software,
## it will ask you for personal details:
##   git username/email
##   Amazon Access keys


##
## Git setup
##
echo "GIT setup:"
printf "Enter git user name (not email): "
read GITUSER
[ -z "$GITUSER" ] && { echo "Got empty response - terminating." >&2 ; exit 1 ; }
printf "Enter git email: "
read GITEMAIL
[ -z "$GITEMAIL" ] && { echo "Got empty response - terminating." >&2 ; exit 1 ; }

echo "Setting up Git User/Email..."
git config --global user.name "$GITUSER" || exit 1
git config --global user.email "$GITEMAIL" || exit 1

##
## Amazon Cloud Setup
##
aws configure || exit 1


