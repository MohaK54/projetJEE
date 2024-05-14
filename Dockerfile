# Utiliser l'image officielle de Tomcat 10
FROM tomcat:10

LABEL maintainer="Mohamed"


# Copier votre fichier WAR dans le répertoire webapps de Tomcat
COPY target/demo-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/


