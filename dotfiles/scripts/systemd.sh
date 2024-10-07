sudo systemctl enable bluetooth
sudo systemctl enable syncthing@muta.service
loginctl enable-linger muta
sudo systemctl enable tailscale.service
# enable ip forwarding
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf
sudo systemctl enable greetd.service
