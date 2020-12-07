FROM quay.io/sebll/ubi8httpsebll:v1
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
