#!/bin/bash

#install
apt update && apt upgrade
apt install python3 python3-pip git
git clone https://github.com/SatanTech/xolpanel1.git
unzip xolpanel1/xolpanel1.zip
pip3 install -r kyt/requirements.txt
pip3 install pillow

#isi data
echo ""
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
read -e -p "[*] Input Your Domain :" domain
echo -e BOT_TOKEN='"'$bottoken'"' >> /root/xolpanel1/var.txt
echo -e ADMIN='"'$admin'"' >> /root/xolpanel1/var.txt
echo -e DOMAIN='"'$domain'"' >> /root/xolpanel1/var.txt
clear
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "DOMAIN         : $bottoken"
echo "Email          : $admin"
echo "Api Key        : $domain"
echo -e "==============================="
echo "Setting done"

cat > /etc/systemd/system/xolpanel.service << END
[Unit]
Description=Simple XolPanel - @XolPanel
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 -m xolpanel1
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start xolpanel1 
systemctl enable xolpanel1

clear

echo " Installations complete, type /menu on your bot"
