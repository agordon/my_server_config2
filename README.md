# Server Config

Start with a clean/minimal Debian 7 image (e.g. `ami-0da18864`), then run:
```sh
$ wget https://raw.github.com/agordon/my_server_config2/master/bootstrap_debian.sh
$ ./bootstrap_debian.sh
```

This will install debian pacakges (using `setup_debian.sh`),
Perl packages (using `setup_perl.sh`), Python pacakges (using `setup_python.sh`),
LinuxBrew standard packages (using `setup_linuxbrew.sh`) and
custom LinuxBrew packages (using formulas in `./HomeBrewLocal`).

