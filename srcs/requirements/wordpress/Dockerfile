FROM debian:bullseye

RUN apt-get update && apt-get -y install \
	wget \
	curl \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	redis \
	php-redis \
	&& rm -rf /var/lib/apt/lists/*

# Installer WP-CLI afin de gerer wordpress via le terminal du conteneur
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

# Copier le fichier de config pour PHP
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

# Necessaire au demarrage de PHP
RUN mkdir /run/php

# Install le script et l'execute au lancement du conteneur
COPY ./tools/create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh
ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

#On se place dans le dossier html
WORKDIR /var/www/html/

#On monte le port 9000
EXPOSE 9000

#Lancer PHP FPM en foreground
CMD ["/usr/sbin/php-fpm7.4", "-F"]



