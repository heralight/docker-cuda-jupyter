FROM nvidia/cuda:12.2.2-devel-ubuntu22.04
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get -y install build-essential \
        zlib1g-dev \
        libncurses5-dev \
        libgdbm-dev \ 
        libnss3-dev \
        libssl-dev \
        libreadline-dev \
        libffi-dev \
        libsqlite3-dev \
        libbz2-dev \
        wget \
    && export DEBIAN_FRONTEND=noninteractive
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update -y
RUN apt-get install sudo 
RUN apt install python3.11 python3-pip -y
RUN python3 -m pip install jupyterlab
CMD ["jupyter"]
