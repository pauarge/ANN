FROM ubuntu:16.04

ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        software-properties-common \
        build-essential \
        git \
        wget \
        curl \
        vim \
        libopenblas-base \
        graphviz \
        python-dev \
        python3-dev \
        python3-pip \
        python3-setuptools \
        python3-wheel && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip3 install --upgrade pip && \
    pip3 --no-cache-dir install --upgrade \
        numpy==1.13.0 \
        scipy \
        matplotlib \
        seaborn \
        pandas \
        h5py \
        graphviz \         
        pydot \
        pyaml \
        tqdm \
        tensorboard \
        tensorflow==1.5.0 \
        keras==2.1.4 \
        jupyter \
        jupyter-tensorboard \
        scikit-learn

WORKDIR /jupyter

CMD jupyter notebook --ip=0.0.0.0 --allow-root --no-browser --NotebookApp.token=''

