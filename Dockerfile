# shadowsocks
#
# VERSION 0.0.3

FROM ubuntu:16.04

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install  -y git
#RUN apt-get install  -y python-pip libsodium18
#RUN pip install shadowsocks
#RUN pip install --upgrade pip
#CMD ssserver -p 443 -k password -m aes-256-cfb --user nobody -d start

RUN git clone -b manyuser https://github.com/shadowsocksr-backup/shadowsocksr.git
WORKDIR ./shadowsocksr
RUN initcfg.sh

WORKDIR ./shadowsocksr/shadowsocks

CMD python server.py -d stop / restart

# Configure container to run as an executable
#ENTRYPOINT ["/usr/local/bin/ssserver"]
