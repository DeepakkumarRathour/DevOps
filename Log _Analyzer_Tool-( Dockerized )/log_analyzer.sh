
#!/bin/bash
# log_analyzer.sh - Enhancung the  Linux Log Analyzer Tool

# step 01
LOGFILE="/var/log/syslog"   # You can change the location if needed
THRESHOLD=10                # Alert if errors exceed this number
EMAIL="rathourdeepakkumarjofficial@gmail.com"  # mention your mail id on which you want a alert notifications.


# step 02
# We are check if logfile are exists
if [ ! -f "$LOGFILE" ]; 
then
    echo " No Log-files $LOGFILE are found!"
    exit 1
fi

# optional--    echo " Analyzing log file: $LOGFILE" and echo "----------------------------------"



# step 03
# we are counting ERROR, WARNING, INFO
ERROR_COUNT=$(grep -i "error" "$LOGFILE" | wc -l)
WARNING_COUNT=$(grep -i "warning" "$LOGFILE" | wc -l)
INFO_COUNT=$(grep -i "info" "$LOGFILE" | wc -l)


echo " Log Summary:"
echo "  Errors   : $ERROR_COUNT"
echo "  Warnings : $WARNING_COUNT"
echo "  Info     : $INFO_COUNT"
echo ""




# step 04
# Now we have to show top 5 most common log messages
echo " Top 5 most frequent log entries are below:"
grep -i -o ".*" "$LOGFILE" | sort | uniq -c | sort -nr | head -5
echo ""



# step 05
# Now send email alert if too many errors   note that we are sending Email alert only for ERROR not for warnings and info.
if [ "$ERROR_COUNT" -gt "$THRESHOLD" ];    # here we are comparing the no.of errors with threshold value that we have set at starting.
then
    SUBJECT=" High Error Count Alert on $(hostname)"
    MESSAGE="Log file $LOGFILE has $ERROR_COUNT errors. Please check immediately."
    echo "$MESSAGE" | mail -s "$SUBJECT" "$EMAIL"
    echo " Alert sent to $EMAIL (Errors: $ERROR_COUNT)"
else
    echo " Error count is under control."
fi
