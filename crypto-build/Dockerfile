FROM quay.io/sebll/cryptosebll:v1

#Copy Files
COPY rh8baseos-partners.repo /etc/yum.repos.d/ 
COPY openssl.cnf.sample.s390x /tmp
#RUN cmds
RUN yum --disableplugin=subscription-manager install httpd -y && yum --disableplugin=subscription-manager install openssl-ibmca -y && yum --disableplugin=subscription-manager clean all 
RUN tee -a /etc/pki/tls/openssl.cnf < /tmp/openssl.cnf.sample.s390x && sed -i 's/Listen 80/Listen 8080/'  /etc/httpd/conf/httpd.conf  && chgrp -R 0 /var/log/httpd /var/run/httpd  && chmod -R g=u /var/log/httpd /var/run/httpd && echo "HW Crypto with Red Hat OpenShift on IBM Z & IBM LinuxONE" > /var/www/html/index.html
# Expose port
EXPOSE 8080
USER 1001
CMD /usr/sbin/httpd -D FOREGROUND
