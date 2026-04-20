-- ============================================
-- Section E: Window Functions
-- Name: Brian
-- Date: April 20, 2025
-- ============================================

SET search_path TO nairobi_academy;

-- Q1: ROW_NUMBER() - assign a unique rank to each exam result ordered from highest mark to lowest
SELECT  
    result_id,
    student_id,
    marks,
    ROW_NUMBER() OVER (ORDER BY marks DESC) AS row_num
FROM exam_results;


-- Q2: RANK() vs DENSE_RANK() - show both side by side on exam results ordered by marks descending
SELECT  
    result_id,
    student_id,
    marks,
    RANK()       OVER (ORDER BY marks DESC) AS rank_num,
    DENSE_RANK() OVER (ORDER BY marks DESC) AS dense_rank_num
FROM exam_results;


-- Q3: NTILE(3) - divide all exam results into 3 performance bands (1 = top, 2 = middle, 3 = bottom)
SELECT  
    result_id,
    marks,
    NTILE(3) OVER (ORDER BY marks DESC) AS band
FROM exam_results;


-- Q4: AVG() OVER(PARTITION BY student_id) - show each result alongside that student's personal average mark
SELECT  
    student_id,
    marks,
    ROUND(AVG(marks) OVER (PARTITION BY student_id), 2) AS student_avg
FROM exam_results;


-- Q5: LAG() - show each exam result alongside the previous result's marks and calculate the improvement
SELECT 
    student_id,
    marks,
    LAG(marks) OVER (PARTITION BY student_id ORDER BY marks ASC)                    AS previous_mark,
    marks - LAG(marks) OVER (PARTITION BY student_id ORDER BY marks ASC)            AS improvement
FROM exam_results;
