FROM quay.io/sebll/cryptosebll:v1
COPY rh8baseos-partners.repo /etc/yum.repos.d/
RUN yum --disableplugin=subscription-manager install httpd -y && yum --disableplugin=subscription-manager clean all && yum --disableplugin=subscription-manager install openssl-ibmca
RUN sed -i 's/Listen 80/Listen 8080/'  /etc/httpd/conf/httpd.conf  && chgrp -R 0 /var/log/httpd /var/run/httpd  && chmod -R g=u /var/log/httpd /var/run/httpd && echo "HW Crypto with Red Hat OpenShift on IBM Z & IBM LinuxONE" > /var/www/html/index.html
EXPOSE 8080
USER 1001
CMD /usr/sbin/httpd -D FOREGROUND
