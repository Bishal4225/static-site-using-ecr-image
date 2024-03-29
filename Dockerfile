FROM ubuntu

RUN apt-get update

RUN apt-get install nginx -y

COPY index.html /var/www/html/index.html

EXPOSE 80

CMD [“nginx”,”-g”,”daemon off;”]


# FROM php:8.1.18-apache-bullseye

# # System tools
# RUN apt-get update \
#     && apt-get install -y --no-install-recommends git zlib1g-dev libzip-dev procps zip unzip jq

# # Install wait-for-it
# ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /bin/wait-for-it.sh
# RUN chmod +x /bin/wait-for-it.sh

# # RUN a2enmod proxy_fcgi rewrite headers ssl
# RUN a2enmod rewrite headers ssl http2 proxy proxy_http

# # Turn ServerSignature off
# RUN echo 'ServerTokens Prod' >> /etc/apache2/apache2.conf
# RUN echo 'ServerSignature Off' >> /etc/apache2/apache2.conf


# # PHP extensions
# RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
# RUN docker-php-ext-install mysqli pdo pdo_mysql zip

# # For editing code locally
# ARG APACHE_USER
# ARG APACHE_USER_ID
# RUN echo "Using $APACHE_USER - $APACHE_USER_ID for owning site files"
# RUN if [ -n "$APACHE_USER" -a -n "$APACHE_USER_ID" ]; then groupadd $APACHE_USER -f -g $APACHE_USER_ID; fi
# RUN if [ -n "$APACHE_USER" -a -n "$APACHE_USER_ID" -a -n "$APACHE_USER" ]; then useradd -o "$APACHE_USER" -u $APACHE_USER_ID -g $APACHE_USER -d /var/www -m; fi

# # Apache VHOST configuration
# ADD ./.docker/etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf

# # Site code
# ADD --chown=www-data:www-data ./ /var/www/html

# # Cleaning up
# RUN apt-get clean && rm -rf /tmp/* /var/tmp/* && rm -rf /var/lib/apt/lists/*

# # Run extra tasks for deploy (install dependencies, run migrations, etc.)
# ADD ./.docker/core/entrypoint.sh /bin/entrypoint.sh
# RUN chmod 755 /bin/entrypoint.sh
# ENTRYPOINT [ "/bin/entrypoint.sh" ]

# # Apache foreground
# CMD [ "apache2ctl", "-D", "FOREGROUND" ]
