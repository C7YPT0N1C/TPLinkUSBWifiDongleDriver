#!/bin/bash
if [[ $USER == root* ]]
then
    echo "! USER IS ROOT. PLEASE RUN SCRIPT AS NON-ROOT USER. !"
    exit
else
    echo "! USER IS NOT ROOT, CONTINUING. !"
fi

echo "! Please ensure USB Wifi Adaptor is plugged in prior to installation. !"
read -p "! Press enter to continue. !"

sudo apt update -y

sudo apt install dkms git build-essential libelf-dev linux-headers-$(uname -r) -y

if [ -d /home/$USER/rtl8812au/ ] 
then
    echo "! Directory /home/$USER/rtl8812au/ exists. Deleting. Please say yes to any confirmations that may appear. !"
    sudo rm -drf /home/$USER/rtl8812au
else
    echo "! Directory /home/$USER/rtl8812au/ does not exist. Deletion of directory not necessary. !"
fi

sudo apt install dkms git build-essential libelf-dev linux-headers-$(uname -r)

cd /home/$USER/
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au/

echo "! Ready to install driver. !"
read -p "! Press enter to continue. !"

sudo make dkms_install

echo "! Please remove the TP-Link adapter and plug it again. The LED on the adaptor should start to blink. !"
read -p "! Press enter to continue. !"

echo "! Confirming installation: Following output should be '8812au, 5.6.4.2_35491.20191025, [kernel-version], x86_64: installed'."
read -p "! Press enter to continue. !"

sudo dkms status

echo "! Installation complete. !"
read -p "! Press enter to exit !"

exit
