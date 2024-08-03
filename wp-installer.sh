#!/bin/bash
clear
echo -e "\e[38;5;208m
        _______ __   __   __ ______ _______ _______
       /__  __// /  / /  / // __  // _____// _____/
        / /   / /  / /__/ // /_/ // /____ / /____
       / /   / /  /__  __// __  //____  //____  /
    __/ /__ / /____ / /  / / / /_____/ /_____/ /
   /______//______//_/  /_/ /_//______//______/\e[0m"
echo -e "\e[38;5;208m\e[0m"
echo -e "\e[38;5;208m\e[0m"
echo -e "\e[38;5;208m  WordPress script installer by \e[34m𓆩 𝐈𝐋𝐘𝐀𝐒𝐒 𓆪 \e[0m"
echo -e "\e[38;5;208m      GitHub: \e[32mhttps://github.com/FasterExE\e[0m"
echo -e "\e[38;5;208m      Telegram: \e[32mhttps://t.me/IlyassExE\e[0m"
echo -e "\e[38;5;208m\e[0m"
echo -e "\e[38;5;208m\e[0m"

sleep 1

WHITE='\033[1;37m'
BLUE_BG='\033[44m'
RESET='\033[0m'

function execute_command() {
    echo -e "$1"
    sleep 1.5
    eval "$2"
}

trap 'echo -e "\nScript terminated by user. Exiting..."; exit' INT

execute_command "${BLUE_BG}${WHITE}UPDATE AND UPGRADE${RESET}" "apt update && apt upgrade -y"

execute_command "${BLUE_BG}${WHITE}INSTALL APACHE${RESET}" "apt install apache2 -y"

execute_command "${BLUE_BG}${WHITE}INSTALL MYSQL${RESET}" "apt install mariadb-server mariadb-client -y"

execute_command "${BLUE_BG}${WHITE}MYSQL SECURE INSTALLATION${RESET}" "mysql_secure_installation"

execute_command "${BLUE_BG}${WHITE}INSTALL PHP${RESET}" "apt install php php-mysql -y"

execute_command "${BLUE_BG}${WHITE}CREATE WORDPRESS DATABASE${RESET}" "mysql -u root -p <<MYSQL_SCRIPT
CREATE DATABASE ilyass;
CREATE USER 'ilyass'@'localhost' IDENTIFIED BY 'ilyass';
GRANT ALL ON ilyass.* TO 'ilyass'@'localhost' IDENTIFIED BY 'ilyass';
FLUSH PRIVILEGES;
Exit;
Done;"

execute_command "${BLUE_BG}${WHITE}INSTALL WORDPRESS CMS${RESET}" "cd /tmp && wget https://wordpress.org/latest.tar.gz; tar -xvf latest.tar.gz; cp -R wordpress /var/www/html/; chown -R www-data:www-data /var/www/html/wordpress/; chmod -R 755 /var/www/html/wordpress/; mkdir /var/www/html/wordpress/wp-content/uploads; chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads/"

execute_command "${BLUE_BG}${WHITE}DATABASE INFO${RESET}
${ORANGE_BG}${WHITE}   ${RESET}"

echo -e "\e[42;1;37mDatabase Name\e[0m \e[34milyass\e[0m"
echo -e "\e[42;1;37mUsername\e[0m \e[34milyass\e[0m"
echo -e "\e[42;1;37mPassword\e[0m \e[42;1;37m\e[41;1;37milyass\e[0m"
echo -e "\e[42;1;37mDatabase Host\e[0m \e[34mlocalhost\e[0m"
echo -e "\e[42;1;37mTable Prefix\e[0m \e[34mwp_\e[0m"
echo -e "\e[42;1;37\e[0m"
echo -e "To complete install go to → \e[32mhttp://$(hostname -I | awk '{print $1}')/wordpress\e[0m"

sleep 3

echo -e "\nEnjoy!"
