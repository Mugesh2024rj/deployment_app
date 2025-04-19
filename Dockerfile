FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TOMCAT_VERSION=9.0.85

RUN apt-get update && \
    apt-get install -y default-jdk curl unzip && \
    apt-get clean

RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz && \
    tar xzf apache-tomcat-$TOMCAT_VERSION.tar.gz && \
    mv apache-tomcat-$TOMCAT_VERSION /opt/tomcat && \
    rm apache-tomcat-$TOMCAT_VERSION.tar.gz


COPY index.html /opt/tomcat/webapps/ROOT/index.html

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]

