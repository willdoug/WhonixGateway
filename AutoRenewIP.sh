!/bin/bash

while true
do

sleep 10

IP=$(curl -o /dev/null --silent -Iw '%{http_code}' \
    --connect-timeout 5 ident.me)

IP_ATUAL=$(curl --connect-timeout 3 ident.me 2>/dev/null)

echo "IP Atual: $IP_ATUAL"

if [ "$IP" != "200" ]; then
        echo "OFF LINE (Code:$IP)"

        #/usr/bin/restart-tor-gui
        #sleep 60
        #systemcheck --verbose --cli

        sudo service networking restart
        sudo service tor restart
        anon-verify

        #sudo service sdwdate restart
        #date -u
        #sudo date --utc && sudo hwclock --utc
        #sudo hwclock --utc --systohc
        #curl ident.me

else
        echo "ON LINE (Code:$IP)"
fi

done
