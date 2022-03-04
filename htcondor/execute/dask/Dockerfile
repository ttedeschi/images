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
    python3-dev \ 
    python3-pip \ 
    python3-distutils \
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

RUN python3 -m pip install -U pip setuptools wheel

# centos base packages
RUN python3 -m pip install \
    chardet==3.0.4 \
    htcondor==8.9.9 \
    idna==2.7 \
    PySocks==1.6.8 \
    requests==2.14.2 \
    six==1.14.0 \
    urllib3==1.25.6

# Base dependencies
RUN python3 -m pip install \
    click==7.1.2 \
    ipython \
    ipywidgets==7.6.5 \
    jupyter-server-proxy==3.1.0 \
    jupyterhub==1.5.0 \
    jupyterlab==3.2.2 \
    notebook==6.4.5 \
    toolz==0.11.1

RUN python3 -m pip install \
    asyncssh==2.9.0 \
    "dask[complete]==2021.3.0" \
    bokeh \
    dask-jobqueue==0.7.3 \
    dask-remote-jobqueue==0.4.21 \
    msgpack==1.0.2 \
    numpy==1.19.5 \
    pandas==1.1.5 \
    toolz==0.11.1

# RUN pip3 install jupyter-packaging
# RUN git clone --branch custom_clusters https://github.com/DODAS-TS/dask-labextension.git \
#     && cd dask-labextension \
#     && python3 -m pip install .

# COPY spawn.sh /.init/spawn.sh
# RUN echo "source ~/htc.rc" >> ~/.bashrc
# COPY kernel.json /usr/local/share/jupyter/kernels/python3/kernel.json
