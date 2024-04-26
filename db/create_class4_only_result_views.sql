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



CREATE VIEW first_time_pass_percentage_by_reg_year
(registration_year, vehicles_from_registration_year, first_time_pass_percentage) 
AS (
	WITH passed_first_time AS (
		SELECT CAST(DATE_PART('year',fact_test_class4_result.first_use_date) AS INT) AS registration_year,
		COUNT(*) AS first_time_pass_count
		FROM fact_test_class4_result
		WHERE test_result = 'P' AND test_type = 'NT'
		GROUP BY CAST(DATE_PART('year',fact_test_class4_result.first_use_date) AS INT)
	),
	first_registered_count_by_year AS (
		SELECT CAST(DATE_PART('year',fact_test_class4_result.first_use_date) AS INT) AS registration_year,
		COUNT(*)
		FROM fact_test_class4_result
		GROUP BY CAST(DATE_PART('year',fact_test_class4_result.first_use_date) AS INT)
	) 
	SELECT first_registered_count_by_year.registration_year,
	first_registered_count_by_year.count AS vehicles_from_registration_year,
	ROUND((cast(passed_first_time.first_time_pass_count AS DECIMAL) /cast(first_registered_count_by_year.count AS DECIMAL) * 100),2) AS percentage_of_vehicles_with_first_time_pass
	FROM
	passed_first_time
	RIGHT OUTER JOIN
	first_registered_count_by_year
	ON passed_first_time.registration_year = first_registered_count_by_year.registration_year
	WHERE first_registered_count_by_year.registration_year >= '1990'
	ORDER BY first_registered_count_by_year.registration_year DESC
);

--DROP VIEW tests_count_by_fuel_type;