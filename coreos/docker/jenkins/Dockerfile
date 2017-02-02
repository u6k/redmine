FROM java:8

WORKDIR /opt

RUN curl -OL http://mirrors.jenkins.io/war-stable/latest/jenkins.war

EXPOSE 8080

VOLUME /root/.jenkins

CMD ["java", "-jar", "/opt/jenkins.war"]
