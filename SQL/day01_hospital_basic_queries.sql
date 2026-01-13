-- Dataset: Hospital Operations Data
-- Tables: patients, treatments, doctors
-- Purpose: Analyze patient admissions and treatment activity

--1. view all doctors record
SELECT *
FROM doctors;

--2. Patient older than 55
SELECT patient_id,name,age,city
FROM patients
WHERE age > 55;

--3. Patient admitted between 2025 and 2026 (1 year data)
SELECT patient_id,admission_date
FROM patients
WHERE admission_date BETWEEN '2025-01-01' AND '2026-01-01';

-- 4. High-cost treatments
SELECT treatment_id, department, cost
FROM treatments
WHERE cost > 100000;

-- Insight:
-- Identifying elderly patients and high-cost treatments helps hospitals
-- allocate resources and plan department-level budgets.

