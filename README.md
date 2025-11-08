# Ubuntu sftp server setup script
This script will help you setup a sftp server with a sftp user.
It will allow you to do sftp connections to the server you are running this script on,
and it will allow the user called sft to connect to it.

It will store all files into a folder called /var/sftp/Files. When you login with the sftp user,
it will not allow you to browse to any other folder on that server that is not in this folder.
