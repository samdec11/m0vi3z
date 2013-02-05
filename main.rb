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
movie = HTTParty.get("http://www.omdbapi.com/?t=#{title.join('+')}")
movie_hash = JSON(movie.body)

sql = "insert into movies (#{movie_hash.keys.join(', ')}) values ('#{movie_hash.values.join('\', \'')}')"

conn.exec(sql)

conn.close