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
	unzip less graphviz gnuplot gawk xsel xauth flex bison \
	pigz pbzip2 heirloom-mailx \
	mysql-client uuid-dev \
	libcurl3-dev curl \
	python-dev python-pip python-docutils \
	libgcrypt-dev libffi-dev libp11-kit-dev libgnutls-dev\
	libblas-dev libblas-test \
	liblapack-test liblapack-dev \
	libmysqlclient-dev  libsqlite3-dev sqlite3  libatlas-dev \
	libxml2-dev libxslt-dev libfreetype6-dev libpng-dev libjpeg-dev \
	libfftw3-bin libfftw3-dev libncurses5-dev libboost-dev \
	libcppunit-dev libblas-dev liblapack-dev libatlas-dev \
	ruby libbz2-dev libexpat-dev || exit 1

## Save space by removing cached packages
apt-get clean || exit 1


