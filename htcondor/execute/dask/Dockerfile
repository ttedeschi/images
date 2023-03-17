FROM htcondor/execute:10.3.1-el8

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /bin/tini
RUN chmod +x /bin/tini

RUN yum -y update \
    && yum -y install \
    apptainer
