#!/bin/sh

DIR=$(mktemp -d) || exit 1
cd "$DIR" || exit 1

##
## Download Setup Scripts
##
wget --no-verbose https://raw.github.com/agordon/my_server_config2/master/setup_debian.sh
wget --no-verbose https://raw.github.com/agordon/my_server_config2/master/setup_perl.sh
wget --no-verbose https://raw.github.com/agordon/my_server_config2/master/setup_python.sh
wget --no-verbose https://raw.github.com/agordon/my_server_config2/master/setup_linuxbrew.sh
wget --no-verbose https://raw.github.com/agordon/my_server_config2/master/setup_user_data.sh
chmod a+x setup_debian.sh setup_perl.sh setup_python.sh setup_linuxbrew.sh setup_user_data.sh

##
## Download Dot-Files
##
wget --no-verbose https://raw.github.com/agordon/my_server_config2/master/dot_files/bashrc
wget --no-verbose https://raw.github.com/agordon/my_server_config2/master/dot_files/vimrc
wget --no-verbose https://raw.github.com/agordon/my_server_config2/master/dot_files/gitconfig

##
## Put Dot-files in-place
## NOTE!
##   This overrides any existing files
mv bashrc ~/.bashrc
mv vimrc ~/.vimrc
mv gitconfig ~/.gitconfig

## Once we have ".bashrc", use it
. ~/.bashrc

##
## Install Standard Packages
##
sudo -p "Enter SUDO password to install debian packages: " ./setup_debian.sh
sudo -p "Enter SUDO password to install Python packages: " ./setup_python.sh
sudo -p "Enter SUDO password to install Perl packages: " ./setup_perl.sh

##
## Install LinuxBrew packages
##
./setup_linuxbrew.sh

##
## Setup user-configurable data (AWS keys, GIT username)
##
./setup_user_data.sh

