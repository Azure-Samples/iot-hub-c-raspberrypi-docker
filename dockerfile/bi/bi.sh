#!/bin/bash

# bi script
# bi message common properties
# 1. device type
# 2. docker container id
# 3. docker image tag


device=$(echo $DEVICETYPE)
tag=$(echo $TAG)
containerId=$(echo $HOSTNAME)

for arg in "${@:2}"
do
  echo arg is bi.sh is $arg
  if [[ $arg != *":"* ]]; then
    echo arguments should be in format key:value, eg: bi.sh event:build source:blink
    exit 1
  fi
done

nodejs /bi/index.js $@ "board":$device "dockertag":$tag "dockerContainerId":$containerId