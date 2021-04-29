#!/bin/bash
LOGFILE="/var/logs/Borg.txt"

# Close if rclone/borg running
if pgrep "borg" || pgrep "rclone" > /dev/null 
then
    echo "$(date "+%m-%d-%Y %T") : Backup already running, exiting" 2>&1 | tee -a $LOGFILE
    exit
    exit
fi

# Close if parity sync started (disabled for now)
#PARITYCHK=$(/root/mdcmd status | egrep STARTED)
#if [[ $PARITYCHK == *"STARTED"* ]]; then
#    echo "Parity check running, exiting"
#    exit
#    exit
#fi


#This is the location your Borg program will store the backup data to
export BORG_REPO='/mnt/cloud/gdrive'

#This is the location you want Rclone to send the BORG_REPO to 
export CLOUDDEST='gdrive:'

#Speeds up the backup by caching more
#export BORG_FILES_CACHE_TTL=26

#Setting this, so you won't be asked for your repository passphrase:
export BORG_PASSPHRASE='YOURREPOKEY'

export BORG_CACHE_DIR='/mnt/user/appdata/borg/cache/'
export BORG_BASE_DIR='/mnt/user/appdata/borg/'

#Backup my unraid directories into an archive
SECONDS=0


echo "$(date "+%m-%d-%Y %T") : Borg backup has started" 2>&1 | tee -a $LOGFILE
borg create                         \
    --verbose                       \
    --info                          \
    --list                          \
    --filter AMEx                   \
    --files-cache=mtime,size        \
    --stats                         \
    --show-rc                       \
    --compression lz4               \
    --exclude-caches                \
    --exclude /mnt/user/myfirstexcludeddirectory              \
    --exclude /mnt/user/mysecondexcludedpdirectory             \
    --exclude /mnt/user/mythirdexcludeddirectory              \
    \
    $BORG_REPO::'{hostname}-{now}'  \
    \
    /mnt/user/myfirstbackupdirectory              \
    /mnt/user/mysecondbackupdirectory             \
    /mnt/user/mythirdtbackupdirectory              \
    /mnt/user/myfourthbackupdirectory              \
    
    >> $LOGFILE 2>&1


backup_exit=$?
# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machines' archives also:
#echo "$(date "+%m-%d-%Y %T") : Borg pruning has started" 2>&1 | tee -a $LOGFILE
borg prune                          \
    --list                          \
    --prefix '{hostname}-'          \
    --show-rc                       \
    --keep-daily    7               \
    --keep-weekly   4               \
    --keep-monthly  6               \
    >> $LOGFILE 2>&1

prune_exit=$?
#echo "$(date "+%m-%d-%Y %T") : Borg pruning has completed" 2>&1 | tee -a $LOGFILE

# use highest exit code as global exit code
global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))

# Execute if no errors
if [ ${global_exit} -eq 0 ];
then
    borgstart=$SECONDS
    echo "$(date "+%m-%d-%Y %T") : Borg backup completed in  $(($borgstart/ 3600))h:$(($borgstart% 3600/60))m:$(($borgstart% 60))s" | tee -a >> $LOGFILE 2>&1

#Reset timer
    SECONDS=0
    echo "$(date "+%m-%d-%Y %T") : Rclone Borg sync has started" >> $LOGFILE
    rclone sync $BORG_REPO $CLOUDDEST -P --stats 1s -v 2>&1 | tee -a $LOGFILE
    rclonestart=$SECONDS   
    echo "$(date "+%m-%d-%Y %T") : Rclone Borg sync completed in  $(($rclonestart/ 3600))h:$(($rclonestart% 3600/60))m:$(($rclonestart% 60))s" 2>&1 | tee -a $LOGFILE
# All other errors
else
    echo "$(date "+%m-%d-%Y %T") : Borg has errors code:" $global_exit 2>&1 | tee -a $LOGFILE
fi
exit ${global_exit}
