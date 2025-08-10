CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;
CREATE TABLE authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);
CREATE TABLE books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author_id INT,
  published_year YEAR,
  copies INT DEFAULT 1,
  FOREIGN KEY (author_id) REFERENCES authors(author_id)
);
CREATE TABLE members (
  member_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE,
  join_date DATE NOT NULL DEFAULT (CURDATE())
);

CREATE TABLE borrowings (
  borrow_id INT AUTO_INCREMENT PRIMARY KEY,
  book_id INT NOT NULL,
  member_id INT NOT NULL,
  borrow_date DATE DEFAULT CURRENT_DATE,
  return_date DATE,
  returned BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (book_id) REFERENCES books(book_id),
  FOREIGN KEY (member_id) REFERENCES members(member_id)
);
CREATE TABLE borrowings (
  borrow_id INT AUTO_INCREMENT PRIMARY KEY,
  book_id INT NOT NULL,
  member_id INT NOT NULL,
  borrow_date DATE NOT NULL DEFAULT (CURDATE()),
  return_date DATE,
  returned BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (book_id) REFERENCES books(book_id),
  FOREIGN KEY (member_id) REFERENCES members(member_id)
);
INSERT INTO authors (name) VALUES 
('George Orwell'), 
('J.K. Rowling'), 
('R.K. Narayan');

INSERT INTO books (title, author_id, published_year, copies) VALUES
('1984', 1, 1949, 3),
('Animal Farm', 1, 1945, 2),
('Harry Potter and the Sorcerer''s Stone', 2, 1997, 5),
('Malgudi Days', 3, 1943, 2);

INSERT INTO members (name, email) VALUES
('Asha Mehta','asha@example.com'),
('Rohan Kumar','rohan@example.com');

INSERT INTO borrowings (book_id, member_id, borrow_date, returned) VALUES
(1,1,'2025-08-01',FALSE),
(3,2,'2025-07-28',TRUE);
