#!/bin/bash
echo "MLite Notificaton Starting"

UID=0 #Get MLite user ID or UID

if [ $UID -eq 0	]; then
	echo "Set MLite user ID or UID inside MLiteNotificationService.sh"
fi

MLitePushNotification() {
	isMLiteRunning=$(am get-uid-state $UID)

	if [[ "$isMLiteRunning" == *"NONEXISTENT"* ]]; then
		am startforegroundservice --user 0 -n com.facebook.mlite/com.facebook.mlite.syncjob.MLitePushNotificationService
	fi
}

MLitePushNotification
while sleep 11; do MLitePushNotification; done


#COMMAND TO RUN IS: su -c "sh ./MLitePushCommand.sh"