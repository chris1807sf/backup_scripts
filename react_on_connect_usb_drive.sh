#!/usr/bin/bash
#
# script expected to be triggered by systemd service; as defined via udev

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

TEMP_FILE=/tmp/$BASENAME_SCRIPT.txt

#exec >> $TEMP_FILE
#exec 2>&1

wall react_on_connected_usb_drive

#echo "TIME BEFORE IS=$TIMEBEFORE"
CURRENT_DATE=$(date +'%Y-%m-%d %H:%M:%S %Z')
echo "$CURRENT_DATE: $BASENAME_SCRIPT is triggered" >> $TEMP_FILE
df >> $TEMP_FILE
echo "DEVNAME: $DEVNAME" >> $TEMP_FILE

#$DEVNAME is expected to be similar to:  /dev/sda1

#mount_result=$(mount $DEVNAME /home/chris/mnt/)
#echo "mount_result: $mount_result" >> $TEMP_FILE

wall usb-drive-connected - done

exit 0

if [[ -b $DEVNAME ]] && \
    mount $DEVNAME /home/chris/mnt/
then
   echo "mount done" >> $TEMP_FILE
   cp -a $TEMP_FILE /home/chris/mnt/
   echo "cp done" >> $TEMP_FILE
else
   echo "No $DEVNAME seen" >> $TEMP_FILE
fi

wall usb-drive-connected - done