#!/bin/bash

Disable default chromium start behaviour and go to error handling method
sed -i '6,7s/.*/# &/' /home/pi/scripts/start_chromium_browser

# Change hostname
# sudo hostnamectl set-hostname fryd-fullpageos

# Edit crontabfile
CRONTABTMPFILE=/tmp/crontab.tmp

# Save current crontab
crontab -l > $CRONTABTMPFILE

#echo new cron into cron file
echo "# Reboot RPI nightly
0 3 * * * sudo reboot now

# Refresh browser window after 30 minutes
30 * * * * /home/pi/scripts/refresh
" >> $CRONTABTMPFILE

# Replace crontab from tmpfile
crontab $CRONTABTMPFILE
rm $CRONTABTMPFILE

