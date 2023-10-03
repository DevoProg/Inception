FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server \
    mariadb-client \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Initialisation du repertoire MySQL
RUN mkdir -p /var/run/mysql \
&& chown -R mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

# Port 3306
EXPOSE 3306

# Copie de script + .sql dans /bin
COPY ./tools/mariadb.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh
RUN chmod +x /usr/local/bin/wordpress.sql

ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]