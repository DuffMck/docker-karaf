# Liferay 6.2
#
# VERSION 0.0.1
#

FROM openjdk:8-jre-alpine

MAINTAINER Davide Bonomelli <davide.bonomelli@gmail.com>

# set env variables
ENV KARAF_VERSION=4.1.2

# install curl, unzip
RUN apk --no-cache add wget 
RUN apk --no-cache add unzip

# install liferay
RUN wget http://www-us.apache.org/dist/karaf/${KARAF_VERSION}/apache-karaf-${KARAF_VERSION}.tar.gz; \
    mkdir /opt; \
	mkdir /opt/karaf; \
    tar --strip-components=1 -C /opt/karaf -xzf apache-karaf-${KARAF_VERSION}.tar.gz; \
    rm apache-karaf-${KARAF_VERSION}.tar.gz; \
    mkdir /deploy; \
    sed -i 's/^\(felix\.fileinstall\.dir\s*=\s*\).*$/\1\/deploy/' /opt/karaf/etc/org.apache.felix.fileinstall-deploy.cfg

VOLUME ["/deploy"]
EXPOSE 1099 8101 44444
ENTRYPOINT ["/opt/karaf/bin/karaf"]