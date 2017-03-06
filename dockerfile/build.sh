#!/bin/bash
save_source=0
save_output=0

for arg in "$@"
do   
    if [ $save_output == 1 ]
    then
        output=$arg
        save_output=0
    elif [ $save_source == 1 ]
    then
        source=$arg
        save_source=0
    else
        case "$arg" in
            "--output" ) save_output=1;;
            "--source" ) save_source=1;;
        esac
    fi
done

# case 1: output not set, source not set
# case 2: output not set, source set
if [ -z ${output+x} ]; then
    if [ -z ${source+x} ]; then 
        source=
        output=build
    else
        if [ "$source" == "." ]; then
            output=build
        else
            output=build/$source
        fi
    fi
fi

# case 3: output set, source not set
if [ -z ${source+x} ]; then 
    source=
fi

# case 4: output set, source set
output=/repo/$output
source=/repo/$source

if [ ! -d $output ]; then
    mkdir -p $output
    if [ $? -ne 0 ] ; then
        echo create output folder $output failed
        exit 1
    fi
fi

if [ ! -d $source ]; then
    echo source dir $source doesnot exist in container
    exit 1
fi

if [ ! -f $source/CMakeLists.txt ]; then
    echo $source/CMakeLists.txt file doesnot exist
    exit 1
fi

pushd $output > /dev/null

cmake -DCMAKE_TOOLCHAIN_FILE=/toolchain.cmake $source && make

if [ $? -eq 0 ]; then
    echo Build succeeded!
else
    exit $?
fi

popd > /dev/null


device=$(echo $DEVICETYPE)
source ./bi/bi.sh --device $device --event dockerbuild