require 'sinatra'
require 'sqlite3'

get '/' do
  erb :index
end


def country_for_id(id)
  begin
    db = SQLite3::Database.open "gap_data.db"
    rs = db.get_first_row "SELECT name FROM country WHERE id = ?", id 
    return rs.first
  rescue SQLite3::Exception => e 
    puts "Exception occured"
    puts e
  ensure
    db.close if db
  end
end

def country_count()
  begin
    db = SQLite3::Database.open "gap_data.db"
    rs = db.get_first_row "SELECT COUNT(name) FROM country" 
    return rs.first
  rescue SQLite3::Exception => e 
    puts "Exception occured"
    puts e
  ensure
    db.close if db
  end
end

def impact_for_id(id)
  begin
    db = SQLite3::Database.open "gap_data.db"
    rs = db.execute "SELECT users FROM impact WHERE \"country id\" = ? ORDER BY users DESC LIMIT 0,10", id 
    return rs.collect {|x| x.first}
  rescue SQLite3::Exception => e 
    puts "Exception occured"
    puts e
  ensure
    db.close if db
  end
end

def top5_for_id(id)
  begin
    db = SQLite3::Database.open "gap_data.db"
    rs = db.execute "SELECT url FROM sites JOIN (SELECT \"website id\" FROM impact WHERE \"country id\" = ? ORDER BY users DESC LIMIT 0,5) WHERE \"website id\" = sites.id", id 
    return rs.collect {|x| x.first}
  rescue SQLite3::Exception => e 
    puts "Exception occured"
    puts e
  ensure
    db.close if db
  end
end