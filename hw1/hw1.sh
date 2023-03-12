#!/bin/bash
{
        read -p 'Enter directory: ' directory

        echo $directory
        cd $directory
        mkdir `getent passwd | awk -F: '{ print $1}'`
        find /home/fannur/$directory -type d -exec chmod 755 {} + 
        for file in $(dir /home/fannur/$directory)
        do
        sudo chown $file $file/
        done
} 2>&1 | tee /home/fannur/logs.txt
