
# 🛡 Debian 12 Security Audit Toolkit

This repository provides automated scripts and reports for auditing a Debian 12 server.

## 📌 Features
- **System Security Scan** (Lynis)
- **Network Vulnerability Scan** (Nmap, OpenVAS)
- **Malware & Rootkit Detection** (ClamAV, OSSEC)
- **Web Security Testing** (Nikto)

## 🛠 Setup
Clone the repository and install dependencies:
```bash
git clone https://github.com/WillieJay5/security-audit.git
cd security-audit
chmod +x scripts/*.sh
```

## 🔍 Usage
Run All Security Audits:
```bash
./scripts/system_audit.sh && ./scripts/network_scan.sh && ./scripts/malware_scan.sh && ./scripts/web_scan.sh
```
Reports are sabved in the reports/ folder

## 📋 Results
Check audit logs in
- reports/system-audit.log
- reports/network-scan.log
- reports/malware-scan.log
- reports/web-security.log

## 🛡 Hardening Guide
- 🔥 Secure SSH
- 🔒 Restrict Firewall Rules
- 🚀 Automate updates with unattended-upgrades
- 🕵️ Monitor logs with OSSEC
- Change YOUR_SERVER_IP to your actual server ip
```yaml

---

### **📂 scripts/** (Automation Scripts)

#### **🖥 `system_audit.sh` (Lynis Security Check)**
```bash
#!/bin/bash
echo "🛡 Running Lynis Security Audit..."
sudo apt install -y lynis
sudo lynis audit system | tee reports/system-audit.log
echo "✅ System audit completed! Log saved to reports/system-audit.log"
```
🌐 network_scan.sh (Nmap & OpenVAS)
```bash
#!/bin/bash
echo "🔍 Running Nmap scan..."
sudo apt install -y nmap
nmap -sV -A YOUR_SERVER_IP | tee reports/network-scan.log

echo "🚨 Running OpenVAS vulnerability scan..."
sudo apt install -y openvas
sudo gvm-start
echo "Visit https://localhost:9392 to review OpenVAS scan results."
```

🦠 malware_scan.sh (ClamAV & OSSEC)
```bash
#!/bin/bash
echo "🦠 Running ClamAV Malware Scan..."
sudo apt install -y clamav
sudo freshclam
sudo clamscan -r / | tee reports/malware-scan.log

echo "🕵️ Running OSSEC Rootkit Scan..."
sudo apt install -y ossec-hids
echo "Check OSSEC logs for real-time monitoring."
```

🌎 web_scan.sh (Nikto Web Security Test)
```bash
#!/bin/bash
echo "🌎 Running Nikto Web Vulnerability Scan..."
sudo apt install -y nikto
nikto -h http://YOUR_SERVER_IP | tee reports/web-security.log
```

🔒 .gitignore (Avoid Storing Sensitive Logs)
```plaintext
# Ignore logs and configs
reports/*
configs/*
!README.md
```

## 🚀 GitHub Actions (Optional)
To automate the audit periodically, use a GitHub Actions workflow:
.github/workflows/audit.yml
```yaml
name: Security Audit
on:
  schedule:
    - cron: '0 3 * * 7' # Runs every Sunday at 3 AM
  workflow_dispatch: # Allow manual trigger

jobs:
  audit:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Run Security Audit
        run: |
          chmod +x scripts/*.sh
          ./scripts/system_audit.sh
          ./scripts/network_scan.sh
          ./scripts/malware_scan.sh
          ./scripts/web_scan.sh

      - name: Upload Reports
        uses: actions/upload-artifact@v3
        with:
          name: audit-reports
          path: reports/
```
## 🛠 Next Steps
- ✅ Automate ufw hardening (configs/ufw-rules.conf)
- ✅ Add real-time monitoring with OSSEC
- ✅ Use GitHub Secrets for sensitive data
- ✅ Add notificatoins with Slack
