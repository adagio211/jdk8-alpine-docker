FROM alpine:latest

MAINTAINER cpc "puzhijunh@163.com"

ADD jdk-8u251-linux-x64.tar.gz /

COPY glibc-2.31-r0.apk glibc-bin-2.31-r0.apk glibc-i18n-2.31-r0.apk /

RUN echo http://mirrors.aliyun.com/alpine/v3.10/main/ > /etc/apk/repositories && \
    echo http://mirrors.aliyun.com/alpine/v3.10/community/ >> /etc/apk/repositories && \
    apk update && apk upgrade && \
    apk --no-cache add ca-certificates wget && \ 
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    apk add glibc-2.31-r0.apk glibc-bin-2.31-r0.apk glibc-i18n-2.31-r0.apk && \ 
    rm -rf /var/cache/apk/* glibc-2.31-r0.apk glibc-bin-2.31-r0.apk glibc-i18n-2.31-r0.apk && \
    rm -rf jdk-8u251-linux-x64.tar.gz
    
ENV JAVA_HOME=/jdk1.8.0_251
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH=$JAVA_HOME/bin:$PATH    

CMD ["java","-version"]