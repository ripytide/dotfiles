#!/bin/bash

# Close if borg running
if pgrep "borg" > /dev/null 
then
    notify-send "Backup already running, exiting!" -u critcal
    exit
fi



#This is the location your Borg program will store the backup data to
export BORG_REPO="/home/ripytide/backup"

#This is the location you want Rclone to send the BORG_REPO to 
export CLOUDDEST="gdrive:${HOSTNAME}-backup"

#Setting this, so you won't be asked for your repository passphrase:
export BORG_PASSPHRASE="1RizzleislandironitE9"



#Backup name
backup_name="${HOSTNAME}-$(date +%S-%M-%H-%d-%m-%Y)"

#Backup
borg create $BORG_REPO::"$backup_name" --patterns-from ~/backup_patterns --exclude-from ~/backup_exclude -p --stats --compression lz4 --exclude-caches --list
backup_exit=$?

if [ $backup_exit -eq 0 ]
then
	notify-send "Backup $backup_name created successfully!"
else
	notify-send "Backup Create failed, exiting!" -u critical
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
	notify-send "Prune successful!"
else
	notify-send "Prune failed, exiting!" -u critical
	exit
fi

#Get repo size
repo_size=$(borg info $BORG_REPO --json | jq .cache.stats.unique_csize)
repo_size="$(expr $repo_size / 1000000)MB"

upload_confirm=$(echo -e "Yes\nNo" | rofi -dmenu -i -p "Sync $repo_size to cloud?")

if [ $upload_confirm = "Yes" ]
then
	rclone sync $BORG_REPO $CLOUDDEST -P
	rclone_exit=$?

	if [ $rclone_exit -eq 0 ]
	then
		notify-send "RClone sync successful!"
	else
		notify-send "RClone sync failed, exiting!" -u critical
		exit
	fi
else
	notify-send "Manual upload cancelled!" "Please address the issue and then manually backup again" -u critical
fi
