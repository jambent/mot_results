
\c mot_results

WITH fact_test_result_duplicates AS (
	SELECT test_id, vehicle_id, test_date, test_class_id, test_type, test_result,
    test_mileage, postcode_area, make, model, colour, fuel_type, cylinder_capacity,
    first_use_date, COUNT(*) AS duplicate_count
	FROM fact_test_result
	GROUP BY test_id, vehicle_id, test_date, test_class_id, test_type, test_result,
    test_mileage, postcode_area, make, model, colour, fuel_type, cylinder_capacity, first_use_date
	)
SELECT * FROM fact_test_result_duplicates WHERE
duplicate_count > 1
;

-- NOTE: fact_test_item does not have a primary key; there are duplicates in that table