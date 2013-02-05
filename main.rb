require 'pry'
require 'pg'
require 'HTTParty'
require 'json'

conn = PG.connect(:dbname =>'m0vi3z', :host => 'localhost')
conn.exec( "select * from movies" ) do |result|
  result.each do |row|
  end
end

print "Enter a movie: "
title = gets.chomp.downcase.split
movie = HTTParty.get("http://www.omdbapi.com/?t=#{title.join('+')}").gsub("'", "")
movie_hash = JSON(movie)

begin
  sql = "insert into movies (#{movie_hash.keys.join(', ')}) values ('#{movie_hash.values.join('\', \'')}')"
rescue
  puts "Data was bad. Not entered into database."
end

conn.exec(sql)

conn.close