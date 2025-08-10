SELECT * FROM books;
SELECT title, published_year 
FROM books
WHERE published_year > 1950
ORDER BY published_year DESC;
SELECT b.title, a.name AS author
FROM books b
JOIN authors a ON b.author_id = a.author_id;

SELECT a.name, COUNT(b.book_id) AS books_count
FROM authors a
LEFT JOIN books b ON a.author_id = b.author_id
GROUP BY a.name;

SELECT m.name, bk.title, br.borrow_date
FROM borrowings br
JOIN members m ON br.member_id = m.member_id
JOIN books bk ON br.book_id = bk.book_id
WHERE br.returned = FALSE;

SELECT title 
FROM books
WHERE author_id IN (
  SELECT author_id FROM authors WHERE name = 'George Orwell'
);

UPDATE books 
SET copies = copies - 1
WHERE book_id = 1;

DELETE FROM members 
WHERE member_id = 2;

START TRANSACTION;
INSERT INTO borrowings (book_id, member_id, borrow_date, returned) 
VALUES (2, 1, CURRENT_DATE, FALSE);
UPDATE books SET copies = copies - 1 WHERE book_id = 2;
COMMIT;
