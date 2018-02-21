FROM ubuntu:16.04

MAINTAINER Pedro Gonzalez "pgonyan@ull.edu.es"

# Install.
RUN apt-get update

RUN apt-get install -y \
    openssh-client \
    wget \
    vim \
    git \
    curl \
    unzip \
    php \
    php-fpm \
    php-mysql \
    net-tools \
    nginx

# mysql
RUN echo  'mysql-server mysql-server/root_password password P1ngP4ng' | debconf-set-selections
RUN echo 'mysql-server mysql-server/root_password_again password P1ngP4ng' | debconf-set-selections
RUN apt-get update
RUN apt-get -y install mysql-server \
  tmux
ADD conf/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
# nginx
RUN rm -Rf /etc/nginx/nginx.conf
ADD  conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/sites-available/ && \
mkdir -p /etc/nginx/sites-enabled/ && \
mkdir -p /etc/nginx/ssl/ && \
rm -Rf /var/www/* && \
mkdir /var/www/html/
ADD conf/default /etc/nginx/sites-available/default
ADD conf/default-ssl /etc/nginx/sites-available/default-ssl
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf
RUN rm -f /etc/nginx/sites-available/defaul
ADD conf/www.conf /etc/php/7.0/fpm/pool.d/www.conf
ADD conf/php.ini /etc/php/7.0/fpm/php.ini

RUN mkdir /src
ADD src/prueba.php  /src
ADD src/prueba.sql /src
ADD src/ejemplo2.php  /src
# start
COPY start.sh /bin
RUN chmod a+x /bin/start.sh

EXPOSE 80 443 3306
CMD ["/bin/start.sh"]
