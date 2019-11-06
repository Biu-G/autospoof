# autospoof
private net spoof shell
usage:
1. open wireshark/tshark/fidder/charles to capture packets 
2. echo "1" > /proc/sys/net/ipv4/ip_forward
3. modify the private ip address header in hunter.sh to youself's
4. bash hunter.sh
5. check the one you opened in procedure 1,
now you are able to receive all the floods between routers and users in the private net you're located in
