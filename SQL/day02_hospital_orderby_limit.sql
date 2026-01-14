-- Business-focused analysis using GROUP BY, ORDER BY, and LIMIT

/* ------------------------------------
 TOP 5 Depatments by total treatment cost
----------------------------------------*/
SELECT departments,
SUM(cost) as total_cost
FROM departments
GROUP BY departments
ORDER BY total_cost DESC
LIMIT 5;

/*-----------------------------------------------
List of doctors by number of threatment handled
-----------------------------------------------*/
SELECT doctor_id,name,
COUNT(treatment_id) as total_treatment
FROM treatments
GROUP BY doctor_id,name
ORDER BY total_treatment DESC;

/*-----------------------------------------------
TOP 10 buiest admission date
-----------------------------------------------*/
SELECT admission_date,
COUNT(patient_id) AS admissions
FROM patients
GROUP BY admission_date
ORDER BY admissions DESC
LIMIT 10;

/*--------------------------------------------------
Departments have the highest average treatment cost
----------------------------------------------------*/
SELECT department,
AVG(cost) AS avg_treatment_cost
FROM treatments
GROUP BY department
ORDER BY avg_treatment_cost DESC
LIMIT 5;


/* =========================================================
 Business Impact Summary
 =========================================================
 1. Identified departments contributing the highest total
    treatment costs, enabling hospital management to
    prioritize cost-control and budget allocation.

 2. Highlighted doctors with the highest treatment volumes,
    supporting workload balancing and performance evaluation.

 3. Detected peak admission dates to help optimize staffing,
    bed availability, and operational planning.

 4. Analyzed departments with the highest average treatment
    costs to uncover high-value procedures and improve
    pricing or efficiency strategies.
========================================================= */
