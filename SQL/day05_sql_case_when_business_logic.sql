---Focuse on applying CASE WHEN logic to translate raw hospital data into meaningful business categories.

/*-----------------------------------------------
Categorize treatments based on cost 
-------------------------------------------------*/
SELECT treatment_id,
       department,
       cost,
CASE
WHEN cost < 10000 THEN 'Low Cost'
WHEN cost BETWEEN 10000 AND 30000 THEN 'Medium Cost'
ELSE 'High Cost'
END AS cost_category
FROM treatments;

/*-----------------------------------------------------
Classify patients into age groups 
----------------------------------------------------*/
SELECT 
patient_id,
age,
CASE
WHEN age < 18 THEN 'Child'
WHEN age BETWEEN 18 AND 60 THEN 'Adult'
ELSE 'Senior'
END AS age_group
FROM patients;

/* -------------------------------------------------
Label doctor workload levels 
-----------------------------------------------------*/
SELECT d.doctor_id,
       d.name,
 COUNT(t.treatment_id) AS total_treatments,
   CASE
     WHEN COUNT(t.treatment_id) < 30 THEN 'Low Workload'
     WHEN COUNT(t.treatment_id) BETWEEN 30 AND 70 THEN 'Medium Workload'
     ELSE 'High Workload'
   END AS workload_level
FROM doctors d
JOIN treatments t
ON d.doctor_id = t.doctor_id
GROUP BY d.doctor_id, d.name;

/* -----------------------------------------------------
Identify repeat vs first-time patients
---------------------------------------------------------*/
SELECT p.patient_id,
 COUNT(t.treatment_id) AS visit_count,
    CASE
     WHEN COUNT(t.treatment_id) = 1 THEN 'First-Time'
     ELSE 'Repeat'
    END AS patient_type
FROM patients p
JOIN treatments t
ON p.patient_id = t.patient_id
GROUP BY p.patient_id;



/* =============================================================
 Business Impact Summary
 ==============================================================
 1. Categorized treatments into cost-based groups (Low,
    Medium, High) to support pricing analysis and
    cost-based reporting.

 2. Classified patients into age groups (Child, Adult,
    Senior) to enable demographic analysis and
    age-specific healthcare planning.

 3. Labeled doctor workload levels based on treatment
    volume to assist in workload balancing and
    staffing decisions.

 4. Identified repeat versus first-time patients to
    analyze patient retention, follow-up care needs,
    and continuity of treatment.
=============================================================== */





