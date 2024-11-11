#!/usr/bin/bash
# copy ro 
#

BASENAME_SCRIPT=$(basename $0)
HOSTNAME=$(hostname)

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
#echo example:
#echo -e "I ${RED}love${NC} Stack Overflow"

log() {
    echo -e "$BASENAME_SCRIPT: $1"
}

#constants
DEV_RULES_FILE='90-usb-backup.rules'
DEV_RULES_TARGET_LOCATION='/etc/udev/rules.d/'

#copy the .rules file
sudo cp $DEV_RULES_FILE $DEV_RULES_TARGET_LOCATION$DEV_RULES_FILE

#reload the udev rules 
sudo udevadm control --reload-rules
#trigger the new rules:
sudo udevadm trigger