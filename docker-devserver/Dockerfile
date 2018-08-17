FROM centos:centos7

# packages
RUN yum -y install \
  epel-release \
  http://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm \
  http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
  && yum clean all && \
  yum -y install --enablerepo=remi-php72 \
  git \
  man-db \
  curl \
  wget \
  gcc \
  gcc-c++ \
  make \
  gettext \
  unzip \
  tar \
  vim-enhanced \
  sudo \
  tree \
  patch \
  zlib \
  zlib-devel \
  bzip2  \
  bzip2-devel  \
  readline \
  readline-devel  \
  sqlite  \
  sqlite-devel  \
  libxml2 \
  libxml2-devel \
  libicu-devel \
  libcurl \
  libcurl-devel \
  libjpeg \
  libjpeg-devel \
  libpng \
  libpng-devel \
  freetype \
  freetype-devel \
  libmcrypt \
  libmcrypt-devel \
  libtidy \
  libtidy-devel \
  libxslt \
  libxslt-devel \
  libXrender \
  libXext \
  fontconfig-devel \
  ipa-gothic-fonts \
  ipa-mincho-fonts \
  ipa-pgothic-fonts \
  ipa-pmincho-fonts \
  file \
  file-devel \
  bison \
  bison-devel \
  re2c \
  openssl  \
  openssl-devel \
  autoconf \
  automake \
  libtool \
  mysql-community-server \
  mysql-community-client \
  php \
  php-common \
  php-process \
  php-cli \
  php-pdo \
  php-pear \
  php-mbstring \
  php-xml \
  php-soap \
  php-devel \
  php-gmp \
  php-mysqlnd \
  php-bcmath \
  php-opcache \
  php-pecl-memcached

# composer
RUN curl -L https://getcomposer.org/composer.phar -o /usr/bin/composer && chmod 755 /usr/bin/composer

# sudo config
RUN sed -i -e 's/Defaults[ 	]*env_reset/#Defaults    env_reset/' /etc/sudoers \
    && sed -i -e 's/Defaults[ 	]*secure_path/#Defaults    secure_path/' /etc/sudoers \
    && echo 'Defaults    env_keep += "PATH"' >> /etc/sudoers

# httpd
COPY httpd-devserver.conf /etc/httpd/conf.d/devserver.conf
RUN systemctl enable httpd

# mysqld
COPY my.cnf /etc/my.cnf
RUN systemctl enable mysqld

# oneshot boot script
COPY bootscript.sh /opt/bootscript.sh
COPY bootscript.service  /usr/lib/systemd/system/bootscript.service
RUN systemctl enable bootscript

CMD ["/bin/bash"]
