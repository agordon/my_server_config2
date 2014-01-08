#!/bin/sh

##
## Install useful python pacakges, using Python's PIP and Setuptools.
##
## This script assumes standard pacakges (e.g. development libraries,
##    python-dev, python-pip, libmysql-dev, etc.) are already installed
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

