FROM quay.io/sebll/ubi8httpsebll:v1
RUN yum --disableplugin=subscription-manager install httpd -y && yum --disableplugin=subscription-manager clean all
RUN yum install -y \
    s390utils-base \
    libpkgconf \
    pkgconf-pkg-config \
    libp11* \
    wget \
    git \
    autoconf \
    automake \
    binutils \
    gcc \
    gcc-c++ \
    gdb \
    glibc-devel \
    libtool \
    make \
    pkgconf \
    pkgconf-m4 \
    pkgconf-pkg-config \
    redhat-rpm-config \
    gcc \
    openssl-devel.s390x
# change group check
RUN sed -i 's/Listen 80/Listen 8080/'  /etc/httpd/conf/httpd.conf  && chgrp -R 0 /var/log/httpd /var/run/httpd  && chmod -R g=u /var/log/httpd /var/run/httpd && echo "Crypto Tests with Red Hat OpenShift" > /var/www/html/index.html
EXPOSE 8080
USER 1001
CMD /usr/sbin/httpd -D FOREGROUND
