
# this is the Dockerfile for containerizing the tool
# We are going to use lightweight Linux base image

FROM ubuntu:20.04

#  Now we are Installing some dependencies (mail, cron, etc.)

RUN apt-get update && \
    apt-get install -y mailutils cron grep awk sed && \
    rm -rf /var/lib/apt/lists/*



# we are going Set working directory, which is our PWD in the container/machine

WORKDIR /app



# We will copy the script that we have created before dockerfile into container at '/app' location with log_analyzer.sh name.

COPY log_analyzer.sh /app/log_analyzer.sh


# We will copy cronjob file with name of log-analyzer-cron at below location, 'cronjob' is renamed as log-analyzer-cron.
COPY cronjob /etc/cron.d/log-analyzer-cron

# We have to set permissions for script and cronjob file that we have just copied aobe.
RUN chmod +x /app/log_analyzer.sh && \
    chmod 0644 /etc/cron.d/log-analyzer-cron && \
    crontab /etc/cron.d/log-analyzer-cron

# Now Run cron in foreground (so container keeps running)
CMD ["cron", "-f"]


