# Utiliser l'image officielle de Tomcat 10
FROM tomcat:10

LABEL maintainer="Mohamed"

# Créer le répertoire webapps s'il n'existe pas déjà
RUN mkdir -p /usr/local/tomcat/webapps

# Copier votre fichier WAR dans le répertoire webapps de Tomcat
COPY demo-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/


