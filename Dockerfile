FROM debian:bookworm

RUN apt-get update
RUN apt-get install -y \
php php-common php-fpm php8.2-cli php8.2-common php8.2-fpm \
nginx vim php8.2-opcache php8.2-readline \
php-xml php-json php-mbstring php-zip php-gd

ADD default /etc/nginx/sites-enabled/default
ADD www.conf /etc/php/8.2/fpm/pool.d/www.conf

RUN mkdir -p /var/www/dokuwiki
ADD index.php /var/www/dokuwiki/doku.php

RUN chown -R www-data:www-data /var/www

ADD startup.sh /var/www/startup.sh
CMD [ "/var/www/startup.sh" ]
