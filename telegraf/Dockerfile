FROM telegraf

USER root

RUN curl -fsSL https://research.cs.wisc.edu/htcondor/repo/keys/HTCondor-Release.gpg.key | apt-key add - \
    && echo "deb [arch=amd64] https://research.cs.wisc.edu/htcondor/repo/debian/8.9 buster main\ndeb-src https://research.cs.wisc.edu/htcondor/repo/debian/8.9 buster main" > /etc/apt/sources.list.d/htcondor.list

RUN apt-get update && apt-get install -y htcondor

COPY test.py /bin/condor_metrics
COPY condor_metrics.sh /bin/condor_metrics.sh
COPY ca.crt /etc/ca.crt

RUN chmod +x /bin/condor_metrics
RUN chmod +x /bin/condor_metrics.sh


USER telegraf
