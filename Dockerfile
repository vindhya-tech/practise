FROM tomcat:9.0
COPY target/*.war /usr/local/tomcat/webapps/
EXPOSE 7007
CMD ["catalina.sh","run"]
