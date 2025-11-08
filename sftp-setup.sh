clear
echo "######################################################################"
echo "#  ___________  ___  ___    "
echo "#  |___   ___|  | |  | |    Theo Uys "
echo "#     |  |      | |  | |    Email      : theouys@outlook.com "
echo "#     |  |      \ \__/ /    GitHub     : https://github.com/theouys"
echo "#     |__|       \____/"
echo "#"
echo "######################################################################"
echo
echo "This script will help you set up a basic SFTP server on Ubuntu for"
echo "a user called sftp. Press ENTER to continue..."

read
sudo apt upgrade
sudo apt install ssh
sudo systemctl enable ssh
sudo systemctl restart ssh
sudo systemctl status ssh
sudo adduser sftp
sudo addgroup sftp
sudo usermod -a -G sftp sftp
sudo grep sftp /etc/group

sudo mkdir -p /var/sftp/Files
sudo chown root:root /var/sftp
sudo chmod 755 /var/sftp
sudo chown sftp:sftp /var/sftp/Files
echo "-------------------------------------------------"
echo "Match User sftp"
echo "ChrootDirectory /var/sftp"
echo "X11Forwarding no"
echo "AllowTcpForwarding no"
echo "ForceCommand internal-sftp"
echo 
echo "-------------------------------------------------"
echo "Add above to following file that is going to be opened. Press ENTER to continue..."
read

sudo vi /etc/ssh/sshd_config
sudo systemctl restart ssh