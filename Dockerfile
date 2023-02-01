FROM centos:7
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
RUN yum install -y \
       java-1.8.0-openjdk \
       java-1.8.0-openjdk-devel
ENV JAVA_HOME /etc/alternatives/jre
RUN java -version
WORKDIR /opt/tomcat/webapps
COPY /target/mkyong.war /opt/tomcat/webapps
# RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war
EXPOSE 8082
CMD ["/opt/tomcat/bin/catalina.sh", "run"]