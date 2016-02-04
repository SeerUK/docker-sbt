FROM seeruk/docker-java:oracle-java8
MAINTAINER Elliot Wright <elliot@elliotwright.co>

ENV SBT_VERSION 0.13.9
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

# Install sbt
RUN \
    useradd -u 1000 -m -s /bin/bash sbt && \
    mkdir -p /app && \
    chown -R sbt: /opt && \
    apt-get update && \
    apt-get install -y curl && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sL "http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local && \
    echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built

USER sbt

WORKDIR /app
