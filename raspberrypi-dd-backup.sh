#!/bin/bash

# Introduction
# This is a simple script to create an image backup from Raspberry Pi SD card and probably other sd cards as well.
# 
# Author: Tronde (trondeATmy-it-brainDOTde)
# Source:
# 
#  * [https://www.raspberrypi.org/documentation/linux/filesystem/backup.md](https://www.raspberrypi.org/documentation/linux/filesystem/backup.md)
# 
# Licence: [GPLv3](https://github.com/Tronde/raspberrypi-dd-backup/blob/main/LICENSE)
# 
## How to use
# 
#  1. Copy CONFIG.sample to config
#  2. Edit config and specify `SRC`, `DEST` and wether or not you like to use compression
#  3. Optional: Setup cronjob to run `raspberrypi-dd-backup.sh` as `root` to schedule your backup job

# VARIABLES
SCRIPTNAME=`basename ${0}`
PROGDIR=$(dirname $(readlink -f ${0}))
. ${PROGDIR}/CONFIG

# FUNCTIONS
usage()
{
  cat << EOF
  usage: $0 OPTIONS
  This script backups your SD card to an image file.
  Parameters -S and -T are optional and overwrites values from CONFIG file.

  OPTIONS:
  -h Shows this text
  -S Specifies the path of the SD card
  -T Specifies the the target image file
EOF
}

do_dd_backup()
{
  dd bs=4M if=${SRC} of=${DEST}
}

do_dd_backup_w_compression()
{
  dd bs=4M if=${SRC} | gzip > ${DEST}
}

# Main
while getopts .hST. OPTION
do
  case $OPTION in
    h)
      usage
      exit;;
    S)
      SRC="${OPTARG}"
      ;;
    T)
      DEST="${OPTARG}"
      ;;
    ?)
      usage
      exit;;
  esac
done

## Some checks

if [[ ! $(which dd) ]]; then
  echo "dd was not found on this system."
fi

if [[ -z $SRC || -z $DEST ]]; then
  echo "Please specify SRC and/or DEST in CONFIG or via Options -S and -T."
fi

if [[ ! -z $SRC || ! -z $DEST ]] && [[ -z $ZIP ]]; then
  do_dd_backup
else
  do_dd_backup_w_compression
fi
