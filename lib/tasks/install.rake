desc "Sets up the data for the app"
task :install do
  if File.exists?('afg_std.sql')
    puts "Loading the war diaries into the database..."
    `sqlite3 db/development.sqlite3 < afg_std.sql`
    puts "Prepping the database..."
    `sqlite3 db/development.sqlite3 < db/set_id.sql`
    puts "Starting up the search engine..."
    `rake sunspot:solr:start`
    puts "Indexing the war diaries in the search engine..."
    `rake sunspot:reindex`
    puts "Shutting down search engine..."
    `rake sunspot:solr:stop`
    puts "Ready!  Type 'rake sunspot:solr:start' to start the search engine, './script/server' to start the server, and view it at http://localhost:3000"
    puts "Type Control-C to stop the server, then rake sunspot:solr:stop to shut down the search engine."
  else
    puts "Please download the SQL formatted war diaries from Wikileaks."
    puts "You can find a link here:  http://wikileaks.org/wiki/Afghan_War_Diary,_2004-2010"
    puts "Then unzip it, and move the afg_std.sql file into this directory."
  end
end
