######################################################################
#  ___________  ___  ___    
#  |___   ___|  | |  | |    Theo Uys 
#     |  |      | |  | |    
#     |  |      \ \__/ /    GitHub     : https://github.com/theouys
#     |__|       \____/
#
######################################################################
# Use Ubuntu 22.04 as base
FROM ubuntu:22.04

# Install OpenSSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir -p /var/run/sshd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create SFTP directory structure
RUN mkdir -p /var/sftp/Files

# Create sftp user (no shell access)
RUN useradd -m sftp -s /usr/sbin/nologin && \
    echo "sftp:sftp" | chpasswd && \
    chown root:root /var/sftp && \
    chmod 755 /var/sftp && \
    chown sftp:sftp /var/sftp/Files

# Configure SSH for SFTP-only access
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's@Subsystem sftp /usr/lib/openssh/sftp-server@Subsystem sftp internal-sftp@' /etc/ssh/sshd_config && \
    echo "\nMatch User sftp" >> /etc/ssh/sshd_config && \
    echo "  ChrootDirectory /var/sftp" >> /etc/ssh/sshd_config && \
    echo "  ForceCommand internal-sftp" >> /etc/ssh/sshd_config && \
    echo "  AllowTcpForwarding no" >> /etc/ssh/sshd_config && \
    echo "  X11Forwarding no" >> /etc/ssh/sshd_config


# Expose SFTP port
EXPOSE 22

# Run SSHD in foreground
CMD ["/usr/sbin/sshd", "-D"]
