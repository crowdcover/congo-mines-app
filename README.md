# congo-mines-app
Rails app for the CongoMines project

## Install

`bundle install`

`bundle exec rake db:migrate`

## Running

Start solr (or search and admin will not work)

`bundle exec rake sunspot:solr:start`

`bundle exec rake sunspot:solr:reindex`

Start the web server

`bundle exec rails s -p 3000 -b '0.0.0.0'`

to stop solr

`bundle exec rake sunspot:solr:stop`

## Production Deployment

### Docker

Quay.io is configured to build any new version tag

[![Docker Repository on Quay](https://quay.io/repository/maphubs/congomines/status "Docker Repository on Quay")](https://quay.io/repository/maphubs/congomines)

## Upgrading

### After upgrading in production:

Run migrations

`bundle exec rake db:migrate`

Run asset precompile (if dependencies have changed)

`bundle exec rake assets:precompile`

