function fish_user_key_bindings
    bind -M insert jk "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"

    for mode in insert default visual
    	bind -M $mode \cf forward-char
	end

	fzf_key_bindings
end

# Source: https://stackoverflow.com/a/48958650/2926226