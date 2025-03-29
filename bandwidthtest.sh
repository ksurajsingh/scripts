#!/bin/sh 

netif=$(ip route show default | cut -d" " -f5) # your current network interface
echo -e "on network interface: $netif"

rec_init=$(cat /sys/class/net/$netif/statistics/rx_bytes );
trans_init=$(cat /sys/class/net/$netif/statistics/tx_bytes );

echo -e "Total bytes receieved via $netif since boot: $(echo "scale=2; $rec_init /1024/1024" | bc )   MBs \n"
echo -e "Total bytes transmitted via $netif since boot: $(echo "scale=2; $trans_init / 1024 / 1024" | bc) MBs\n"

echo -e "Monitoring now\nPress any key to stop . . . "
read -n 1

rec_fin=$(cat /sys/class/net/$netif/statistics/rx_bytes );
trans_fin=$(cat /sys/class/net/$netif/statistics/tx_bytes );


rec_total=$( echo "scale=2; $((rec_fin-rec_init)) / 1024 / 1024" | bc ) 
trans_total=$( echo "scale=2; $((trans_fin-trans_init)) / 1024 / 1024" | bc ) 


echo " Received data: $rec_total MegaBytes"
echo " Transmitted data: $trans_total MegaBytes"


