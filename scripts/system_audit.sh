
---

### **📂 scripts/** (Automation Scripts)

#### **🖥 `system_audit.sh` (Lynis Security Check)**
```bash
#!/bin/bash
echo "🛡 Running Lynis Security Audit..."
sudo apt install -y lynis
sudo lynis audit system | tee reports/system-audit.log
echo "✅ System audit completed! Log saved to reports/system-audit.log"
