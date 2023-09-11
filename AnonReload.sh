#!/bin/bash
#this is simple script to reload ip and connection tor while yout scan target over waf.
#it try bypass block ip...remember of set in you tool to retry request command if first time fail execution...

#how to use:
#just run this file in you whonix gateway cli, and he go run forever in loop, while yout work...

#chmod +x AnonReload.sh
#./AnonReload.sh
while true
do
   echo "ip atual "
        curl ident.me
        echo " "
        sleep 300 
        /usr/bin/restart-tor-gui
        echo "ip atual "
        curl ident.me
        echo " "
        systemcheck --verbose --cli
        sleep 60 
        sudo service networking restart
        echo "ip atual "
        curl ident.me
        echo " "
        sleep 60 
        sudo service tor restart
        anon-verify
        echo "ip atual "
        curl ident.me
        echo " "
        sleep 60 
        anon-info
        sudo service sdwdate restart
        echo "ip atual "
        curl ident.me
        echo " "
        systemcheck --verbose --cli 
        date -u
        sudo date --utc && sudo hwclock --utc
        sudo hwclock --utc --systohc
done

done
