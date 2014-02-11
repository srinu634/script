# To automate wifi scanning
# TO DO: See which node supports Wireless : DONE
# Check if the link is up/down
# If possible let the user login to wifi through this script

declare -i flag=0 # 0 if none supports scanning, 1 if eth0 supports scanning, 2 if wlan0 supports scanning

#Scan eth0

sudo iwlist eth0 scanning > eth0.in
if [ $? -eq 0 ]
then
         "eth0 supports scanning"
	flag=flag+1
fi

#Scan wlan0

sudo iwlist wlan0 scanning > wlan0.in
if [ $? -eq 0  ]
then
        echo "wlan0 supports scanning"
	flag=flag+2
fi


#while [ $x -eq $x ]    #Infinite Loop
#do
			
	if [ $flag -eq 1 ];then
		val="eth0"
	fi
	
	if [ $flag -eq 2  ];then
		val="wlan0"
	fi
	
	
	echo " Searchnig for an adhoc network"
	sudo iwlist "$val" scanning > wifi.in
	grep -B 4  "Ad-Hoc" wifi.in | grep "SSID" 

	if [ $? -eq 0 ]
	then
		echo "Ad-Hoc Networks Found"
	echo "Enter the network name you want to connect to"
	read ssid
	
	#Setting up the network
	
	sudo iw wlan0 ibss leave # Disconnect from any previous ad-hoc network

	if [ $? -eq 0 ]
	then
		echo "Disconnected from the previous network"
	else
		echo "No previous Network Found"
	fi


	sudo ifconfig "$val" down 
	 

	sudo iw "$val" set type ibss # Independent BSS

	sudo ifconfig "$val" 10.0.0.2 up #Add an IP to it

	sudo iw wlan0 ibss join "$ssid" 2412 # Name + Frequency
	echo "Network is setup"

	sudo iwconfig wlan0 #Display the adhoc name

 	sudo iw wlan0 link
	
	#Network is Setup
	
	else
		echo "Ad-Hoc Networks Not Found"
	fi
	
	sleep 2
#done
