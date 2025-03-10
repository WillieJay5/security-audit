#!/bin/bash
echo "🌎 Running Nikto Web Vulnerability Scan..."
sudo apt install -y nikto
nikto -h http://YOUR_SERVER_IP | tee reports/web-security.log
