#!/usr/bin/env bash

# ask for the new username
read -p 'Enter your new username here: ' NEWUSER

# set the path for the user
USERSSHPATH=/home/$NEWUSER/.ssh

# creates the user, you will be promted for a password
adduser $NEWUSER && usermod -aG sudo $NEWUSER

# make a .ssh directory for the user
mkdir $USERSSHPATH && chmod 700 $USERSSHPATH && chown -R $NEWUSER:$NEWUSER $USERSSHPATH

# ask for the users SSH key
read -sp 'Enter your SSH key here: ' USERKEY

# put the SSH key and set permissions
echo $USERKEY >> $USERSSHPATH/authorized_keys && chmod 600 $USERSSHPATH/authorized_keys

# modify permissions on the ssh authorized keys
chown $NEWUSER:$NEWUSER $USERSSHPATH/authorized_keys
