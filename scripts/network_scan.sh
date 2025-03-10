#!/bin/bash
echo "🔍 Running Nmap scan..."
sudo apt install -y nmap
nmap -sV -A YOUR_SERVER_IP | tee reports/network-scan.log

echo "🚨 Running OpenVAS vulnerability scan..."
sudo apt install -y openvas
sudo gvm-start
echo "Visit https://localhost:9392 to review OpenVAS scan results."
