FROM ubuntu:latest

MAINTAINER coder965  <coder965@126.com>

#VOLUME ["/jira/data/attachments"]
#VOLUME ["/jira/export"]

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install wget -y

WORKDIR /tmp
COPY response.varfile /tmp/
#COPY atlassian-jira-software-7.3.8-x64.bin /tmp/
#COPY atlassian-jira-software-7.11.0-x64.bin /tmp/
COPY crackfile/atlassian-extras-3.2.jar /tmp/atlassian-extras-3.2.jar
COPY crackfile/postgresql-9.4.1212.jar /tmp/postgresql-9.4.1212.jar

#RUN wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.4.11-x64.bin
#RUN chmod 700 atlassian-jira-6.4.11-x64.bin

RUN wget https://product-downloads.atlassian.com/software/jira/downloads/atlassian-jira-software-7.11.0-x64.bin
RUN chmod 700 atlassian-jira-software-7.11.0-x64.bin

#RUN chmod 700 atlassian-jira-software-7.3.8-x64.bin

RUN mkdir /jira
#RUN /tmp/atlassian-jira-software-7.3.8-x64.bin -q -varfile response.varfile
RUN /tmp/atlassian-jira-software-7.11.0-x64.bin -q -varfile response.varfile

#RUN rm /tmp/atlassian-jira-software-7.3.8-x64.bin
RUN rm /tmp/atlassian-jira-software-7.11.0-x64.bin
RUN rm /tmp/response.varfile

#crack
RUN rm /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/atlassian-extras-3.2.jar
RUN cp  /tmp/atlassian-extras-3.2.jar /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/atlassian-extras-3.2.jar
RUN cp  /tmp/postgresql-9.4.1212.jar /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/postgresql-9.4.1212.jar


EXPOSE 8080

CMD /opt/atlassian/jira/bin/start-jira.sh -fg


#run build:
#docker build . -t="coder965/jira-7"
