-- ============================================
-- Section B: Number Functions
-- Name: Brian
-- Date: April 20, 2025
-- ============================================

SET search_path TO nairobi_academy;

-- Q1: Show each exam result alongside the mark rounded to 1 decimal place, rounded UP using CEIL, and rounded DOWN using FLOOR
SELECT 
    result_id,
    marks,
    ROUND(marks, 1)  AS marks_1decimal,
    CEIL(marks)      AS marks_ceil,
    FLOOR(marks)     AS marks_floor
FROM exam_results;


-- Q2: Calculate summary statistics for exam_results: COUNT, AVG (2 dp), MAX, MIN, and SUM in one query
SELECT
    COUNT(result_id)      AS total_number_results,
    ROUND(AVG(marks), 2)  AS average_mark,
    MAX(marks)            AS highest_mark,
    MIN(marks)            AS lowest_mark,
    SUM(marks)            AS total_marks
FROM exam_results;


-- Q3: Apply a 10% bonus to all marks - show result_id, original marks, and boosted_mark rounded to the nearest whole number
SELECT  
    result_id,
    marks,
    ROUND(marks * 1.1, 0) AS boosted_mark
FROM exam_results;
