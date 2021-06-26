# lamp-docker

Lamp container  

Preconfigured with -  
- php
- php-fpm
- apache

Available on Dockerhub as `savantly/lamp-docker:7.0`  

`docker run -p 80:80 savantly/lamp-docker:7.0`  

To use, create your own `Dockerfile` and extend this docker image.  
Copy your html/php into the `/var/www/html` directory.  

Example -  

```yaml
FROM savantly/lamp-docker:7.0
# copy the site
COPY --chown=www-data:www-data src /var/www/html
```

Complex Example -  

```yaml
FROM savantly/lamp-docker:7.0

# install ssh2 extension for php
RUN apt-get install -y \
	libssh2-1-dev
RUN cd /tmp && git clone https://git.php.net/repository/pecl/networking/ssh2.git && cd /tmp/ssh2 \
    && phpize && ./configure && make && make install \
    && echo "extension=ssh2.so" > /usr/local/etc/php/conf.d/ext-ssh2.ini \
    && rm -rf /tmp/ssh2

# install by pecl - dbase
RUN pecl install dbase

# copy the site
COPY --chown=www-data:www-data src /var/www/html

# install another php.ini 
# since the conf.d is search alphabetically, renaming it so it's applied last
COPY --chown=www-data:www-data src/php.ini /usr/local/etc/php/conf.d/z_php.ini
```