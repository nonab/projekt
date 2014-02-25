Opis uruchomienia projektu:

1. Pobierz composera
curl -s https://getcomposer.org/installer | php

2. Pobierz framework symfony
php composer.phar create-project symfony/framework-standard-edition /twoj/katalog/webroot/Symfony 2.4.*

3. Znajdujac sie w katalogu '/twoj/katalog/webroot/Symfony' sklonuj to repozytorium
git clone https://github.com/nonab/projekt

4. Utworz baze danych (moze byc wymagana edycja pliku app/config/parameters.yml)
php app/console doctrine:database:create

5. Zaimportuj plik migration.sql (moze byc konieczne przelaczenie sie na uzytkownika postgres "su postgres")
psql symfony < migration.sql

6. Jesli wszystko przebieglo pomyslnie aplikacja powinna byc dostepna pod adresem:
http://localhost/Symfony/web/app.php/
