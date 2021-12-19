FROM htcondor/execute:8.9.9-el7

RUN cd /etc/yum.repos.d && wget --progress=bar https://repo.data.kit.edu/data-kit-edu-centos7.repo
RUN yum install -y oidc-agent cron crontabs && yum clean all

COPY oidc-cron /etc/cron.d/oidc-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/oidc-cron

# Apply cron job
RUN crontab /etc/cron.d/oidc-cron

RUN wget https://gist.githubusercontent.com/dciangot/018e797887cf7eadc8e4dca0b94819d3/raw/7c01f77115ff323b2248feded125c72934775bd5/ca-dodas.crt -O /root/.ca.crt

RUN echo "eval \`oidc-keychain\`" >> ~/.bashrc 