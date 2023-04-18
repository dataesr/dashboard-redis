FROM ubuntu:18.04

RUN  apt-get update \
  && apt-get install -y wget \
     gnupg2

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.8 \
    python3-pip \
    python3.8-dev \
    libpython3.8 \
    libpython3.8-dev \
    curl \
    git \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3.8 get-pip.py

RUN pip install git+https://github.com/jace/rq-dashboard.git@main

EXPOSE 9181

CMD ["rq-dashboard"]
