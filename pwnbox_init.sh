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

dconf write /org/mate/desktop/background/primary-color "'#000000'"
dconf write /org/mate/desktop/background/secondary-color "'#000000'"
dconf write /org/mate/desktop/background/picture-options "'none'"
dconf write /org/mate/desktop/background/picture-filename "''"

# temporary testing feature to see if the script executes
# curl -X POST -d "executed=TRUE" https://posttestserver.dev/p/EXAMPLE
