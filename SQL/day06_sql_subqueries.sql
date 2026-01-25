----This file is maily focused on various subqueries usages and how we solves the problem based on that.
----From my learnings now i have a clear vision about different positions where "SUBQUERIES" can be used particularly in (SELECT,FROM & WHERE)


/*--------------------------------------------------------
Compare each treatment cost with the highest treatment cost
-----------------------------------------------------------*/
--subquery used in SELECT

SELECT treatment_id,
       department,
       cost,
       (SELECT MAX(cost) FROM treatments) AS highest_cost
FROM treatments;

/*-------------------------------------------------------------
Total treatment cost per patient using a derived table
---------------------------------------------------------------*/
---subquery used in FROM

SELECT patient_id,
       total_cost
FROM (
    SELECT patient_id,
           SUM(cost) AS total_cost
    FROM treatments
    GROUP BY patient_id
) AS patient_summary
ORDER BY total_cost DESC;

/*----------------------------------------------------
Doctors who treated patients from more than one city 
------------------------------------------------------*/
--subquery used in WHERE

SELECT doctor_id,
       name
FROM doctors
WHERE doctor_id IN (
    SELECT t.doctor_id
    FROM treatments t
    JOIN patients p
    ON t.patient_id = p.patient_id
    GROUP BY t.doctor_id
    HAVING COUNT(DISTINCT p.city) > 1
);

/* ---------------------------------------------------------
Doctors who never handled treatments above 30,000
-------------------------------------------------------------*/
SELECT doctor_id,
       name
FROM doctors
WHERE doctor_id NOT IN (
    SELECT doctor_id
    FROM treatments
    WHERE cost > 30000
);


/* =========================================================
 Business Impact Summary
 =========================================================
 1. Provided visibility into how individual treatment costs
    compare against the highest treatment recorded, helping
    identify relatively expensive procedures.

 2. Summarized total treatment cost at the patient level to
    support patient-level cost profiling and prioritization.

 3. Identified doctors treating patients from multiple cities,
    highlighting wider referral reach and operational exposure

4. Segmented doctors based on exposure to high-cost
    treatments to understand care specialization.

================================================================*/
