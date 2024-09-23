# install yay
sudo pacman -S git curl
cd ~
mkdir gitclone
cd gitclone
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
# install essential packages
yay -S /mnt base base-devel linux linux-firmware linux-headers openssh --noconfirm
# install network and security tools
yay -S ufw gufw networkmanager nm-connection-editor bluez bluez-utils openvpn --noconfirm
# install other desktop tools
yay -S anyrun-git waybar --noconfirm
# install audio server
yay -S pipewire pavucontrole wireplumber helvume --noconfirm
# install authentication agent
yay -S polkit-kde-agent --noconfirm
# install qt wayland support
yay -S qt5-wayland qt6-wayland --noconfirm
# install theme settings
yay -S nwg-look qt6ct qt5ct --noconfirm
# install cli tools
yay -S fish neovim tmux ripgrep yazi kitty curl texlive npm nodejs lazygit udiskie --noconfirm
# install for neovim
yay -S metalua penlight luarocks cmake --noconfirm
# install japanese input and font
yay -S fcitx5-im fcitx5-cskk noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-firacode-nerd otf-font-awesome  --noconfirm
# install gui tools
yay -S vivaldi vivaldi-ffmpeg-codecs chromium webcord btop spotify vlc swayimg obsidian qalculate-gtk thunderbird github-desktop keypassxc selectdefaultapplication-git showmethekey pamac-aur --noconfirm

# install theme
yay -S catppuccin-gtk-theme-mocha catppuccin-cursors-mocha catppuccin-fcitx5-git papirus-folders-catppuccin-git btop-theme-catppuccin --noconfirm
# install for btop
yay -S rocm-smi-lib --noconfirm
# document tool
yay -S zathura zathura-pdf-mupdf --noconfirm
# install hyprland
# yay -S hyprland hyprcursor hyprpaper hyprshot hypridle hyprlock hyprshade thunar clipse --noanswerclean --noanswerdiff
yay -S sway swaybg scdoc copyq swaylock-effects-git swayidle wdisplay sov workstyle nwg-displays --noconfirm
# install tools for screenshot
yay -S grim slurp swappy --noconfirm
# for screen share
yay -S xdg-desktop-portal-wlr xdg-desktop-portal xwaylandvideobridge --noconfirm
yay -S syncthing syncthing-gtk xppenlinux3 xorg-xhost --noconfirm
