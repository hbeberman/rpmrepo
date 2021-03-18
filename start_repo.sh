#!/bin/bash

if [ ! -d "/rpms" ]
then
    echo "Directoy /rpms not found!"
    echo "Please add the following to your docker command: -v ~/repos/myproject/out/RPMS:/rpms"
    exit 1
fi

mkdir -p /temp
cd /temp

if [ -d "/rpms/x86_64" ]
then
    if [ ! -e "/temp/x86_64" ]
    then
        echo "Loading x86_64 rpms folder"
        ln -s /rpms/x86_64 /temp/x86_64
    fi
fi

if [ -d "/rpms/aarch64" ]
then
    if [ ! -e "/temp/aarch64" ]
    then
        echo "Loading aarch64 rpms folder"
        ln -s /rpms/aarch64 /temp/aarch64
    fi
fi

if [ -d "/rpms/noarch" ]
then
    if [ ! -e "/temp/noarch" ]
    then
        echo "Loading noarch rpms folder"
        ln -s /rpms/noarch /temp/noarch
    fi
fi

ls /temp/x86_64 | wc -l
ls /temp/noarch | wc -l

echo "Running createrepo"
createrepo . --workers 20

echo "Starting webserver"
python3 -m http.server 8000
