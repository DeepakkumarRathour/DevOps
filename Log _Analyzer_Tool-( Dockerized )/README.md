
# 📊 Linux Log Analyzer Tool (Dockerized)

A simple **Linux Log Analyzer Tool** built with **Bash** and **Docker**.  
It reads system logs (`/var/log/syslog`), analyzes them, and generates a summary with:  
- Count of **ERROR**, **WARNING**, and **INFO** messages.  
- Top 5 most frequent log entries.  
- Email alerts if error count exceeds threshold.  
- Can be automated with **cron jobs** (inside or outside Docker).  

---

## 🚀 Features
- ✅ Analyzes system log files (`/var/log/syslog` or `/var/log/messages`).  
- ✅ Shows error/warning/info statistics.  
- ✅ Displays top 5 most frequent log messages.  
- ✅ Sends email alerts when errors exceed a threshold.  
- ✅ **Containerized with Docker** for portability.  
- ✅ Supports cron job automation.  

---

## 📂 Project Structure
```
log-analyzer/
 ├── log_analyzer.sh   # Main Bash script
 ├── Dockerfile        # Docker build file
 └── cronjob           # (Optional) Cron schedule
```

---

## ⚡ Installation & Usage

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/your-username/log-analyzer.git
cd log-analyzer
```

### 2️⃣ Make the Script Executable
```bash
chmod +x log_analyzer.sh
```

Run directly on your system:
```bash
./log_analyzer.sh
```

---

### 3️⃣ Run with Docker
#### Build the Docker image:
```bash
docker build -t log-analyzer .
```

#### Run container with system log mounted:
```bash
docker run --rm -v /var/log/syslog:/var/log/syslog log-analyzer
```

---

### 4️⃣ Automate with Cron
Example: Run every 30 mins inside Docker:
```dockerfile
COPY cronjob /etc/cron.d/log-analyzer-cron
RUN chmod 0644 /etc/cron.d/log-analyzer-cron && crontab /etc/cron.d/log-analyzer-cron
CMD ["cron", "-f"]
```

---

## 📧 Email Alerts
The script sends an **email alert** if error count exceeds threshold (default: `10`).  
Set your email inside the script:
```bash
EMAIL="your_email@example.com"
```

---

## 📌 Example Output
```
🔎 Analyzing log file: /var/log/syslog
----------------------------------
📊 Log Summary:
  Errors   : 12
  Warnings : 45
  Info     : 230

🔥 Top 5 most frequent log entries:
   120 systemd: Started User Manager
    95 NetworkManager: connection established
    50 CRON: session opened
    30 kernel: usb device connected
    25 kernel: disk I/O error

📧 Alert sent to your_email@example.com (Errors: 12)
```

---

## 🧑‍💻 Skills Demonstrated
- Linux system administration  
- Bash scripting  
- Log monitoring & analysis  
- Docker containerization  
- Cron job scheduling  
- Email automation  

---

## 📜 License
This project is licensed under the MIT License.
