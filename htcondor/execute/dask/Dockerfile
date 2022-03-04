FROM htcondor/execute:8.9-ubu18.04

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /bin/tini
RUN chmod +x /bin/tini

RUN apt-get update \
    && apt-get install -y gnupg2 software-properties-common

RUN apt-get update && apt-get install -y \
    software-properties-common \
    help2man \
    check \
    devscripts \
    make \
    sudo \
    ca-certificates \
    libcurl4-openssl-dev \
    libsodium-dev \
    libseccomp-dev \
    libmicrohttpd-dev \
    libsecret-1-dev \
    python3 \
    python3-pip \ 
    wget \
    fuse \
    git \
    build-essential \
    debhelper \
    pkg-config \
    perl \
    sed \
    libqrencode-dev \
    fakeroot

RUN cd /opt/ && git clone https://github.com/indigo-dc/oidc-agent \
    && cd oidc-agent \
    && make \
    && make install_lib \
    && make install

# Overwrite python3 with python3.8 (Dask requirement)
RUN cd /usr/src \
    && wget https://www.python.org/ftp/python/3.8.8/Python-3.8.8.tgz \
    && tar xzf Python-3.8.8.tgz \
    && rm Python-3.8.8.tgz \
    && cd Python-3.8.8 \
    && ./configure --enable-optimizations \
    && make install

RUN python3 -m pip install -U pip setuptools wheel

# centos base packages
RUN pip3 install \
    chardet==3.0.4 \
    htcondor==8.9.9 \
    idna==2.7 \
    PySocks==1.6.8 \
    requests==2.14.2 \
    six==1.14.0 \
    urllib3==1.25.6

# Base dependencies
RUN pip3 install \
    click==7.1.2 \
    ipython \
    ipywidgets==7.6.5 \
    jupyter-server-proxy==3.1.0 \
    jupyterhub==1.5.0 \
    jupyterlab==3.2.2 \
    notebook==6.4.5 \
    toolz==0.11.1

RUN cd /tmp \
    && git clone --branch 2021.11.1 https://github.com/dask/distributed.git \
    && git clone --branch 2021.11.1 https://github.com/dask/dask.git \
    && cd /tmp/dask \
    && python3 -m pip install . --use-feature=in-tree-build \
    && cd /tmp/distributed \
    && python3 -m pip install . --use-feature=in-tree-build \
    && cd /tmp/dask \
    && python3 -m pip install ".[complete]" --use-feature=in-tree-build \
    && pip3 install \
    dask-jobqueue==0.7.3 \
    dask-remote-jobqueue==0.4.21 \
    msgpack==1.0.2 \
    numpy==1.20.3 \
    pandas==1.3.3 \
    toolz==0.11.1

# RUN pip3 install jupyter-packaging
# RUN git clone --branch custom_clusters https://github.com/DODAS-TS/dask-labextension.git \
#     && cd dask-labextension \
#     && python3 -m pip install .

# COPY spawn.sh /.init/spawn.sh
# RUN echo "source ~/htc.rc" >> ~/.bashrc
# COPY kernel.json /usr/local/share/jupyter/kernels/python3/kernel.json
