sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S --needed - < ./files/installs.txt
./scripts/setfile.sh
./scripts/security.sh
./scripts/theme.sh
./scripts/neovim.sh
./scripts/systemd.sh
