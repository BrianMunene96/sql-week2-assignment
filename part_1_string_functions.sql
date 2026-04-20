-- ============================================
-- Section A: String Functions
-- Name: Brian
-- Date: April 20, 2025
-- ============================================

SET search_path TO nairobi_academy;

-- Q1: Display each student's full name in UPPERCASE and their city in lowercase
SELECT 
    CONCAT(UPPER(first_name), ' ', UPPER(last_name)) AS upper_name,
    LOWER(city) AS lower_city
FROM students;


-- Q2: Show each student's first name and the LENGTH of their first name, ordered from longest to shortest
SELECT 
    first_name,
    LENGTH(first_name) AS name_length
FROM students 
ORDER BY name_length DESC;


-- Q3: Show each subject's name, a short version (first 4 characters) called short_name, and the full subject name length
SELECT 
    subject_name,
    LEFT(subject_name, 4) AS short_name,
    LENGTH(subject_name) AS subject_length
FROM subjects;


-- Q4: Use CONCAT to produce a sentence for each student e.g. 'Amina Wanjiku is in Form 3 and comes from Nairobi'
SELECT 
    CONCAT(first_name, ' ', last_name, ' is in ', class, ' and comes from ', city) AS student_summary
FROM students;
