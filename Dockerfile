FROM inclusivedesign/resin

ADD http://central.maven.org/maven2/org/json/json/20141113/json-20141113.jar /var/resin/webapp-jars/json-20141113.jar
ADD data /var/resin/webapps/ccc
ADD start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/start.sh

VOLUME ["/var/resin"]

EXPOSE 8080

CMD ["/usr/local/bin/start.sh"]
