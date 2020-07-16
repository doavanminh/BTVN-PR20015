CREATE TABLE IF NOT EXISTS books (
    id INT AUTO_INCREMENT,
    author_id VARCHAR(50),
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS authors (
    id INT AUTO_INCREMENT,
    name VARCHAR(50),
    birthday VARCHAR(50),
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS readers (
    id INT AUTO_INCREMENT,
    name VARCHAR(50),
    birthday VARCHAR(50),
    gender BIT,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS borrows (
    id INT AUTO_INCREMENT,
    reader_id INT,
    book_id INT,
    PRIMARY KEY (id)
);

--a. List the books have been borrowed more than 10 times in 2011
SELECT
    borrows.book_id, books.name
FROM
    books
        INNER JOIN
    borrows ON borrows.book_id = books.id
WHERE
    YEAR(time) = 2011
GROUP BY borrows.book_id, books.name
HAVING COUNT(*) > 10
