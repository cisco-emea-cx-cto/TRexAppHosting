FROM ubuntu:latest
RUN apt-get update
RUN apt-get -y install python3 \
             wget \
             bash \
             net-tools \
             netbase \
             strace \
             iproute2 \
             iputils-ping \
             pciutils \
             vim
RUN wget http://trex-tgn.cisco.com/trex/release/v3.02.tar.gz && \
    tar -zxvf v3.02.tar.gz -C / && \
    chown root:root /v3.02  && \
    rm v3.02.tar.gz
COPY trex_cfg_cat9k.yaml /etc/trex_cfg_cat9k.yaml
WORKDIR /v3.02
CMD ["./t-rex-64", "-i", "--cfg", "/etc/trex_cfg_cat9k.yaml"]
