#!/bin/bash

if [ "$1" == "build" ]
then
  source /build.sh
elif [ "$1" == "deploy" ]
then
  source /deploy.sh
else
  echo unknown command
fi