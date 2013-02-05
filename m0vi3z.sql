create table movies
  (
    id serial2 primary key,
    title varchar(50) not null,
    year varchar(4),
    rated varchar(5),
    released varchar(11),
    runtime varchar(11),
    genre varchar(50),
    director varchar(50),
    writer varchar(50),
    actors text,
    plot text,
    poster text,
    imdbRating varchar(4),
    imdbVotes varchar(8),
    imdbID varchar(11),
    response varchar(5)
  );