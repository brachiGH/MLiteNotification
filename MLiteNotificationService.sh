#!/bin/bash
echo "MLite Notificaton Starting"

UID=1 #Get MLite user ID or UID



MLitePushNotification() {
        isMLiteRunning=$(am get-uid-state $UID)

        if [[ "$isMLiteRunning" == *"NONEXISTENT"* ]]; then
                am stop-service --user 0 -n com.facebook.mlite/com.facebook.mlite.syncjob.MLitePushNotificationService
                am startforegroundservice --user 0 -n com.facebook.mlite/com.facebook.mlite.syncjob.MLitePushNotificationService
        fi
}


if [ $UID -eq 1 ]; then
        echo "Set MLite user ID or UID inside MLiteNotificationService.sh"
else
        MLitePushNotification
        while sleep 8; do MLitePushNotification; done
fi

#COMMAND TO RUN IS: su -c "sh ./MLitePushCommand.sh"