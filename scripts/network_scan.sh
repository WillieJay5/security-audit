#!/bin/bash
echo "🔍 Running Nmap scan..."
sudo apt install -y nmap
nmap -sV --script=vuln 192.168.1.55 | tee reports/network-scan.log
