  # Script to setup an adhoc based network

	

	sudo ifconfig wlan0 down 
	sudo ifconfig wlan0 up #So that any previous connection is lost 

	sudo iw wlan0 set type ibss # Independent BSS

	sudo ifconfig wlan0 10.0.0.1 up #Add an IP to it

	sudo iw wlan0 ibss join test123 2412 # Name + Frequency
	echo "Network is setup"

	sudo iwconfig wlan0 #Display the adhoc name

 	sudo iw wlan0 link
