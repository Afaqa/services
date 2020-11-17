FILE='/etc/nginx/sites-enabled/default'
OFF='autoindex off'
ON='autoindex on'
CH=0
if grep -q "$ON" $FILE; then CUR=1; else CUR=2; fi
if [ $# -eq 0 ]
then CH=$(expr 3 - $CUR)
elif [ "$1" = "on" ]
then CH=1;
elif [ "$1" = "off" ]
then CH=2;
else echo "Usage: "; echo "$0 [on/off/<empty>] - switch autoindex in nginx";
fi
if [ $CH -gt 0 ] && [ "$CH" != "$CUR" ]
then if [ $CH -eq 2 ]
	then echo "$OFF"; sed -i "s/$ON/$OFF/g" $FILE;
	else echo "$ON";  sed -i "s/$OFF/$ON/g" $FILE;
	fi
	service nginx restart;
fi
