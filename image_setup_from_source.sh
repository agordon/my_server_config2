#!/bin/sh

##
## Install some programs from source code.
## Every program needs special handling...
##
## NOTE: many prerequisits are installed by
##       the script 'image_setup_standard_packages.sh'
##
## TODO: What I really want is a "homebrew" for debian
##      
##
## Last update:
##   agn,6-Jan-2014
##
##
if [ "$(id -u)" = "0" ] ; then
	echo "Error: DO NOT run this script with 'sudo'. The script will ask for 'sudo' password only for certain (hopefully safe) operations" >&2 ;
	exit 1
fi

cd $HOME

mkdir -p sources || exit 1
cd sources || exit 1

##
## Latest and Greatest of CoreUtls
##
if [ ! -d "coreutils-8.22" ] ; then
	wget http://ftp.gnu.org/gnu/coreutils/coreutils-8.22.tar.xz || exit 1
	tar -xf coreutils-8.22.tar.xz || exit 1
	rm coreutils-8.22.tar.xz || exit 1
fi
cd coreutils-8.22 || exit 1
./configure || exit 1
make || exit 1
sudo -p "Enter SUDO password to install 'coreutils': " make install || exit 1
cd .. || exit 1

##
## my Binary Scripts
##
if [ ! -d "bin_scripts" ] ; then
   git clone https://github.com/agordon/bin_scripts.git || exit 1
fi
cd bin_scripts || exit 1
git pull || exit 1
./bootstrap.sh || exit 1
./configure || exit 1
make || exit 1
sudo -p "Enter SUDO password to install 'bin_scripts': " make install || exit 1
cd .. || exit 1

##
## BedTools
##
if [ ! -d "bedtools" ] ; then
	git clone https://github.com/arq5x/bedtools.git || exit 1
fi
cd bedtools || exit 1
git pull || exit 1
make || exit 1
sudo -p "Enter SUDO password to install 'bedtools': " cp bin/bedtools /usr/local/bin/
cd .. || exit 1

##
## LobSTR
##
if [ ! -d "lobstr-code" ] ; then
	git clone https://github.com/agordon/lobstr-code.git || exit 1
fi
cd lobstr-code || exit 1
git pull || exit 1
## NOTE: ATM, trying "reconf" generates an invalid "configure" - perhaps a missing M4 file?
./configure || exit 1
make || exit 1
sudo -p "Enter SUDO password to install 'lobSTR': " make install || exit 1
cd .. || exit 1


##
## SamTools
##
if [ ! -d "samtools" ] ; then
	git clone https://github.com/samtools/samtools.git || exit 1
fi
cd samtools || exit 1
## NOTE: The latest version (0.2.0-rcX) doesn't compile cleanly without more libraries
git checkout 0.1.9 || exit 1
make || exit 1
sudo -p "Enter SUDO password to install 'samtools': " cp samtools bcftools/bcftools bcftools/vcfutils.pl /usr/local/bin/ || exit 1
cd .. || exit 1

##
## Tabix
##
if [ ! -d "tabix" ] ; then
	git clone https://github.com/samtools/tabix.git || exit 1
fi
cd tabix || exit 1
git pull || exit 1
make || exit 1
sudo -p "Enter SUDO password to install 'tabix': " cp bgzip tabix /usr/local/bin/
cd .. || exit 1

