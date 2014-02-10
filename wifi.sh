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
	grep -nr  "Ad-Hoc" wifi.in

	if [ $? -eq 0 ]
	then
		echo "Ad-Hoc Networks Found"
		echo "Invoking Ad-Hoc Finder"
		cc find_adhocs.c wifi.in  #A program to print all the SSID's of ad-hoc networks
		./a.out
	else
		echo "Ad-Hoc Networks Not Found"
	fi
	
	sleep 2
#done
