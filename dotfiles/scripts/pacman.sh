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
yay -S /mnt base base-devel linux linux-firmware linux-headers openssh --noanswerclean --noanswerdiff
# install network and security tools
yay -S ufw gufw kesl networkmanager nm-connection-editor network-manager-applet bluez bluez-utils openvpn --noanswerclean --noanswerdiff
# install other desktop tools
yay -S anyrun-git ags waybar wl-clipboard --noanswerclean --noanswerdiff
# install audio server
yay -S pipewire pavucontrole wireplumber helvume --noanswerclean --noanswerdiff
# install xdg desktop portal
yay -S xdg-desktop-portal-hyprland xdg-desktop-portal-gtk --noanswerclean --noanswerdiff
# install authentication agent
yay -S polkit-kde-agent --noanswerclean --noanswerdiff
# install qt wayland support
yay -S qt5-wayland qt6-wayland --noanswerclean --noanswerdiff
# install theme settings
yay -S nwg-look qt6ct qt5ct --noanswerclean --noanswerdiff
# install cli tools
yay -S fish neovim tmux ripgrep yazi kitty curl latex-mk npm nodejs --noanswerclean --noanswerdiff
# install for neovim
yay -S metalua penlight luarocks cmake --noanswerclean --noanswerdiff
# install japanese input and font
yay -S fcitx5-im fcitx5-cskk noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-firacode-nerd otf-font-awesome  --noanswerclean --noanswerdiff
# install gui tools
yay -S vivaldi vivaldi-ffmpeg-codecs google-chrome webcord btop spotify vlc swayimg obsidian qalculate-gtk --noanswerclean --noanswerdiff
# install theme
yay -S catppuccin-gtk-theme-mocha
# install for btop
yay -S rocm-smi-lib --noanswerclean --noanswerdiff
# document tool
yay -S evince --noanswerclean --noanswerdiff
# install hyprland
yay -S hyprland hyprcursor hyprpaper hyprshot hypridle hyprlock hyprshade thunar --noanswerclean --noanswerdiff
