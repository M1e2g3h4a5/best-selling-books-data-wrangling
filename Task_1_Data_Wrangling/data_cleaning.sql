-- step 1: REMOVE EXACT DUPLICATE

CREATE TABLE books_master_raw_dedup AS 
SELECT DISTINCT *
FROM books_master_raw;

DROP TABLE books_master_raw;

RENAME TABLE books_master_raw_dedup TO books_master_raw;

-- STEP 2: CREATE CLEAN TABLE

CREATE TABLE books_master_cleaned (
    id INT,
    book_name VARCHAR(500),
    author VARCHAR(255),
    rating DECIMAL(2,1),
    reviews_count INT,
    form VARCHAR(50),
    price DECIMAL(6,2),
    reading_age VARCHAR(50),
    print_length INT,
    publishing_date DATE,
    genre VARCHAR(150)
);

-- STEP 3: INSERT CLEANED DATA 

INSERT INTO books_master_cleaned
SELECT
    CAST(REPLACE(id, '#', '') AS UNSIGNED) AS id,
    TRIM(book_name) AS book_name,
    TRIM(author) AS author,
    CAST(SUBSTRING_INDEX(rating, ' ', 1) AS DECIMAL(2,1)) AS rating,
    CAST(reviews_count AS UNSIGNED) AS reviews_count,
    TRIM(form) AS form,
    CAST(REPLACE(price, '$', '') AS DECIMAL(6,2)) AS price,
    NULLIF(TRIM(reading_age), '') AS reading_age,
    CASE
        WHEN print_length = '' OR print_length IS NULL THEN NULL
        ELSE CAST(print_length AS UNSIGNED)
    END AS print_length,
    CASE
        WHEN publishing_date LIKE '%/%/%'
            THEN STR_TO_DATE(publishing_date, '%d/%m/%Y')
        ELSE STR_TO_DATE(TRIM(publishing_date), '%M %d, %Y')
    END AS publishing_date,
    TRIM(genre) AS genre
FROM books_master_raw;

-- STEP 4: VALIDATION 

SELECT
count(*)
FROM books_master_cleaned;

DESCRIBE books_master_cleaned;
