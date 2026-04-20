-- ============================================
-- Section C: Date & Time Functions
-- Name: Brian
-- Date: April 20, 2025
-- ============================================

SET search_path TO nairobi_academy;

-- Q1: Extract the birth year, birth month, and birth day from each student's date_of_birth as three separate columns
SELECT 
    first_name,
    date_of_birth,
    EXTRACT(DAY   FROM date_of_birth) AS birth_day,
    EXTRACT(MONTH FROM date_of_birth) AS birth_month,
    EXTRACT(YEAR  FROM date_of_birth) AS birth_year
FROM students;


-- Q2: Show each student's full name, date_of_birth, and their age in complete years - ordered from oldest to youngest
SELECT 
    CONCAT(first_name, ' ', last_name)    AS student_name,
    date_of_birth,
    EXTRACT(YEAR FROM AGE(date_of_birth)) AS age
FROM students
ORDER BY age DESC;


-- Q3: Display each exam date in this exact format: 'Friday, 15th March 2024' - call the column formatted_date
SELECT 
    result_id,
    TO_CHAR(exam_date, 'FMDay, DDth Month YYYY') AS formatted_date
FROM exam_results;
