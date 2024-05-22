DROP TABLE IF EXISTS shelves_books;
DROP TABLE IF EXISTS books_genres;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS shelves;

CREATE TABLE shelves(
  id serial PRIMARY KEY,
  name text UNIQUE NOT NULL
);

CREATE TABLE books(
  id serial PRIMARY KEY,
  title text NOT NULL,
  author text NOT NULL,
  book_added timestamp NOT NULL DEFAULT NOW(),
  number_of_pages int NOT NULL,
  completed boolean NOT NULL DEFAULT FALSE
);

CREATE TABLE genres(
  id serial PRIMARY KEY,
  genre text NOT NULL UNIQUE 
);

CREATE TABLE books_genres(
  id serial PRIMARY KEY,
  book_id int NOT NULL
    REFERENCES books(id),
  genre_id int NOT NULL
    REFERENCES genres(id)
);


CREATE TABLE shelves_books(
  id serial PRIMARY KEY,
  shelf_id int NOT NULL
    REFERENCES shelves(id),
  book_id int NOT NULL
    REFERENCES books(id),
  UNIQUE(shelf_id, book_id)
);
