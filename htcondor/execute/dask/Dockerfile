FROM htcondor/execute:8.9.9-el7

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /bin/tini
RUN chmod +x /bin/tini

RUN cd /etc/yum.repos.d \
    && wget https://repo.data.kit.edu/data-kit-edu-centos7.repo

RUN yum -y update \
    && yum -y install \
    binutils \
    bzip2-devel \
    cmake3 \
    dnf \
    gcc \
    gcc-c++ \
    gdbm-devel \
    git \
    jq \
    libffi-devel \
    libmicrohttpd \
    libseccomp \
    libsecret \
    libsodium \
    libuuid-devel \
    libX11-devel \
    libXext-devel \
    libXft-devel \
    libXpm-devel \
    make \
    openssl-devel \
    python \
    readline-devel \
    sqlite-devel \
    xz-devel \
    yad \
    zlib-devel

RUN dnf -y install oidc-agent \
    && yum clean all \
    && rm -rf /var/cache/yum

# Overwrite python3 with python3.7 (Dask requirement)
RUN cd /usr/src \
    && wget https://www.python.org/ftp/python/3.7.12/Python-3.7.12.tgz \
    && tar xzf Python-3.7.12.tgz \
    && rm Python-3.7.12.tgz \
    && cd Python-3.7.12 \
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
    notebook==6.4.5

# Dask
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
    dask-remote-jobqueue==0.4.21

# RUN pip3 install jupyter-packaging
# RUN git clone --branch custom_clusters https://github.com/DODAS-TS/dask-labextension.git \
#     && cd dask-labextension \
#     && python3 -m pip install .

# COPY spawn.sh /.init/spawn.sh
# RUN echo "source ~/htc.rc" >> ~/.bashrc
# COPY kernel.json /usr/local/share/jupyter/kernels/python3/kernel.json
