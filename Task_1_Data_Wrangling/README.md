# Best Selling Books – Task 1: Data Immersion & Wrangling

## Objective

The objective of this task is to understand, assess, clean and transform a Best Selling Books dataset into an analysis-ready format using MySQL.

---

## Dataset Information

Source: Kaggle – Best Selling Books Dataset  
Years Combined: 2023, 2024, 2025  
Initial Records: 299  
Final Records After Cleaning: 298  

Database Used: MySQL  
Raw Table: books_master_raw  
Cleaned Table: books_master_cleaned  

---

## Step 1: Data Access & Familiarization

- Checked total records
- Reviewed sample rows
- Analyzed column structure
- Identified missing values
- Checked duplicate records
- Identified formatting inconsistencies

---

## Step 2: Data Quality Assessment

### Findings:

- 1 exact duplicate record found and removed
- 191 missing values in reading_age
- 4 missing values in print_length
- rating column contained numeric + text
- price column contained "$"
- publishing_date had multiple formats

---

## Step 3: Data Cleaning & Transformation

Transformations performed:

- Removed "#" from id
- Extracted numeric rating
- Removed "$" from price
- Converted reviews_count to INT
- Converted print_length to INT
- Standardized publishing_date to DATE format
- Preserved valid multi-year duplicates
- Removed exact duplicate

---

## Final Output

A cleaned, structured dataset ready for analysis:
books_master_cleaned
