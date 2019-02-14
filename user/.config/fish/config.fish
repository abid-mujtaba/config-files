set -gx PATH /home/abid/.local/texlive/2018/bin/x86_64-linux $PATH
set -gx PATH /home/abid/.local/texlive/2018/texmf-dist/scripts/texlive $PATH
set -gx PATH /home/abid/.local/bin $PATH

set -gx MANPATH /home/abid/.local/texlive/2018/texmf-dist/doc/man (manpath)
set -gx INFOPATH /home/abid/.local/texlive/2018/texmf-dist/doc/info $INFOPATH

set -g theme_display_ruby no
set -g theme_nerd_fonts yes
set -g theme_display_date no

# Enable vi-mode
fish_vi_key_bindings

# Use 'jk' to escape insert mode in vi
fish_user_key_bindings

# Set environment variable required by Java applications (e.g. Pycharm) to work correctly with a tiling window manager (e.g. dwm)
set -g _JAVA_AWT_WM_NONREPARENTING 1

# Set Window Manager Name to LG3D for same reason as above
# wmname LG3D
