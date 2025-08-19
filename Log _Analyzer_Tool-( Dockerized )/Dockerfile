
# this is the Dockerfile for containerizing the tool
# We are going to use lightweight Linux base image

FROM ubuntu:20.04

# Now we are Installing some dependencies (mail, cron, etc.)

RUN apt-get update && \
    apt-get install -y mailutils cron grep awk sed && \
    rm -rf /var/lib/apt/lists/*



# we are going Set working directory, which is our PWD in the container/machine

WORKDIR /app



# We will copy the script that we have created before dockerfile into container at '/app' location with log_analyzer.sh name.

COPY log_analyzer.sh /app/log_analyzer.sh


# Now Make script executable by giving permission

RUN chmod +x /app/log_analyzer.sh



# Now we will run the analyzer by default using below command

CMD ["/app/log_analyzer.sh"]
