#!/usr/bin/env bash

# setup the firewall
ufw allow http https OpenSSH

# enable the firewall
ufw enable
