FROM php:7.0.33-fpm

RUN apt-get update && apt-get install -y apache2 libapache2-mod-fcgid

RUN a2enmod rewrite headers actions fcgid alias proxy_fcgi

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev && rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd
RUN docker-php-ext-install mysqli

# Install
RUN apt-get update && apt-get install -y --no-install-recommends curl wget unzip git vim nano \
iproute python-setuptools hostname inotify-tools \
python-meld3 python-pip

# Install Python and Supervisor
RUN apt-get install -y --no-install-recommends python-setuptools

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install MySql client
RUN apt-get install -y --no-install-recommends mysql-server software-properties-common

#RUN add-apt-repository ppa:ondrej/php && \
# apt-get update && apt-get install php-mysql

# Install Memcached and sendmail
RUN apt-get install -y --no-install-recommends memcached

COPY --chown=www-data:www-data config/apache/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY config/fpm/php-fpm.conf /usr/local/etc/php-fpm.conf
COPY config/fpm/www.conf /usr/local/etc/php-fpm.d/www.conf

COPY config/php/* /usr/local/etc/php/

COPY --chown=www-data:www-data config/test/* /var/www/html/

COPY docker-entrypoint.sh /entrypoint.sh
# delete the placeholder index page
RUN rm /var/www/html/index.html

# ENTRYPOINT resets CMD
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
#CMD ["/usr/sbin/apachectl","-DFOREGROUND"]