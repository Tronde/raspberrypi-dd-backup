# raspberrypi-dd-backup
This is a simple script to create an image backup from Raspberry Pi SD card and probably other sd cards as well.

Source:

 * [https://www.raspberrypi.org/documentation/linux/filesystem/backup.md](https://www.raspberrypi.org/documentation/linux/filesystem/backup.md)

Licence: [GPLv3](https://github.com/Tronde/raspberrypi-dd-backup/blob/main/LICENSE)

## How to use

 1. Clone this repo to your Raspberry Pi, e.g. with `https://github.com/Tronde/raspberrypi-dd-backup.git`.
 2. `cd raspberrypi-dd-backup` # Change into project directory.
 3. Copy CONFIG.sample to config, e.g. `cp CONFIG.sample config`. This way you won't overwrite your confi when you pull the upstream repo with a changed CONFIG.sample.
 4. Edit config and specify `SRC`, `DEST` and wether or not you like to use compression. `SRC` is the name of the sdcard you want to backup, i.e. `/dev/mmcblk0`. You could find the name of your sdcard with `lsblk` or in your `/etc/fstab`. `DEST` is the path to where the backup should be written, i.e. `/mnt/backup-target/image-file-name.img`. In case you would like to keep multiple backups you could automatically attach the current date to the filename, e.g. `/mnt/backup-target/raspi-sht21-$(date +%Y-%m-%d).img`.
 5. Optional: Setup cronjob to run `raspberrypi-dd-backup.sh` as `root` to schedule your backup job
