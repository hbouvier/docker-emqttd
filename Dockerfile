FROM ubuntu:trusty
RUN apt-get -y update && \
    apt-get -y install wget git make && \
    mkdir -p /src && \
    cd /src && \
    git clone https://github.com/emqtt/emqttd.git && \
    wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
    dpkg -i erlang-solutions_1.0_all.deb && \
    apt-get -y update && \
    apt-get -y install esl-erlang && \
    cd /src/emqttd && \
    make && \
    make dist && \
    mv rel/emqttd /

COPY ./bin /bin/
COPY ./etc /emqttd/etc/
COPY ./plugins /emqttd/plugins/

RUN chmod a+x /bin/emqttd

# 1883	MQTT Port
# 8883	MQTT Over SSL Port
# 8083	MQTT(WebSocket), HTTP API Port
# 18083	Dashboard Port
EXPOSE 1883 8883 8083 18083
CMD /bin/emqttd
