#!/bin/sh
#repair solr volume
chown -R solr:solr /app/solr
rm -rf /app/solr/pids
#start solr
bundle exec rake sunspot:solr:start
#start server
bundle exec rails s -p 3000 -b '0.0.0.0'
