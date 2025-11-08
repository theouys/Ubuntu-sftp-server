clear
echo "######################################################################"
echo "#  ___________  ___  ___    "
echo "#  |___   ___|  | |  | |    Theo Uys "
echo "#     |  |      | |  | |    "
echo "#     |  |      \ \__/ /    GitHub     : https://github.com/theouys"
echo "#     |__|       \____/"
echo "#"
echo "######################################################################"
echo
echo "This script will help you set up a basic SFTP server on Ubuntu for"
echo "a user called sftp. Press ENTER to continue..."

read
apt upgrade
apt install ssh

service restart ssh

adduser sftp
addgroup sftp
usermod -a -G sftp sftp
grep sftp /etc/group

mkdir -p /var/sftp/Files
chown root:root /var/sftp
chmod 755 /var/sftp
chown sftp:sftp /var/sftp/Files
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

vi /etc/ssh/sshd_config
service ssh start