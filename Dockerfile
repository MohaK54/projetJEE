# Utiliser l'image officielle de Tomcat 10
FROM tomcat:10

LABEL maintainer="Mohamed"

# Créer le répertoire webapps s'il n'existe pas déjà
RUN mkdir -p /usr/local/tomcat/webapps

# Copier votre fichier WAR dans le répertoire webapps de Tomcat
COPY target/demo-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Exposer le port sur lequel Tomcat fonctionne (par défaut, c'est 8080)
EXPOSE 8081

# Commande de démarrage pour démarrer Tomcat et lancer votre application automatiquement
CMD ["catalina.sh", "run"]

