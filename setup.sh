  # Script to setup an adhoc based network

	
	sudo iw wlan0 ibss leave
	if [ $? -eq 0 ]
	then
		echo "Disconnected from the previous network"
	else
		echo "No previous Network Found"
	fi

	sudo ifconfig wlan0 down 
	
	sudo iw wlan0 set type ibss # Independent BSS

	sudo ifconfig wlan0 10.0.0.1 up #Add an IP to it

	sudo  iw wlan0 ibss join test123 2412 #key 0:qwerty # Name + Frequency
	

	echo "Network is setup"

	sudo iwconfig wlan0 #Display the adhoc name

 	sudo iw wlan0 link
