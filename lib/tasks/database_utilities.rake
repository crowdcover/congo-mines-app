namespace :database_utilities do
  desc "Recreate a sqlite3 dev db from current pg_dump from production."
  
  # This task should only ever be run in a development environment.
  task create_sqlite3_from_pg_dump: :environment do
    # by Mark on Wed May 13 06:15:09 EDT 2015

    # Based on the ideals from this webpage: 
    # http://manuel.manuelles.nl/blog/2012/01/18/convert-postgresql-to-sqlite/

    file_dir      = "/home/mark/backup/pg_dump/"    
    out_file_name = 'congo_mines_import_for_sqlite.sql'
    dev_app_dir   = '/home/mark/dev/congo-mines-app'    
        
    unless Rails.env.development?
      puts "Sorry, but you are running in #{Rails.env}."
      puts "This task should only ever be run in a development environment."
      puts "This task will now exit"  
      exit
    end

    # get the latest sqlite dump file
    sqlite_in_file = Dir.glob("#{file_dir}/*sqlite3.sql").max_by {|f| File.mtime(f)}
    
    # Open a file for re-writing.
    out_file = File.open(out_file_name, 'w') 
    out_file.puts 'BEGIN;'
    
    File.open(sqlite_in_file, "r:bom|utf-8").each_line do |l|
      # Remove line beginning with 'SET'  
      next if l =~ /^SET|setval/o
      
      # The pg_dump generate’s true and false as value’s for the INSERT INTO
      # statements. If we want to import these to SQLite we have to replace 
      # these to ‘t’ and ‘f’.
      #-- These:
      # INSERT INTO table_name VALUES (1, true, false);
      # -- Should be replace to:
      # INSERT INTO table_name VALUES (1, 't', 'f');
      
      l.gsub!('true', "'t'")
      l.gsub!('false', "'f'")   
      
      # remove utf characters
      l.gsub!("\xEF\xBB\xBF".force_encoding("UTF-8"), '')

      out_file.puts l
    end
    out_file.puts 'END;'
    
    # 3. Recreate the development database
    # So now we have fetched the production data from the PostgreSQL database, 
    # we need to recreate the development.sqlite3 database. 
    # For this task I am going to use a 'dev' version of the project. Essentially 
    # a complete checkout of the repo. 
    
    if File.exist?("#{dev_app_dir}/db/development.sqlite3")
      # First, Make a backup..
      File.rename("#{dev_app_dir}/db/development.sqlite3", 
                  "#{dev_app_dir}/db/development.backup.sqlite3")

    end
    # Now run the migration task.
    Rake::Task["db:migrate"].invoke
    
    ##  Import the dump
    # The final step is importing the dump file. To do this we have to 
    # execute the following command 
    #cat congo_mines_import_for_sqlite.sql | sqlite3 db/development.sqlite3
    
   # system("cat #{out_file_name} | sqlite3 #{dev_app_dir}/db/development.sqlite3")
    
    puts "sqlite3 #{dev_app_dir}/db/development.sqlite3 < #{out_file_name}"
    system("sqlite3 #{dev_app_dir}/db/development.sqlite3 < #{out_file_name}")
    
    puts '*' * 40
    puts "Done! The dev sqlite new file is: #{dev_app_dir}/db/development.sqlite3"
    puts "Update, if it didn't update the database run the command below!"
    puts "sqlite3 #{dev_app_dir}/db/development.sqlite3 < #{out_file_name}"

  end

end
