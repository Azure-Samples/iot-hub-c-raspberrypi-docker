#!/bin/bash
save_outputdir=0

for arg in "$@"
do   
    if [ $save_outputdir == 1 ]
    then
        outputdir="/source/$arg"
        save_outputdir=0
    else
        case "$arg" in
            "--outputdir" ) save_outputdir=1;;
        esac
    fi
done

if [ -z ${outputdir+x} ]; then 
    outputdir=/source
fi

if [ ! -d "$outputdir" ]; then
    echo no build dir $outputdir
    exit 1
fi

if [ ! -d "/source" ]; then
    echo no source dir /source
    exit 1
fi

if [ ! -f "/source/CMakeLists.txt" ]; then
    echo no /source/CMakeLists.txt
    exit 1
fi

if [ -f "/source/build.log" ]; then
    rm "/source/build.log"
fi

pushd $outputdir > /dev/null

cmake -DCMAKE_TOOLCHAIN_FILE=/toolchain.cmake /source && make

if [ $? -eq 0 ]; then
    echo Build succeeded!
else
    exit $?
fi

popd > /dev/null


device=$(echo $DEVICETYPE)
source ./bi/bi.sh --device $device --event dockerdeploy