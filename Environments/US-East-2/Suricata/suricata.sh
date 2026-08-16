#!/usr/bin/env bash 
set -e
#Suricata is a open source IDS/IPS security tool for network threat detection and deep packet inspection

echo "Updating Amazon Linux 2023"
cat /etc/os-release
apt update -y 

echo "Installing Packages and Suricata..."
apt install -y jq curl wget
apt install -y suricata 

echo "Initiating Suricata and Verification"
suricata --version
suricata --version
systemctl enable suricata
systemctl start suricata
systemctl status suricata --no-pager\

echo "VIM text editor"
#Changing Suricata interphase fro eth0 to ens5 via VIM
sudo vim /etc/suricata/suricata.yaml
# interphase: ens5
:wq 

echo "Validating Configuration"
ip addr show

#Validate package change 
sudo suricata -T -c /etc/suricata/suricata.yaml

#Restarting Suricata for changes to take effect
sudo systemctl restart suricata
sudo systemctl status suricata --no-pager




