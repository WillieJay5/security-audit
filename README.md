
# 🛡 Debian 12 Security Audit Toolkit

A Bash script designed to automate the process of auditing and hardening Linux systems by checking for common security vulnerabilities and misconfigurations.

## 📌 Features
- **System Security Scan** (Lynis)
- **Network Vulnerability Scan** (Nmap)
- **Malware & Rootkit Detection** (ClamAV, OSSEC)

## Prerequisites:

- Bash shell
- Root or sudo privileges
- awk, grep, and netstat utilities

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
./scripts/system_audit.sh && ./scripts/network_scan.sh && ./scripts/malware_scan.sh
```
Reports are saved in the reports/ folder

## 📋 Results
Check audit logs in
- reports/system-audit.log
- reports/network-scan.log
- reports/malware-scan.log

## 🛡 Hardening Guide
- 🔥 Secure SSH
- 🔒 Restrict Firewall Rules
- 🚀 Automate updates with unattended-upgrades
- 🕵️ Monitor logs with Grafana + Loki (Unimlemented)
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
🌐 network_scan.sh (Nmap)
```bash
#!/bin/bash
echo "🔍 Running Nmap scan..."
sudo apt install -y nmap
nmap -sV --script=vuln 192.168.1.55 | tee reports/network-scan.log
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

🔒 .gitignore (Avoid Storing Sensitive Logs)
```plaintext
# Ignore logs and configs
reports/*
configs/*
!README.md
```

## 🛠 Next Steps
- ✅ Automate ufw hardening (configs/ufw-rules.conf)
- ✅ Add real-time monitoring with Grifana + Loki
- ✅ Use GitHub Secrets for sensitive data
- ✅ Add notificatoins with SlacK

## Contributing:
Contributions are welcome! Please fork the repository and submit a pull request with your improvements or fixes.
