# Clean Installer Script

This script is used for installing all the necessary components on a new instance of a Linux machine based on Debian. In detail:
1. Update and upgrade the system
2. Create user `bin` folder and add it to the `.bashrc` file (for persistance)
3. Create `tmp` folders for temporary Downloads (Credits for the idea: Zanna_37) and add it to crontab to execute at every @reboot
4. Install Google Chrome
5. Install Telegram Desktop
6. Install Vistual Studio Code
7. Install Spotify
8. Install Discord