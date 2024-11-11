#!/usr/bin/bash

# if [[ -b $DEVNAME ]] && \
#    mount $DEVNAME /home/fabio/Ads/
# then
#    cp -a /home/fabio/Ads/ /media/fabio/BACKUP/teste/
# fi

wall usb-drive-connected

#echo "TIME BEFORE IS=$TIMEBEFORE"
CURRENT_DATE=$(date +'%Y-%m-%d %H:%M:%S %Z')
echo "$CURRENT_DATE : usb-drive-connected seen" >> /tmp/usb-drive-connected.txt
wall usb-drive-connected