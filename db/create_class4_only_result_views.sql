\c mot_results

CREATE VIEW tests_count_by_fuel_type
(year, fuel_type, number_of_tests) 
AS
SELECT
CAST(DATE_PART('year',fact_test_class4_result.test_date) AS INT) AS year,
CASE 
	WHEN dim_mdr_fuel_types.fuel_type NOT IN ('Petrol','Diesel','Hybrid Electric (Clean)','Electric') THEN 'Other'
	WHEN dim_mdr_fuel_types.fuel_type = 'Hybrid Electric (Clean)' THEN 'Hybrid Electric'
	ELSE dim_mdr_fuel_types.fuel_type
END AS simplified_fuel_type, 
COUNT(fact_test_class4_result.*) AS number_of_tests
FROM
dim_mdr_fuel_types
INNER JOIN
fact_test_class4_result
ON dim_mdr_fuel_types.type_code = fact_test_class4_result.fuel_type
GROUP BY year, simplified_fuel_type
ORDER BY number_of_tests DESC;

--DROP VIEW tests_count_by_fuel_type;