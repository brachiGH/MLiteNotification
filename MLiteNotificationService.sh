#!/bin/bash
echo "MLite Notificaton Starting"

MLitePushNotification() {
	am startforegroundservice --user 0 -n com.facebook.mlite/com.facebook.mlite.syncjob.MLitePushNotificationService
}

MLitePushNotification
while sleep 6; do MLitePushNotification; done


#COMMAND TO RUN IS: su -c "sh ./MLitePushCommand.sh"
