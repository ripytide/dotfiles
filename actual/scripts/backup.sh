#!/bin/bash

# Close if borg running
if pgrep "borg" > /dev/null 
then
    notify.sh "Backup already running, exiting!" -u critcal
    exit
fi

#This is the dir which ~ expands to
export HOME="/home/ripytide"

#This is the location your Borg program will store the backup data to
export BORG_REPO="/home/ripytide/backup"

#Setting this, so you won't be asked for your repository passphrase:
export BORG_PASSPHRASE="1RizzleislandironitE9"

#Backup name
backup_name="${HOSTNAME}-$(date +%S-%M-%H-%d-%m-%Y)"

#Backup
borg create $BORG_REPO::"$backup_name" --patterns-from ~/backup_patterns --exclude-from ~/backup_exclude -p --stats --compression lz4 --exclude-caches
backup_exit=$?

if [ $backup_exit -eq 0 ]
then
	notify.sh "Backup $backup_name created successfully!"
else
	notify.sh "Backup Create failed, exiting!" -u critical
	exit
fi

# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machines' archives also:

#Prune
borg prune --list --prefix '{hostname}-' --keep-daily 7 --keep-weekly 4 --keep-monthly 12 --keep-last 6 >> ~/logs/prunelog.txt
prune_exit=$?

if [ $prune_exit -eq 0 ]
then
	notify.sh "Prune successful!"
else
	notify.sh "Prune failed, exiting!" -u critical
	exit
fi

cp -R /home/ripytide/backup /mnt/hdd/Backups/devourer
