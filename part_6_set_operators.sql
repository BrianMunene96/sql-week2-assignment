-- ============================================
-- Section F: SET Operators
-- Name: Brian
-- Date: April 20, 2025
-- ============================================

-- Q1: UNION - combined list of all UNIQUE cities from both students and patients, ordered alphabetically
SELECT city FROM nairobi_academy.students
UNION
SELECT city FROM city_hospital.patients
ORDER BY city;


-- Q2: UNION ALL - combine student first names and patient full names into one list with a 'source' label column
SELECT first_name AS name, 'Student' AS source
FROM nairobi_academy.students
UNION ALL
SELECT full_name,          'Patient' AS source
FROM city_hospital.patients;


-- Q3: INTERSECT - find cities that appear in BOTH the students table and the patients table
SELECT city FROM nairobi_academy.students
INTERSECT
SELECT city FROM city_hospital.patients;


-- Q4: UNION ALL - combine student names, patient names, and doctor names into one list with source labels, ordered by source then name
SELECT CONCAT(first_name, ' ', last_name) AS name, 'Student' AS source
FROM nairobi_academy.students
UNION ALL
SELECT full_name, 'Patient' AS source
FROM city_hospital.patients
UNION ALL
SELECT full_name, 'Doctor'  AS source
FROM city_hospital.doctors
ORDER BY source, name;
