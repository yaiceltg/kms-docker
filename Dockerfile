FROM ubuntu:16.04

MAINTAINER yaiceltg@gmail.com

# Install Kurento Media Server (KMS) 
RUN echo "deb http://ubuntu.openvidu.io/6.8.1 xenial kms6" > /etc/apt/sources.list.d/kurento.list \
	&& apt-key adv --no-tty --keyserver keyserver.ubuntu.com --recv-keys 5AFA7A83 \
	&& apt-get update \
	&& apt-get -y install kurento-media-server


# Copy KMS entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 8888
EXPOSE 9091