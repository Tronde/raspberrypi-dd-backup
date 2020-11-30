# raspberrypi-dd-backup
This is a simple script to create an image backup from Raspberry Pi SD card and probably other sd cards as well.

Source:

 * [https://www.raspberrypi.org/documentation/linux/filesystem/backup.md](https://www.raspberrypi.org/documentation/linux/filesystem/backup.md)

Licence: [GPLv3](https://github.com/Tronde/raspberrypi-dd-backup/blob/main/LICENSE)

## How to use

 1. Copy CONFIG.sample to config
 2. Edit config and specify `SRC`, `DEST` and wether or not you like to use compression
 3. Optional: Setup cronjob to run `raspberrypi-dd-backup.sh` as `root` to schedule your backup job
