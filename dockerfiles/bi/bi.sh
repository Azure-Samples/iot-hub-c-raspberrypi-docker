#!/bin/bash
save_eventname=0;
save_devicetype=0;

for arg in "$@"
do
  if [ $save_eventname == 1 ]; then
    eventname="$arg"
    save_eventname=0
  elif [ $save_devicetype == 1 ]; then
    devicetype="$arg"
    save_devicetype=0
  else
    case "$arg" in
         "--device" ) save_devicetype=1;;
         "--event" ) save_eventname=1;;
     esac
   fi
done

nodejs ./bi/index.js $devicetype $eventname