FROM php:7.0.33-apache

# Install varioius utilities
RUN apt-get update 	&& apt-get install -y --no-install-recommends curl wget unzip git vim nano \
iproute python-setuptools hostname inotify-tools \
python-meld3 python-pip

# Install Python and Supervisor
RUN apt-get install -y --no-install-recommends python-setuptools

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install MySql client
RUN apt-get install -y --no-install-recommends mysql-server

# Install Redis
RUN apt-get install -y --no-install-recommends redis-server;
EXPOSE 3000
