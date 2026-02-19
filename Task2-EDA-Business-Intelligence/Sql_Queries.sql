-- =====================================================
-- TASK 2: EDA & BUSINESS INTELLIGENCE
-- BOOK DATASET ANALYSIS
-- =====================================================


-- =====================================================
-- 1. DESCRIPTIVE STATISTICS
-- =====================================================

-- Average Rating
SELECT AVG(rating) AS avg_rating
FROM books_master_cleaned;

-- Average Price
SELECT AVG(price) AS avg_price
FROM books_master_cleaned;

-- Total Reviews
SELECT SUM(reviews_count) AS total_reviews
FROM books_master_cleaned;


-- =====================================================
-- 2. GENRE ANALYSIS
-- =====================================================

-- Total Reviews by Genre
SELECT 
    genre,
    SUM(reviews_count) AS total_reviews
FROM books_master_cleaned
GROUP BY genre
ORDER BY total_reviews DESC;

-- Average Rating by Genre
SELECT 
    genre,
    AVG(rating) AS avg_rating
FROM books_master_cleaned
GROUP BY genre
ORDER BY avg_rating DESC;


-- =====================================================
-- 3. PRICE ANALYSIS
-- =====================================================

-- Average Rating by Price Category
SELECT 
    price_category,
    AVG(rating) AS avg_rating,
    COUNT(*) AS total_books
FROM books_master_cleaned
GROUP BY price_category;


-- =====================================================
-- 4. BOOK LENGTH ANALYSIS
-- =====================================================

-- Average Rating by Length Category
SELECT 
    length_category,
    AVG(rating) AS avg_rating,
    COUNT(*) AS total_books
FROM books_master_cleaned
GROUP BY length_category;


-- =====================================================
-- 5. CORRELATION ANALYSIS
-- =====================================================

-- Correlation between Price and Rating
SELECT 
    (
        SUM((price - (SELECT AVG(price) FROM books_master_cleaned)) *
            (rating - (SELECT AVG(rating) FROM books_master_cleaned)))
    ) /
    (
        SQRT(SUM(POW(price - (SELECT AVG(price) FROM books_master_cleaned), 2))) *
        SQRT(SUM(POW(rating - (SELECT AVG(rating) FROM books_master_cleaned), 2)))
    ) AS price_rating_correlation
FROM books_master_cleaned;

-- Correlation between Reviews and Rating
SELECT 
    (
        SUM((reviews_count - (SELECT AVG(reviews_count) FROM books_master_cleaned)) *
            (rating - (SELECT AVG(rating) FROM books_master_cleaned)))
    ) /
    (
        SQRT(SUM(POW(reviews_count - (SELECT AVG(reviews_count) FROM books_master_cleaned), 2))) *
        SQRT(SUM(POW(rating - (SELECT AVG(rating) FROM books_master_cleaned), 2)))
    ) AS reviews_rating_correlation
FROM books_master_cleaned;


-- =====================================================
-- 6. PUBLISHING TREND
-- =====================================================

-- Books Published Per Year
SELECT 
    YEAR(publishing_date) AS publish_year,
    COUNT(*) AS total_books
FROM books_master_cleaned
GROUP BY publish_year
ORDER BY publish_year;
