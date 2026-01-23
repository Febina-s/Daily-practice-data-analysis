---Using JOINs to analyze relationships between patients,treatments, and doctors

/*--------------------------------------------
Patients treated by multiple doctors
-----------------------------------------------*/
SELECT p.patient_id,
       COUNT(DISTINCT t.doctor_id) AS doctors_involved
FROM patients p
JOIN treatments t
ON p.patient_id = t.patient_id
GROUP BY p.patient_id
HAVING COUNT(DISTINCT t.doctor_id) > 1
ORDER BY doctors_involved DESC;

/*--------------------------------------------
Doctors treating patients from multiple cities
-----------------------------------------------*/

SELECT d.doctor_id,
       d.name,
       COUNT(DISTINCT p.city) AS cities_served
FROM doctors d
JOIN treatments t
ON d.doctor_id = t.doctor_id
JOIN patients p
ON t.patient_id = p.patient_id
GROUP BY d.doctor_id, d.name
HAVING COUNT(DISTINCT p.city) > 1
ORDER BY cities_served DESC;

/*--------------------------------------------
Average treatment cost handled by each doctor
-----------------------------------------------*/
SELECT d.doctor_id,
       d.name,
       AVG(t.cost) AS avg_treatment_cost
FROM doctors d
JOIN treatments t
ON d.doctor_id = t.doctor_id
GROUP BY d.doctor_id, d.name
ORDER BY avg_treatment_cost DESC;

/* ------------------------------------------
Patient-wise treatment details
---------------------------------------------*/
SELECT p.patient_id,
       p.age,
       p.city,
       t.treatment_id,
       t.department,
       t.cost
FROM patients p
JOIN treatments t
ON p.patient_id = t.patient_id;


/* ===========================================================
 Business Impact Summary
 =============================================================
1. Detected repeat visit patterns to understand follow-up
    care and recurrence trends.
2. Evaluated doctor reach across cities to support referral
    planning and specialist allocation.
3. Measured average treatment costs per doctor to evaluate
    efficiency and cost exposure.
4. Combined patient and treatment data to gain a complete
    view of healthcare delivery at the individual level.
============================================================== */
