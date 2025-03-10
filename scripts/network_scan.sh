#!/bin/bash
echo "🔍 Running Nmap scan..."
sudo apt install -y nmap
nmap -sV --script=vuln YOUR_SERVER_IP | tee reports/network-scan.log
