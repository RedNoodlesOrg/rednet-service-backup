FROM rclone/rclone

ARG RUN_ID
ENV RUN_ID=${RUN_ID}

ENV RCLONE_JOBBER="https://raw.githubusercontent.com/wolfv6/rclone_jobber/refs/heads/master/rclone_jobber.sh"

RUN mkdir -p /rclone_jobber /etc/cron.d && \
    cd /rclone_jobber && \
    wget ${RCLONE_JOBBER}

ADD filter_rules /rclone_jobber/filter_rules
ADD job_backup_remote.sh /etc/periodic/daily/job_backup_remote.sh

RUN chmod +x /rclone_jobber/rclone_jobber.sh && \
    chmod +x /etc/periodic/daily/job_backup_remote.sh

# Override the entrypoint to use bash for running cron
ENTRYPOINT ["/bin/sh"]

# Default command: start crond in foreground
CMD ["-c", "crond -f"]
