#!/bin/sh

##
## Install useful Perl pacakges, using Cpan-Minus.
##
## This script assumes standard pacakges (e.g. development libraries,
##    libmysql-dev, etc.) are already installed
##    by a previous script like "setup_debian.sh".
##
## NOTE:
##    Better install from source to get the lastest versions,
##    instead of using the pre-packaged debian version of these packages.
##    (which is why so many '-dev' packages are needed).
##
## Last update:
##   agn,7-Jan-2014

if [ "$(id -u)" != "0" ] ; then
	echo "Error: This script requires root access. Use 'sudo'." >&2 ;
	exit 1
fi

##
## Step 1:
##    Start by installing "cpanm"
##
curl -L http://cpanmin.us | perl - --self-upgrade

## On Amazon-Linux,
## 'cpanm' is installed to '/usr/local/bin' which isn't on the $PATH for root.
if ! which cpanm > /dev/null ; then
	if [ -e "/usr/local/bin/cpanm" ] ; then
		export PATH=/usr/local/bin:$PATH
	else
		echo "Error: can't find 'cpanm' in \$PATH after installation" >&2
		exit 1
	fi
fi

##
## Step 2:
##    Install some packages
##
PERL_PACKAGES="App::Ack
Sort::Key::Natural
Template
Template::Plugin::Number::Format
Statistics::Descriptive
Date::Manip
DBD::mysql
DBD::SQLite
DBI
Moo"

echo "$PERL_PACKAGES" | xargs -I{} cpanm --notest --force "{}"
