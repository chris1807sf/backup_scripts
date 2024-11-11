#!/usr/bin/bash

# if [[ -b $DEVNAME ]] && \
#    mount $DEVNAME /home/fabio/Ads/
# then
#    cp -a /home/fabio/Ads/ /media/fabio/BACKUP/teste/
# fi


TEMP_FILE=/tmp/usb-drive-connected.txt

exec >> $TEMP_FILE
exec 2>&1

sleep 1

wall usb-drive-connected

#echo "TIME BEFORE IS=$TIMEBEFORE"
CURRENT_DATE=$(date +'%Y-%m-%d %H:%M:%S %Z')
echo "$CURRENT_DATE : usb-drive-connected seen" >> $TEMP_FILE
df >> $TEMP_FILE
echo "DEVNAME: $DEVNAME" >> $TEMP_FILE

#$DEVNAME is expected to be similar to:  /dev/sda1

mount_result=$(mount $DEVNAME /home/chris/mnt/)
echo "mount_result: $mount_result" >> $TEMP_FILE

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