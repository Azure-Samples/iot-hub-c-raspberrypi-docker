#!/bin/bash
task=""

if [ "$1" == "build" ]
then
  source /build.sh
  task=dockerbuild
elif [ "$1" == "deploy" ]
then
  source /deploy.sh
  task=dockerdeploy
else
  echo unknown command
fi

device=$(echo $DEVICETYPE)

source ./bi/bi.sh --device $device --event $task