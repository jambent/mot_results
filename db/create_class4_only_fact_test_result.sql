\c mot_results

CREATE TABLE fact_test_class4_result AS
    SELECT * FROM fact_test_result WHERE test_class_id = 4;


ALTER TABLE fact_test_class4_result
ADD corrected_make VARCHAR, 
ADD corrected_model VARCHAR;

UPDATE fact_test_class4_result 
SET corrected_make = make;

UPDATE fact_test_class4_result 
SET corrected_model = model;