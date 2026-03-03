---The ROLLUP operator in sql is used to create the subtotals and grandtotals in query results
----The CUBE operator is used to generate multidimentional summary of data 

/*-----------------------------------------------------
Generate total treatment revenue by department and doctor 
along with department-level summary.
-----------------------------------------------------*/

SELECT
    department,
    doctor_id,
    SUM(cost) AS total_revenue
FROM treatments
GROUP BY ROLLUP (department, doctor_id);

/*-----------------------------------------------------
Generate revenue totals separately by department 
and by doctor using a single query.
-----------------------------------------------------*/

SELECT
    department,
    doctor_id,
    SUM(cost) AS total_revenue
FROM treatments
GROUP BY GROUPING SETS (
    (department),
    (doctor_id)
);

/*-----------------------------------------------------
Generate revenue analysis for all possible combinations 
  of department and doctor.
-----------------------------------------------------*/
SELECT
    department,
    doctor_id,
    SUM(cost) AS total_revenue
FROM treatments
GROUP BY CUBE (department, doctor_id);




/*==================================================================
              Buisness Impact
====================================================================
1. Provides hierarchical revenue summaries enabling 
managementto analyze doctor-level performance within each department.

2.Eliminates the need for multiple aggregation queries by combining 
independent summary views into one optimized analytical report.

3.Supports multi-dimensional revenue analysis useful for 
advanced business intelligence dashboards.
===========================================================*/
