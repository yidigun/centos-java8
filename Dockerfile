FROM centos:latest
MAINTAINER dklee@yidigun.com

ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 181
ENV JAVA_VERSION_BUILD 13
ENV JAVA_URL_HASH 96a7b8442fe848ef90c96a2fad6ed6d1

RUN yum -y install libX11 libXext libXi libXrender libXtst alsa-lib && \
    mkdir -p /opt/oracle && \
    curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" \
      "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_URL_HASH}/server-jre-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz" | \
        tar zxf - -C /opt/oracle && \
    ln -s jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} /opt/oracle/java && \
    yum -y clean all && \
    rm -rf /var/cache/yum

ENV JAVA_HOME /opt/oracle/java
ENV PATH ${PATH}:${JAVA_HOME}/bin
