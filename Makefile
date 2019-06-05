# Absolute path of the source folder required to create proper symlinks
SRC:=~/.config/repo

HOMEFILES:=.offlineimaprc .offlineimap.py .Rprofile .xinitrc .Xresources
MUTTFILES:=muttrc mailcap notmuchrc gmail comsats mutt-colors-neonwolf-256.muttrc


# Create symbolic links for all user config files
# Use -f to force creation of the links
user:
# Iterate over all files listed in HOMEFILES and create symlinks using a shell for loop
	@for f in $(HOMEFILES); do \
		echo ln -sf $(SRC)/user/$$f ~/; \
		ln -sf $(SRC)/user/$$f ~/; \
	done

	@for f in $(MUTTFILES); do \
		echo ln -sf $(SRC)/user/.mutt/$$f ~/.mutt/; \
		ln -sf $(SRC)/user/.mutt/$$f ~/.mutt/; \
	done


.PHONY: user root
