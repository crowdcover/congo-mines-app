namespace :database_utilities do
  desc "TODO"
  
  # This task should only ever be run in a development environment.
  task create_sqlite3_from_pg_dump: :environment do
    #Rails.env.production?
    
    # Based on the ideals from this webpage: 
    # http://manuel.manuelles.nl/blog/2012/01/18/convert-postgresql-to-sqlite/
    
    unless Rails.env.development?
      puts "Sorry, but you are running in #{Rails.env}."
      puts "This task should only ever be run in a development environment."
      puts "This task will now exit"  
      exit
    end

    file_dir = "/home/mark/backup/pg_dump/"    
    out_file_name = 'congo_mines_import_for_sqlite.sql'

    dev_app_dir = '/home/mark/dev/congo-mines-app'
    
    # get the latest sqlite dump file
    sqlite_in_file = Dir.glob("#{file_dir}/*sqlite3.sql").max_by {|f| File.mtime(f)}
    
    # Open a file for re-writing.
    out_file = File.open(out_file_name, 'w') 
    out_file.puts 'BEGIN;'
    
    File.open(file_name).each_line do |l|
      # Remove line beginning with 'SET'  
      next if l =~ /^SET/o
    end
    out_file.puts 'END'
    
    # 3. Recreate the development database
    # So now we have fetched the production data from the PostgreSQL database, 
    # we need to recreate the development.sqlite3 database. 
    # For this task I am going to use a 'dev' version of the project. Essentially 
    # a complete checkout of the repo. 
    
    # First, Make a backup..
    File.rename("#{dev_app_dir}/development.sqlite3", "#{dev_app_dir}/db/development.backup.sqlite3")

    # Now run the migration task.
    #Rake::Task["db:migrate"].invoke
  end

end
