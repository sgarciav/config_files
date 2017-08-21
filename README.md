# About

Welcome! This is an attempt at setting up my personal configuration for different
systems. More to come...

# Usage

	$ cd /path/to/config_files/scripts
	$ ./set_config.sh -u OR ./get_config.sh -u

# Run Scripts

Run the get and set scripts to update the config files in the repo or set them
up in the current machine, respectively:

	$ cd /path/to/config_files/scripts
	$ ./set_config.sh -s [service] OR
	$ ./get_config.sh -s [service]

# Warning

The `set_config.sh` script will delete local files and replace them with the
ones from the repo. There are no security checks in place, so be completely sure
you want to run.

# Authors

Sergio Garcia-Vergara <sergiodotgarcia@gmail.com>
