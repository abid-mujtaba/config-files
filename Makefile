# Absolute path of the source folder required to create proper symlinks
SRC:=~/.config/repo

# Create symbolic links for all user config files
# Use -f to force creation of the links
user:
	ln -sf $(SRC)/user/.offlineimap.py ~/
	ln -sf $(SRC)/user/.offlineimaprc ~/

.PHONY: user root
