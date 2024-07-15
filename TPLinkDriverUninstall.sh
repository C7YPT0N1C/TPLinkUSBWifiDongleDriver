#!/bin/bash
if [[ $USER == root* ]]
then
    echo "! USER IS ROOT. PLEASE RUN SCRIPT AS NON-ROOT USER. !"
    exit
else
    echo "! USER IS NOT ROOT, CONTINUING. !"
fi

sudo apt update -y

if [ -d /home/$USER/rtl8812au/ ]
then
    echo "! Directory /home/$USER/rtl8812au/ exists. Deleting. Please say yes to any confirmations that may appear. !"
    sudo rm -drf /home/$USER/rtl8812au
else
    echo "! Directory /home/$USER/rtl8812au/ does not exist. Deletion of directory not necessary. !"
fi

echo "! Ready to uninstall driver. !"
read -p "! Press enter to continue. !"

sudo dkms remove 8812au/5.6.4.2_35491.20191025

read -p "! Confirming uninstallation: Following output should be blank. Press enter to continue. !"

sudo dkms status

echo "! Uninstallation complete. !"
read -p "! Press enter to exit. !"

exit
