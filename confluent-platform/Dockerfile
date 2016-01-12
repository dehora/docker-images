# Builds a base docker image for the Confluent stream platform. It doesn't
# start up any particular service, just installs the platform. Other images
# inherit from this image to start up a particular service.

FROM azul/zulu-openjdk

ENV SCALA_VERSION="2.11.7"
ENV JAVA_VERSION="7"
ENV CONFLUENT_MAJOR_VERSION="2.0"

RUN apt-get update -qq && apt-get install -y build-essential && apt-get install -y software-properties-common
RUN apt-get install -y sudo
RUN apt-get install -y telnet
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y apt-file
RUN apt-file update
RUN apt-get upgrade -y
RUN wget -qO - http://packages.confluent.io/deb/2.0/archive.key | apt-key add -
RUN add-apt-repository "deb http://packages.confluent.io/deb/2.0 stable main"
RUN apt-get update
RUN apt-get install confluent-platform-2.11.7 -y