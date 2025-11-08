# Ubuntu sftp server setup script
This script will help you setup a sftp server with a user called sftp.
This script is spesifically for Ubuntu servers.
It will share a folder **/var/sftp/Files** to sftp clients and it will protect
the server from users browsing to any other folder other that what is in the folder **/var/sftp/Files**.
This means you can share this SFTP server with someone without them being able to browse to other locations
on the server except the one already mentioned.

