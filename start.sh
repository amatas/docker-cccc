#!/bin/bash

#RESIN_ADMIN_USER
#RESIN_ADMIN_PASSWORD
#resinctl generate-password --user admin --password password >> /etc/resin/resin.properties

sed -e "s|^web_admin_enable .*$|web_admin_enable : false|" -i /etc/resin/resin.properties
sed -e "s|^dev_mode .*$|dev_mode : false|" -i /etc/resin/resin.properties
sed -e "s|^resin_doc .*$|resin_doc : false|" -i /etc/resin/resin.properties

if [ ! -z $CCC_PASSWORD ]; then
  find /var/resin/webapps/ROOT -name *.php -type f -print0 | xargs -0 sed -i "s/password1234567890/${CCC_PASSWORD}/g"
  find /var/resin/webapps/ROOT -name *.java -type f -print0 | xargs -0 sed -i "s/password1234567890/${CCC_PASSWORD}/g"
fi

chown resin:resin -R /var/resin/webapps
chown resin:resin -R /var/resin/webapp-jars

/usr/bin/resinctl start
tail -f /var/log/resin/jvm-app-0.log
