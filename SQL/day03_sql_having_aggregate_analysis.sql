---Using the same Hospital data set -focusing on aggregating results through having clause

/* ------------------------------------------------------
 Finding cities with more than 100 patient admissions
---------------------------------------------------------*/
SELECT city,
       COUNT(patient_id) AS patient_count
FROM patients
GROUP BY city
HAVING COUNT(patient_id) > 100
ORDER BY patient_count DESC;

/* --------------------------------------------------
Departments with average treatment cost above 20,000 
------------------------------------------------------*/
SELECT department,
       AVG(cost) AS avg_treatment_cost
FROM treatments
GROUP BY department
HAVING AVG(cost) > 20000
ORDER BY avg_treatment_cost DESC;

/* --------------------------------------------------------
Doctors with high treatment workload 
------------------------------------------------------------*/
SELECT doctor_id,
       name,
       COUNT(treatment_id) AS total_treatments
FROM treatments
GROUP BY doctor_id, name
HAVING COUNT(treatment_id) > 50
ORDER BY total_treatments DESC;

/* ----------------------------------------------------
Departments with total treatment cost above 1,000,000
-------------------------------------------------------*/
SELECT department,
       SUM(cost) AS total_cost
FROM treatments
GROUP BY department
HAVING SUM(cost) > 1000000
ORDER BY total_cost DESC;



/* =========================================================
 Business Impact Summary
 =============================================================
 1. Highlighted cities with heavy patient inflow to
    improve outreach and capacity planning.

 2. Isolated departments with expensive average treatments
    to evaluate pricing, efficiency, and service optimization.

 3. Flagged doctors with unusually high workloads to
    enable fair resource distribution and burnout prevention.

 4. Identified high-cost departments exceeding budget
    thresholds to support financial monitoring.
================================================================ */
