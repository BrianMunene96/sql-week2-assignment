-- ============================================
-- Section D: SQL JOINS
-- Name: Brian
-- Date: April 20, 2025
-- ============================================

SET search_path TO city_hospital;

-- Q1: INNER JOIN - show each appointment with the patient's full name, doctor's full name, appointment date, and diagnosis
SELECT  
    a.appointment_id,
    a.appt_date,
    pt.full_name  AS patient_name,
    doc.full_name AS doctor_name,
    a.diagnosis
FROM appointments a
INNER JOIN patients pt
    ON a.patient_id = pt.patient_id
INNER JOIN doctors doc
    ON a.doctor_id = doc.doctor_id;


-- Q2: LEFT JOIN - show ALL patients; if they have an appointment show the date and diagnosis, otherwise NULL
SELECT 
    pt.full_name     AS patient_name,
    a.appointment_id,
    a.appt_date,
    a.diagnosis
FROM patients pt
LEFT JOIN appointments a 
    ON pt.patient_id = a.patient_id;


-- Q3: RIGHT JOIN - show ALL doctors; if they have seen a patient show the patient name, otherwise NULL
SELECT  
    doc.full_name     AS doctor_name,
    doc.specialisation,
    pt.full_name      AS patient_name,
    a.appointment_id
FROM appointments a
RIGHT JOIN doctors doc 
    ON a.doctor_id = doc.doctor_id
LEFT JOIN patients pt 
    ON pt.patient_id = a.patient_id;


-- Q4: LEFT JOIN + WHERE IS NULL - find patients who have NEVER had an appointment; show full_name and city
SELECT  
    pt.full_name AS patient_name,
    pt.city
FROM patients pt 
LEFT JOIN appointments a
    ON pt.patient_id = a.patient_id
WHERE a.appointment_id IS NULL;


-- Q5: Three-table INNER JOIN - show each appointment with patient name, doctor name, and medicine prescribed
SELECT  
    a.appointment_id,
    pt.full_name  AS patient_name,
    doc.full_name AS doctor_name,
    p.medicine_name 
FROM appointments a 
INNER JOIN doctors doc 
    ON a.doctor_id = doc.doctor_id
INNER JOIN patients pt 
    ON a.patient_id = pt.patient_id
INNER JOIN prescriptions p 
    ON a.appointment_id = p.appointment_id;
