# README

* Ruby version
 ruby 2.6.4

* Database creation
 docker-compose exec app bundle exec rails db:create 

* Database initialization
 docker-compose exec app bundle exec bundle exec ridgepole -c config/database.yml -E development --apply -f db/Schemafile

* webpacker build
docker-compose exec app bundle exec bin/webpack
