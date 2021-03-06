#!/bin/bash
echo ""
echo "=================================="
echo "=== Initializing clean install ==="
echo "=================================="
echo ""
echo "=== Update and Upgrade: it may take a while"
sudo apt update && sudo apt upgrade
echo ""
echo "======================================="
echo "=== Creating /home/$USER/bin folder ==="
echo "======================================="
echo ""
mkdir /home/$USER/bin
echo ""
echo "============================================="
echo "=== Adding /home/$USER/bin folder to path ==="
echo "============================================="
echo ""
echo "# User added lines" >> ~/.bashrc
echo "# ADD /home/alright/bin folder in the PATH" >> ~/.bashrc
echo "PATH=\$PATH:\$HOME/bin" >> ~/.bashrc
echo "export PATH" >> ~/.bashrc
echo ""
echo "==================================="
echo "=== Creating tmp_folders script ==="
echo "==================================="
echo ""
TMP=/tmp/_Alberto_
INSTALLERS=$TMP/__installers__
mkdir ~/scripts
mkdir ~/scripts/tmp_folders
cat ~/scripts/tmp_folders/tmp_folders.sh << EOF
#!/bin/bash

TMP=/tmp/_Alberto_
mkdir $TMP
mkdir $TMP/__installers__
mkdir $TMP/__transient__
mkdir $TMP/__to_del__
EOF
chmod +x ~/scripts/tmp_folders/tmp_folders.sh
~/scripts/tmp_folders/tmp_folders.sh
echo ""
echo "===================================="
echo "=== Adding to crontab on @reboot ==="
echo "===================================="
echo ""
crontab -l > tmp_cron
echo "@reboot ~/scripts/tmp_folders/tmp_folders.sh" >> tmp_cron
crontab tmp_cron
rm tmp_cron
echo ""
echo "=========================="
echo "=== Downloading Chrome ==="
echo "=========================="
echo ""
wget -P $INSTALLERS -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install $INSTALLERS/chrome.deb
echo ""
echo "==========================="
echo "=== Installing Telegram ==="
echo "==========================="
echo ""
sudo apt install telegram-desktop
echo ""
echo "====================================="
echo "=== Installing Visual Studio Code ==="
echo "====================================="
echo ""
wget -P $INSTALLERS -O vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo apt install $INSTALLERS/vscode.deb
echo ""
echo "=========================="
echo "=== Installing Spotify ==="
echo "=========================="
echo ""
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client
echo ""
echo "=========================="
echo "=== Installing Discord ==="
echo "=========================="
echo ""
wget -P $INSTALLERS -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo apt install $INSTALLERS/discord.deb