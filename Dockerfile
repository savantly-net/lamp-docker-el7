FROM php:7.0.33-apache

RUN a2enmod rewrite && \
	a2enmod headers

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev && rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd
RUN docker-php-ext-install mysqli

# Install
RUN apt-get update 	&& apt-get install -y --no-install-recommends curl wget unzip git vim nano \
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

# Install Memcached
RUN apt-get install -y --no-install-recommends memcached;
