FROM rclone/rclone

ARG RUN_ID
ENV RUN_ID=${RUN_ID}

ENV RCLONE_JOBBER="https://raw.githubusercontent.com/wolfv6/rclone_jobber/refs/heads/master/rclone_jobber.sh"

RUN mkdir -p /rclone_jobber /etc/cron.d && \
    cd /rclone_jobber && \
    wget ${RCLONE_JOBBER}

ADD filter_rules /rclone_jobber/filter_rules
ADD job_backup_remote.sh /rclone_jobber/job_backup_remote.sh
ADD cronjobs /etc/cron.d/backup-cron

RUN chmod 0644 /etc/cron.d/backup-cron && \
    chmod +x /rclone_jobber/rclone_jobber.sh && \
    chmod +x /rclone_jobber/job_backup_remote.sh

# Override the entrypoint to use bash for running cron
ENTRYPOINT ["/bin/sh"]

# Default command: start crond in foreground
CMD ["-c", "crond -f"]
