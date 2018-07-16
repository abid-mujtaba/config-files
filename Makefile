# Absolute path of the source folder required to create proper symlinks
SRC:=~/.config/repo

# Create symbolic links for all user config files
user:
	ln -s $(SRC)/user/.offlineimap.py ~/.offlineimap.py

.PHONY: user root
