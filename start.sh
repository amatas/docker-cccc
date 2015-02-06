#!/bin/bash

#RESIN_ADMIN_USER
#RESIN_ADMIN_PASSWORD
#resinctl generate-password --user admin --password password >> /etc/resin/resin.properties

sed -e "s|^web_admin_enable .*$|web_admin_enable : false|" -i /etc/resin/resin.properties
sed -e "s|^dev_mode .*$|dev_mode : false|" -i /etc/resin/resin.properties
sed -e "s|^resin_doc .*$|resin_doc : false|" -i /etc/resin/resin.properties

chown resin:resin -R /var/resin/webapps/ccc
chown resin:resin -R /var/resin/webapp-jars


# TODO: 
#  - log everygthing to stdout

# cat >/etc/supervisord.d/resin.ini<<EOF
# [program:resin]
# command=/usr/bin/java -d64 -jar /usr/local/share/resin-4.0.42/lib/resin.jar -root-directory /var/resin -conf /etc/resin/resin.xml start-with-foreground
# user=resin
# autorestart=true
# redirect_stderr=true
# stdout_logfile=/dev/stdout
# stdout_logfile_maxbytes=0
# EOF

# we don't use supervisor because resin watchdog doesn't kill its childs processes
# supervisord -c /etc/supervisord.conf

/usr/bin/resinctl start-with-foreground
