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

# Authors

Sergio Garcia-Vergara <sergiodotgarcia@gmail.com>
