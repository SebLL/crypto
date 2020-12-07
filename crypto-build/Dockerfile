FROM quay.io/sebll/ubi8httpsebll:v1
RUN chgrp -R 0 /run && chmod -R g=u /run
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



#Compiling the latest libica package for CPACF icastats and icainfo commands

RUN git clone https://github.com/opencryptoki/libica.git \
    && cd libica \
    && autoreconf --force --install --verbose --warnings=all \
    && ./configure \
    && make \
    && make install

# Remove cache to make the image smaller
RUN yum remove -y wget git && yum autoremove
RUN sed -i 's/Listen 80/Listen 8080/'  /etc/httpd/conf/httpd.conf  && chgrp -R 0 /var/log/httpd /var/run/httpd  && chmod -R g=u /var/log/httpd /var/run/httpd && echo "Azure Red Hat OpenShift" > /var/www/html/index.html
EXPOSE 8080
USER 1001
CMD /usr/sbin/httpd -D FOREGROUND
