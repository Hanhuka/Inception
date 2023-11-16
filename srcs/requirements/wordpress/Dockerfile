FROM debian:oldstable-slim

RUN apt update -y && apt upgrade

RUN apt install -y curl php-fpm php-mysql php-curl php-gd php-mbstring php-xml \
	php-xmlrpc php-soap php-intl php-zip mariadb-client


#installing wordpress command-line interface
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php/ && chmod 755 /run/php/

#change the port we want to listen from
RUN sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 9000#g' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/wp-script.sh /home/

RUN chmod +x /home/wp-script.sh

EXPOSE 9000

ENTRYPOINT [ "/home/wp-script.sh" ]

#-F Force to stay in foreground and ignore daemonize option from configuration file
CMD [ "php-fpm7.4", "-F", "-R" ]