FROM quay.io/sebll/cryptosebll:v1
RUN yum --disableplugin=subscription-manager install httpd -y && yum --disableplugin=subscription-manager clean all

RUN sed -i 's/Listen 80/Listen 8080/'  /etc/httpd/conf/httpd.conf  && chgrp -R 0 /var/log/httpd /var/run/httpd  && chmod -R g=u /var/log/httpd /var/run/httpd && echo "Azure Red Hat OpenShift" > /var/www/html/index.html
EXPOSE 8080
USER 1001
CMD /usr/sbin/httpd -D FOREGROUND
