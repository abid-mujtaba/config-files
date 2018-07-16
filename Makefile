# Absolute path of the source folder required to create proper symlinks
SRC:=~/.config/repo

HOMEFILES:=.offlineimaprc .offlineimap.py

# Create symbolic links for all user config files
# Use -f to force creation of the links
user:
# Iterate over all files listed in HOMEFILES and create symlinks using a shell for loop
	@for f in $(HOMEFILES); do \
		echo ln -sf $(SRC)/user/$$f ~/; \
		ln -sf $(SRC)/user/$$f ~/; \
	done
	

.PHONY: user root
