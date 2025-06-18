#!/bin/bash

domain=$1
RED="\033[1;31m"
RESET="\033[0m"

Subdomain_path=$domain/Subdomain_path
Screemshot_path=$domain/Screenshots
Scan_path=$domain/Scans

if [ ! -d "$domain" ];then
	mkdir $domain
fi
if [ ! -d "$Subdomain_path" ];then
	mkdir $Subdomain_path
fi

if [ ! -d "$Screemshot_path" ];then
	mkdir $Screemshot_path
fi

if [ ! -d "$Scan_path" ];then
	mkdir $Scan_path
fi

echo -e "${RED}[+]+++++++++---Launching Subdomain Finder---+++++++++${RESET}"
subfinder -d $domain > $Subdomain_path/found.txt

echo -e "${RED}[+]+++++++++---Launching asset finder---+++++++++${RESET}"
assetfinder $domain |grep $domain >> $Subdomain_path/found.txt

#echo -e "${RED}[+]Launching amass-----------${RESET}"
#amass enum -d $domain >> $Subdomain_path/found.txt

echo -e "${RED}[+]+++++++++---Finding live subdomains---+++++++++${RESET}"
cat $Subdomain_path/found.txt | grep $domain | sort -u | httprobe -prefer-https| grep https|sed "s/https\?:\/\///" | tee -a $Subdomain_path/alive.txt

#echo -e "${RED}[+]+++++++++---Taking Screenshots of alive subdomains---+++++++++${RESET}"
#gowitness file -f $Subdomain_path/alive.txt -p $Screemshot_path/ --no-http

echo -e "${RED}[+]+++++++++---Running NMAP on alive subdomains---+++++++++${RESET}"
nmap -iL "$Subdomain_path/alive.txt" -T4 -p- -oN "$Scan_path/nmap.txt"

