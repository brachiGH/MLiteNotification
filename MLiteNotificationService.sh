#!/bin/bash
echo "MLite Notificaton Starting"

MLitePushNotification() {
	wget -q --spider https://duckduckgo.com

	if [ $? -eq 0 ]; then
		am startforegroundservice --user 0 -n com.facebook.mlite/com.facebook.mlite.syncjob.MLitePushNotificationService
	fi
}

MLitePushNotification
while sleep 6; do MLitePushNotification; done


#COMMAND TO RUN IS: su -c "sh ./MLitePushCommand.sh"