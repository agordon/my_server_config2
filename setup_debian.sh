#!/bin/sh

##
## Install useful packages on a standard Debian 7.1 image (perhaps ubuntu, as well)
## This was tested on:
##  Debian Official 7.1 64bit AMI on US-EAST-1: ami-50d9a439 
##
## Last update:
##   agn,6-Jan-2014
if [ "$(id -u)" != "0" ] ; then
	echo "Error: This script requires root access. Use 'sudo'." >&2 ;
	exit 1
fi

##
## Start with standard debian pacakges.
##
apt-get update -y || exit 1
apt-get upgrade -y || exit 1
apt-get install -y \
	build-essential clang gfortran \
	autoconf automake libtool gettext autoconf-archive \
	git mercurial vim ctags vim-scripts scons meld cmake \
	unzip less graphviz gnuplot gawk \
	mysql-client \
	libcurl3-dev curl \
	python-dev python-pip \
	libgcrypt-dev \
	libblas-dev libblas-test \
	liblapack-test liblapack-dev \
	libmysqlclient-dev  libsqlite3-dev sqlite3  libatlas-dev \
	libxml2-dev libxslt-dev libfreetype6-dev libpng-dev libjpeg-dev \
	libfftw3-bin libfftw3-dev libncurses5-dev libboost-dev \
	libcppunit-dev libblast-dev libatlas-dev \
	ruby libbz2-dev libexpat-dev || exit 1


##
## Install Python Pacakges
## NOTE:
##    Better install from source to get the lastest versions,
##    instead of using the pre-packaged debian version of these packages.
##    (which is why so many '-dev' packages are needed).

# Upgrade “distribute” (Seems to be required, pip can’t handle that)
easy_install -U distribute

## Use pip to install these packages
PYTHON_PACKAGES="boto
awscli
scipy
MySQL-python
biopython
DendroPy
Flask
ipython
Jinja2
lxml
Pygments
pyasn1
PyVCF
termcolor
matplotlib
matplotlib-venn"
echo "$PYTHON_PACKAGES" | xargs -I{} pip install "{}"


##
## Install some Perl PAcakges
## NOTE:
##   Start by installing "cpanm"
curl -L http://cpanmin.us | perl - --self-upgrade

PERL_PACKAGES="App::Ack
DBD::mysql
DBD::SQLite
DBI
Moo"
echo "$PERL_PACKAGES" | xargs -I{} cpanm --force "{}"


