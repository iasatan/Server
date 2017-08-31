export LANG=C
export DEBIAN_FRONTEND=noninteractive
export APT_LISTCHANGES_FRONTEND=none
apt-get update
apt-get upgrade
apt-get --allow-unauthenticated install openmediavault-keyring
apt-get update
apt-get --yes --force-yes --auto-remove --show-upgraded \
	--no-install-recommends \
	--option Dpkg::Options::="--force-confdef" \
	--option DPkg::Options::="--force-confold" \
	install postfix openmediavault
# Initialize the system and database.
dpkg-reconfigure openmediavault
omv-initsystem
