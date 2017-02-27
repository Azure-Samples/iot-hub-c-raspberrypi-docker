#!/bin/bash
save_cmakedir=0
save_outputdir=0

for arg in "$@"
do   
    if [ $save_outputdir == 1 ]
    then
        outputdir="/repo/$arg"
        save_outputdir=0
    if [ $save_cmakedir == 1 ]
    then
        cmakedir="/repo/$arg"
        save_cmakedir=0
    else
        case "$arg" in
            "--outputdir" ) save_outputdir=1;;
        case "$arg" in
            "--cmakedir" ) save_cmakedir=1;;
        esac
    fi
done

if [ -z ${outputdir+x} ]; then 
    outputdir=/repo
fi

if [ ! -d "$outputdir" ]; then
    echo no build dir $outputdir
    exit 1
fi

if [ -z ${cmakedir+x} ]; then 
    cmakedir=/repo/src
fi

if [ ! -d "$cmakedir" ]; then
    echo no cmake dir $cmakedir
    exit 1
fi

if [ ! -f "$cmakedir/CMakeLists.txt" ]; then
    echo no $cmakedir/CMakeLists.txt
    exit 1
fi

pushd $outputdir > /dev/null

cmake -DCMAKE_TOOLCHAIN_FILE=/toolchain.cmake $cmakedir && make

if [ $? -eq 0 ]; then
    echo Build succeeded!
else
    exit $?
fi

popd > /dev/null


device=$(echo $DEVICETYPE)
source ./bi/bi.sh --device $device --event dockerbuild