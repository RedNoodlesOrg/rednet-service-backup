FROM rclone/rclone

ENV RCLONE_JOBBER="https://raw.githubusercontent.com/wolfv6/rclone_jobber/refs/heads/master/rclone_jobber.sh"

RUN mkdir /rclone_jobber && \
cd /rclone_jobber && \
wget ${RCLONE_JOBBER}

ADD filter_rules rclone_jobber/filter_rules
