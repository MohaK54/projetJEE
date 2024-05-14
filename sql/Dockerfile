# Utilisez l'image officielle de Microsoft SQL Server
FROM mcr.microsoft.com/mssql/server:2019-latest

# Ajout des informations sur le mainteneur
LABEL maintainer="Mohamed"

# Définir l'utilisateur root pour les opérations de copie
USER root

# Copier le script SQL dans le conteneur
COPY dump/creabaseCICD.sql /scripts/

# Définir les variables d'environnement nécessaires pour SQL Server
ENV ACCEPT_EULA=Y

# Utiliser une variable d'environnement pour le mot de passe
ARG SA_PASSWORD

# Exposer le port SQL Server
EXPOSE 1433

# Commande pour démarrer SQL Server et exécuter le script SQL
CMD /bin/bash -c "/opt/mssql/bin/sqlservr & sleep 20 && /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P '$SA_PASSWORD' -i /scripts/creabaseCICD.sql && echo 'tout est ok' || (echo 'SQL script execution failed' && exit 1)"
