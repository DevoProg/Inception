FROM    debian:bullseye

# Installer les dependances necessaires + suppr elements non necessaires.
RUN apt-get update
RUN apt-get install -y nginx openssl
RUN rm -rf /var/lib/apt/lists/*

# Mettre en place les protocoles ssl
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/adevos.crt -keyout /etc/nginx/ssl/adevos.key -subj "/C=BE/ST=BRUXELLES/L=BRUXELLES/O=Ecole 19/OU=adevos/CN=adevos/"

# Copier le fichier nginx.conf dans "/etc/nginx/conf.d"
COPY    ./conf/nginx.conf /etc/nginx/conf.d

# Creation du dossier "/run/nginx"
RUN mkdir -p /run/nginx

# Exposition du port 443 pour les requetes https
EXPOSE  443

# Garantit que Nginx s'exécute en mode foreground dans le conteneur Docker, 
# ce qui maintient le conteneur actif aussi longtemps que Nginx est en cours d'exécution.
CMD ["nginx", "-g", "daemon off;"]
