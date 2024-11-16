#!/usr/bin/bash
#
# script expected to be triggered by systemd service; as defined via udev

BASENAME_SCRIPT=$(basename $0)
HOSTNAME=$(hostname)

LOG_FILE=/tmp/$BASENAME_SCRIPT.txt
BACKUP_DIR=/media/chris/T9/backups/chris-thinkpad/

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
#echo example:
#echo -e "I ${RED}love${NC} Stack Overflow"

log() {
   CURRENT_DATE=$(date +'%Y-%m-%d %H:%M:%S %Z')
   echo -e "$BASENAME_SCRIPT, $CURRENT_DATE: $1"
}

log_file() {
   CURRENT_DATE=$(date +'%Y-%m-%d %H:%M:%S %Z')
   echo -e "$BASENAME_SCRIPT, $CURRENT_DATE: $1" >> $LOG_FILE
}

#exec >> $TEMP_FILE
#exec 2>&1

log "is triggered"
log_file "is triggered"

log "USER: $USER"
log_file "USER: $USER"


#wait 1 sec for the device to have been mounted
sleep 1

df >> $LOG_FILE

if [[ -d $BACKUP_DIR ]] 
then
   log_file "$BACKUP_DIR exists"
   cp -a $LOG_FILE $BACKUP_DIR
   log_file "cp done"
else
   log_file "$BACKUP_DIR doesn't exists"
fi

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
