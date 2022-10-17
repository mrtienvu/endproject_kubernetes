FROM tomcat:9.0.64-jre11-openjdk-slim-bullseye
ADD addressbook.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
