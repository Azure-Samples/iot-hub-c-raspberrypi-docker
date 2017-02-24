#!/bin/bash

save_deviceip=0
save_username=0
save_password=0
save_srcdockerpath=0
save_destdir=0

for arg in "$@"
do   
    if [ $save_deviceip == 1 ]
    then
        deviceip="$arg"
        save_deviceip=0
    elif [ $save_username == 1 ]
    then
        username="$arg"
        save_username=0
    elif [ $save_password == 1 ]
    then
        password="$arg"
        save_password=0
    elif [ $save_srcdockerpath == 1 ]
    then
        srcdockerpath="$arg"
        save_srcdockerpath=0
    elif [ $save_destdir == 1 ]
    then
        destdir="$arg"
        save_destdir=0
    else
        case "$arg" in
            "--deviceip" ) save_deviceip=1;;
            "--username" ) save_username=1;;
            "--password" ) save_password=1;;
            "--srcdockerpath" ) save_srcdockerpath=1;;
            "--destdir" ) save_destdir=1;;
        esac
    fi
done

sshpass -p $password scp -vo UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -r $srcdockerpath $username@$deviceip:$destdir

if [ $? -eq 0 ]; then
    echo Deploy succeeded!
else
    exit $?
fi