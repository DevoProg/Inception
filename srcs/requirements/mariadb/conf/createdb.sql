/** On met tout au propre pour eviter les valeurs par defaut **/
DELETE FROM	mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

/** On a choisi de l installer avec la methode d authentification normale donc il faut set le password **/
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');

/** Creation du premier user, l'autre sera cree via le container wordpress */
CREATE DATABASE $MYSQL_DATABASE;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED by '$MARIADB_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%';

/** Il faut flush pour que le grant soit active */
FLUSH PRIVILEGES;