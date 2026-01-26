---Pointing out SQL Window functions real use cases

/*-----------------------------------------------------
 Rank Treatments by Cost Within Each Department
-----------------------------------------------------*/
SELECT 
 treatment_id,
 department,
 cost,
 RANK() OVER (
 PARTITION BY department
  ORDER BY cost DESC) AS department_rank
FROM treatments;

/*-----------------------------------------------------
Get Top 3 Most Expensive Treatments Per Department
-----------------------------------------------------*/
SELECT *
FROM (
SELECT 
  treatment_id,
   department,
    cost,
    ROW_NUMBER() OVER (
     PARTITION BY department ORDER BY cost DESC) AS rn
    FROM treatments
) ranked
WHERE rn <= 3;


/*-----------------------------------------------------
Running Total of Treatment Cost by Admission Date
-----------------------------------------------------*/
SELECT 
    admission_date,
    cost,
    SUM(cost) OVER (ORDER BY admission_date) AS running_total_cost
FROM treatments;

/*-----------------------------------------------------
Compare Each Treatment Cost With Previous Treatment
-----------------------------------------------------*/
SELECT 
    treatment_id,
    department,
    cost,
    LAG(cost) OVER (
        PARTITION BY department
        ORDER BY admission_date
    ) AS previous_cost
FROM treatments;

/*-----------------------------------------------------
Highest Cost Treatment per Department (Cleaner than GROUP BY
-----------------------------------------------------*/
SELECT *
FROM (
    SELECT 
        treatment_id,
        department,
        cost,
        ROW_NUMBER() OVER (
            PARTITION BY department
            ORDER BY cost DESC) AS ron
    FROM treatment) t
WHERE ron = 1;

/*=========================================================
              Buisness Impact
===========================================================
1. Identifies the most expensive treatments within
   each department for cost control and auditing

2.Helps management focus on high-cost procedures
   driving department-wise expense

3.Tracks cumulative revenue or expenses over time
   for financial trend analysis

4.Detects sudden cost spikes or drops within
   departments for operational monitoring

5.Pinpoints the single most expensive treatment
   in each department for strategic review

===========================================================*/

