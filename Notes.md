# Notes

## Docker


### Lancer mariadb

    docker run --name mariadb -d -e MYSQL_ROOT_PASSWORD=mariadb mariadb


### Lancer apache et le lier à mariadb 

[infos](https://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-apache.html)

**Note**:

Il est possible de préciser des variables dès le lancement du container mais aussi une fois lancé dans /opt/docker/etc/php/php.ini.

    display_errors = On

On peut aussi indiquer cette option dans un script php pour "forcer" la valeur.

    ini_set ( string $varname , string $newvalue ) : string
    ini_set('display_errors', '1');

    docker run --name webdevops --rm -ti -p 8080:80  --link mariadb -e PHP_DISPLAY_ERRORS=On -v "C:\Users\acs.PORT-0308\dev\ACS-Projets\gestion-randonnees":/app   webdevops/php-apache


### Lancer phpmyadmin

**Penser à indiquer l'hote de mariadb !!**

[infos](https://hub.docker.com/r/phpmyadmin/phpmyadmin)

    docker run --name pma -d --link mariadb:db -e MYSQL_ROOT_PASSWORD=mariadb -e PMA_HOST=dbhost -p 8081:80 phpmyadmin/phpmyadmin

### Dump de la bdd

    docker exec mariadb sh -c "exec mysqldump -A -uroot -pmariadb" > dump.sql

### Importation de la bdd depuis l'hote

**Tout importer**

    docker exec mariadb sh -c "mysql -u root -p "  < dump.sql

**Importer une seule base de données**

    docker exec mariadb sh -c "mysql -u rooot -p nomdemabase.sql" < nomdemabase.sql


## Requetes SQL

**Ajouter une region**

    INSERT INTO region (nom) VALUES ('Rif')

