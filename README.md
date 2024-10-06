# About

Welcome! This is an attempt at setting up my personal configuration for different
systems. More to come...

# Display Usage

	$ cd /path/to/config_files/scripts
	$ ./set_config.sh -u OR ./get_config.sh -u

# Run Scripts

First time setting up Ubuntu? Open a new terminal and execute the following to
install most used dependencies, setup git, setup ssh, etc:

	$ cd /path/to/config_files/scripts
	$ ./first_config.sh

Run the get and set scripts to update the config files in the repo or set them
up in the current machine, respectively:

	$ cd /path/to/config_files/scripts
	$ ./set_config.sh -s [service] OR
	$ ./get_config.sh -s [service]

# Warning!!

The `set_config.sh` script will delete local files and replace them with the
ones from the repo. There are no security checks in place, so be completely sure
you want to run.

# Specific Installs

## awesome

    $ mkdir -p ~/.config/awesome
    $ ln -s /path/to/config_files/files_and_dirs/awesome/rc.lua ~/.config/awesome
    $ ln -s /path/to/config_files/files_and_dirs/awesome/autorun.sh ~/.config/awesome
    $ ln -s /path/to/config_files/files_and_dirs/awesome/themes ~/.config/awesome

### Enable Bluetooth

    $ sudo apt-get install bluez blueman
    $ sudo systemctl enable bluetooth
    $ sudo systemctl start bluetooth
    $ blueman-manager

### Multiple Monitors

Get the list of monitors:

    $ xrandr --auto
    $ xrandr --listmonitors

Setup the profile:

    $ xrandr --output DP-1-0.1 --right-of eDP-1
    $ xrandr --output HDMI-2 --left-of eDP-1

Add to `autorun.sh`:

    run autorandr --load atdc

## Emacs

	$ ln -s /path/to/config_files/files_and_dirs/emacs/init.el ~/.emacs.el
	$ cp /path/to/config_files/files_and_dirs/emacs/* ~/.emacs.d

## undo-tree

See: https://emacs.stackexchange.com/questions/233/how-to-proceed-on-package-el-signature-check-failure

## Others

Through `list-packages` search for:
* switch-window
* iedit

# Authors

Sergio Garcia-Vergara <sergiodotgarcia@gmail.com>
