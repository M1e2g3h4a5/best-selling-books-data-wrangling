-- STEP 1: Data Access & Familiarization

-- Total Records
SELECT COUNT(*) AS total_rows
FROM books_master_raw;

-- Sample Records
SELECT *
FROM books_master_raw
LIMIT 10;

-- Column Structure
DESCRIBE books_master_raw;


-- STEP 2: Data Quality Assessment

-- Missing Values Check
SELECT 
    SUM(book_name IS NULL OR book_name = '') AS missing_book_name,
    SUM(author IS NULL OR author = '') AS missing_author,
    SUM(rating IS NULL OR rating = '') AS missing_rating,
    SUM(reviews_count IS NULL OR reviews_count = '') AS missing_reviews,
    SUM(price IS NULL OR price = '') AS missing_price,
    SUM(reading_age IS NULL OR reading_age = '') AS missing_reading_age,
    SUM(print_length IS NULL OR print_length = '') AS missing_print_length,
    SUM(publishing_date IS NULL OR publishing_date = '') AS missing_publishing_date
FROM books_master_raw;

-- Exact Duplicate Check
SELECT COUNT(*) FROM books_master_raw;

SELECT COUNT(*)
FROM (
    SELECT DISTINCT *
    FROM books_master_raw
) AS temp;

-- Logical Duplicate Check
SELECT book_name, author, COUNT(*)
FROM books_master_raw
GROUP BY book_name, author
HAVING COUNT(*) > 1;

-- Rating Format Check
SELECT DISTINCT rating
FROM books_master_raw;

-- Price Format Check
SELECT DISTINCT price
FROM books_master_raw;

-- Date Format Check
SELECT DISTINCT publishing_date
FROM books_master_raw;
