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
yay -S /mnt base base-devel linux linux-firmware linux-headers openssh less --noconfirm
# install network and security tools
yay -S ufw gufw networkmanager nm-connection-editor network-manager-applet bluez bluez-utils blueman wireguard usbutils --noconfirm
# install other desktop tools
yay -S anyrun-git waybar --noconfirm
# install audio server
yay -S pipewire pavucontrol wireplumber helvum sway-audio-idle-inhibit-git --noconfirm
# install authentication agent
yay -S polkit-kde-agent --noconfirm
# install qt wayland support
yay -S qt5-wayland qt6-wayland --noconfirm
# install theme settings
yay -S nwg-look qt6ct qt5ct --noconfirm
# install cli tools
yay -S fish neovim tmux ripgrep yazi kitty curl texlive npm nodejs lazygit udiskie zoxide fzf eza --noconfirm
# install for neovim
yay -S metalua penlight luarocks cmake --noconfirm
# install japanese input and font
yay -S fcitx5-im fcitx5-skk skk-jisyo skk-emoji-jisyo noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-firacode-nerd otf-font-awesome  --noconfirm
# install gui tools
yay -S zen-browser-bin google-chrome
yay -S chromium webcord-git btop spotify vlc swayimg obsidian qalculate-gtk thunderbird keypassxc selectdefaultapplication-git showmethekey pamac-aur saber rustdesk --noconfirm

# install theme
yay -S catppuccin-gtk-theme-mocha catppuccin-cursors-mocha fcitx5-gruvbox-dark-theme-git papirus-folders-catppuccin-git btop-theme-catppuccin --noconfirm
# install theme thunderbird 
mkdir ~/gitclone
cd ~/gitclone
git clone https://github.com/catppuccin/thunderbird.git
# install theme for qt5ct
git clone https://github.com/catppuccin/qt5ct.git
mkdir -p ~/.config/qt5ct/colors/
cd ~/gitclone/qt5ct/themes
cp Catppuccin-Mocha.conf ~/.config/qt5ct/colors/
# tmux config
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.0 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux


# install for btop
yay -S rocm-smi-lib --noconfirm
# document tool
yay -S zathura zathura-pdf-mupdf
yay -S xorg-desktop-portal xorg-dekstop-portal-gtk xdg-desktop-portal-wlr xorg-xauth xorg-xhost xorg-xhost xorg-xwayland xwaylandvideobridge
yay -S sway swaybg scdoc wl-clipboard clipse swaylock-effects-git swayidle sov workstyle-git nwg-displays swaync autotiling wayvnc kanagawa-gtk-theme-git steamos-compositor-plus --noconfirm
# install tools for screenshot
yay -S grim slurp swappy --noconfirm
# for screen share
yay -S xdg-desktop-portal-wlr xdg-desktop-portal xwaylandvideobridge --noconfirm
yay -S syncthing syncthing-gtk syncthingtray xppenlinux3 xorg-xwayland xorg-xhost --noconfirm
sudo yay -S timeshift neofetch tailscale ethtool kdeconnect sherlock nextcloud-client jellyfin-media-player-git --noconfirm
