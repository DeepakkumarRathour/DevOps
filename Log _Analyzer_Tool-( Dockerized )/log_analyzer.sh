
#!/bin/bash
# log_analyzer.sh - Enhanced Linux Log Analyzer Tool

LOGFILE="/var/log/syslog"   # Change if needed
THRESHOLD=10                # Alert if errors exceed this number
EMAIL="your_email@example.com"

# Check if logfile exists
if [ ! -f "$LOGFILE" ]; then
    echo "❌ Log file $LOGFILE not found!"
    exit 1
fi

echo "🔎 Analyzing log file: $LOGFILE"
echo "----------------------------------"

# Count ERROR, WARNING, INFO
ERROR_COUNT=$(grep -i "error" "$LOGFILE" | wc -l)
WARNING_COUNT=$(grep -i "warning" "$LOGFILE" | wc -l)
INFO_COUNT=$(grep -i "info" "$LOGFILE" | wc -l)

echo "📊 Log Summary:"
echo "  Errors   : $ERROR_COUNT"
echo "  Warnings : $WARNING_COUNT"
echo "  Info     : $INFO_COUNT"
echo ""

# Top 5 most common log messages
echo "🔥 Top 5 most frequent log entries:"
grep -i -o ".*" "$LOGFILE" | sort | uniq -c | sort -nr | head -5
echo ""

# Send email alert if too many errors
if [ "$ERROR_COUNT" -gt "$THRESHOLD" ]; then
    SUBJECT="⚠️ High Error Count Alert on $(hostname)"
    MESSAGE="Log file $LOGFILE has $ERROR_COUNT errors. Please check immediately."
    echo "$MESSAGE" | mail -s "$SUBJECT" "$EMAIL"
    echo "📧 Alert sent to $EMAIL (Errors: $ERROR_COUNT)"
else
    echo "✅ Error count is under control."
fi
