# Task 1 – Data Immersion & Wrangling

## Objective
To understand, assess, clean, and transform the Best Selling Books dataset into an analysis-ready format using MySQL.

---

## Dataset Overview
- Source: Kaggle – Best Selling Books Dataset
- Years Combined: 2023, 2024, 2025
- Initial Records: 299
- Final Records After Cleaning: 298
- Database: MySQL

---

## Step 1 – Data Access & Familiarization

- Verified total records
- Reviewed sample rows
- Analyzed table structure
- Identified missing values
- Checked duplicate records
- Detected formatting inconsistencies

---

## Step 2 – Data Quality Assessment

### Findings:
- 1 exact duplicate record removed
- 191 missing values in `reading_age`
- 4 missing values in `print_length`
- `rating` contained numeric + text
- `price` contained "$"
- `publishing_date` had multiple formats

---

## Step 3 – Data Cleaning & Transformation

### Transformations Performed:

- Removed "#" from `id`
- Extracted numeric rating value
- Removed "$" from `price`
- Converted `reviews_count` to INT
- Converted `print_length` to INT
- Standardized `publishing_date` to DATE format
- Preserved valid multi-year duplicate entries
- Removed exact duplicate row

---

## Final Output

Final Cleaned Table:
`books_master_cleaned`

Total Records: 298

The dataset is now structured and ready for further analytical tasks.
