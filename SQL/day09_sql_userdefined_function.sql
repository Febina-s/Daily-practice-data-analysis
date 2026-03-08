---User defined function extends SQL's capabalities,enabling complex customes calculations 

/*-------------------------------------------------------------------------------------------
Create a user-defined function to calculate the total treatment cost for a given patient.
---------------------------------------------------------------------------------------------*/

CREATE FUNCTION get_total_patient_cost(p_id INT)
RETURNS NUMERIC AS $$
DECLARE
    total_cost NUMERIC;
BEGIN
    SELECT SUM(cost)
    INTO total_cost
    FROM treatments
    WHERE patient_id = p_id;

    RETURN total_cost;
END;
$$ LANGUAGE plpgsql;

-------------EXAMPLE USAGE------------
          
SELECT get_total_patient_cost(101);

/*-------------------------------------------------------------------------------------------
Create a user-defined function to count the number of treatments handled by a specific doctor.
---------------------------------------------------------------------------------------------*/

CREATE FUNCTION get_doctor_treatment_count(d_id INT)
RETURNS INT AS $$
DECLARE
    treatment_count INT;
BEGIN
    SELECT COUNT(treatment_id)
    INTO treatment_count
    FROM treatments
    WHERE doctor_id = d_id;

    RETURN treatment_count;
END;
$$ LANGUAGE plpgsql;


-------------EXAMPLE USAGE------------

SELECT get_doctor_treatment_count(12);




/*==================================================================================
              Buisness Impact
=====================================================================================
1. Allows quick retrieval of total treatment expenses for individual patients, 
supporting billing analysis and patient cost tracking.

2.Helps monitor doctor workload and identify highly activedoctors for operational 
planning and performance evaluation.
======================================================================================*/

