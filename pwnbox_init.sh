sudo apt update
sudo apt install xrdp xorgxrdp
sudo rm /etc/xrdp/xrdp.ini
sudo rm /etc/xrdp/sesman.ini
sudo wget -O /etc/xrdp/xrdp.ini https://raw.githubusercontent.com/s4ndev/HTB-pwnbox-scripts/main/xrdp/xrdp.ini
sudo wget -O /etc/xrdp/sesman.ini https://raw.githubusercontent.com/s4ndev/HTB-pwnbox-scripts/main/xrdp/sesman.ini
echo "mate-session" > ~/.xsession
sudo systemctl restart xrdp
sudo systemctl enable xrdp
sudo gsettings set org.mate.Marco.general compositing-manager false
# temporary testing feature to see if the script executes
curl -X POST -d "executed=TRUE" https://posttestserver.dev/p/6mixd5d7p45crtyk/post
sudo reboot
