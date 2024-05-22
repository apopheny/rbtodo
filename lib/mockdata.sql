INSERT INTO shelves(name)
VALUES
('Books to Read'),
('Sci-Fi Books'),
('Nonfiction Books');

INSERT INTO books
(title, author, number_of_pages, completed)
VALUES
('Dune', 'Frank Herbert', 350, True),
('The Catcher in the Rye', 'J. D. Salinger', 180, True),
('Man''s Search For Meaning', 'Victor Frankl', 200, DEFAULT),
('Burning Chrome', 'William Gibson', 280, DEFAULT),
('Foundation', 'Isaac Asimov', 320, DEFAULT),
('Atomic Habits', 'James Clear', 220, True),
('Digital Minimalism', 'Cal Newport', 175,  True);

INSERT INTO genres
(genre)
VALUES
('Sci-Fi'),
('Fantasy'),
('Action Adventure'),
('Historical Fiction'),
('Literary'),
('Self-Help'),
('Productivity'),
('Inspirational'),
('Biography'),
('History'),
('Philosophy'),
('Religion');

INSERT INTO books_genres 
(book_id, genre_id)
VALUES
(1, 1),(1, 3),(1, 12),
(2, 3),
(3, 6),(3, 8),(3, 10),
(4, 1),
(5, 1),
(6, 6),(6, 7),
(7, 6),(7, 7);


INSERT INTO shelves_books 
(book_id, shelf_id)
VALUES
(1, 1),(1, 2),
(2, 1),
(3, 1),(3, 3),
(4, 1),(4, 2),
(5, 1),(5, 2),
(6, 3),
(7, 3);