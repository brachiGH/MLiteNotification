#!/bin/bash
echo "MLite Notificaton Starting"

UID=0 #Get MLite user ID or UID



MLitePushNotification() {
	isMLiteRunning=$(am get-uid-state $UID)

	if [[ "$isMLiteRunning" == *"NONEXISTENT"* ]]; then
		am startforegroundservice --user 0 -n com.facebook.mlite/com.facebook.mlite.syncjob.MLitePushNotificationService
	fi
}


if [ $UID -eq 0	]; then
	echo "Set MLite user ID or UID inside MLiteNotificationService.sh"
else
	MLitePushNotification
	while sleep 11; do MLitePushNotification; done
fi

#COMMAND TO RUN IS: su -c "sh ./MLitePushCommand.sh"