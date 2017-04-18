#!/bin/sh
#start solr
bundle exec rake assets:precompile
bundle exec rake sunspot:solr:start
bundle exec rake sunspot:solr:reindex
#start server
bundle exec rails s -p 3000 -b '0.0.0.0'
