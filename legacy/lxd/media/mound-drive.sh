#!/bin/bash

set -e

# Define variables
USERNAME="media"
USERID=1000
GROUPNAME="media"
GROUPID=1000
SERVICE="sonarr.service"
SONARR_DIR="/var/lib/sonarr"
SONARR_EXECUTABLE="/opt/Sonarr/Sonarr"
SYSTEMD_USER_DIR="/home/$USERNAME/.config/systemd/user/"

# Create group if it doesn't exist
if ! getent group $GROUPNAME >/dev/null; then
    echo "Creating group $GROUPNAME with GID $GROUPID"
    sudo groupadd -g $GROUPID $GROUPNAME
else
    echo "Group $GROUPNAME already exists"
fi

# Create user if it doesn't exist, with home directory
if ! id -u $USERNAME >/dev/null 2>&1; then
    echo "Creating user $USERNAME with UID $USERID, home directory, and adding to group $GROUPNAME"
    sudo useradd -u $USERID -g $GROUPNAME -m $USERNAME
else
    echo "User $USERNAME already exists"
fi

# Set permissions for /var/lib/sonarr
if [ -d "$SONARR_DIR" ]; then
    echo "Setting read and write permissions for group $GROUPNAME on $SONARR_DIR"
    sudo chown -R :$GROUPNAME $SONARR_DIR
    sudo chmod -R g+rw $SONARR_DIR
else
    echo "Directory $SONARR_DIR does not exist!"
fi

# Set execute permission for group on Sonarr executable
if [ -f "$SONARR_EXECUTABLE" ]; then
    echo "Allowing group $GROUPNAME to execute $SONARR_EXECUTABLE"
    sudo chown :$GROUPNAME $SONARR_EXECUTABLE
    sudo chmod g+rx $SONARR_EXECUTABLE
else
    echo "Executable $SONARR_EXECUTABLE does not exist!"
fi

# Create user-specific systemd service directory if it doesn't exist
#if [ ! -d "$SYSTEMD_USER_DIR" ]; then
#    echo "Creating systemd user directory for $USERNAME"
#    sudo -u $USERNAME mkdir -p $SYSTEMD_USER_DIR
#fi

# Setup user-level systemd service
USER_SERVICE_PATH="$SYSTEMD_USER_DIR/$SERVICE"

echo "Creating user-level systemd service for $USERNAME with additional arguments"
cat <<EOF | sudo -u $USERNAME tee $USER_SERVICE_PATH
[Unit]
Description=Sonarr service for $USERNAME

[Service]
ExecStart=$SONARR_EXECUTABLE -nobrowser -data=$SONARR_DIR
User=$USERNAME
Group=$GROUPNAME
Restart=on-failure

[Install]
WantedBy=default.target
EOF

# Enable and start the user-level service
echo "Enable and start the systemd user service for $USERNAME"
sudo -u $USERNAME systemctl --user daemon-reload
sudo -u $USERNAME systemctl --user enable $SERVICE
sudo -u $USERNAME systemctl --user start $SERVICE

echo "Script execution completed!"