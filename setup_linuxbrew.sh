#!/bin/sh

##
## Installs LinuxBrew, and download more useful programs.
##
## This script assumes standard pacakges (e.g. development libraries,
##    libmysql-dev, etc.) are already installed
##    by a previous script like "setup_debian.sh".
##
## Last update:
##   agn,7-Jan-2014

if [ "$(id -u)" = "0" ] ; then
	echo "Error: DO NOT run this script with 'sudo'. The script will ask for 'sudo' password only for certain (hopefully safe) operations" >&2 ;
	exit 1
fi


##
## LinuxBrew will reside under $HOME/sources/LinuxBrew .
## All packages will be installed there.
## If you change the PATH, be sure to change the
## "$PATH" settings in "~/.bashrc" (from "./dot_files/bashrc").
##
cd $HOME
mkdir -p sources || exit 1
cd sources || exit 1

##
## Step 1:
##   Download LinuxBrew
if [ ! -d "LinuxBrew" ]; then
	git clone https://github.com/Homebrew/linuxbrew.git ./LinuxBrew/ || exit 1
fi

BREWHOME=$HOME/sources/LinuxBrew/
if [ ! -x "$BREWHOME/bin/brew" ]; then
	echo "Error: something went wrong with the installation of LinuxBrew (expecting 'brew' to exist in $BREWHOME/bin)" >&2
	exit 1
fi
PATH=$BREWHOME/bin:$PATH

##
## Step 2:
##    Tap a few more sources
##
brew tap homebrew/science

##
## Step 3:
##    Install some packages

BREW_PACKAGES="
tabix
bedtools
samtools
fastx-toolkit
blat
bowtie
bowtie2
bwa
vcftools
jq
https://raw.github.com/agordon/homebrew-science/fc32312c792a9e4b1398e9595d11c12a47cca606/idcoefs.rb
https://raw.github.com/agordon/lobstr-code/autotools_cleanup/lobSTR.rb
https://raw.github.com/agordon/bin_scripts/master/gordon_bin_scripts.rb
"

echo "$BREW_PACKAGES" | xargs -I{} brew install "{}"
