DROP DATABASE IF EXISTS mot_results;

CREATE DATABASE mot_results;

\c mot_results

CREATE TABLE fact_test_result (
    test_id INT,
    vehicle_id INT,
    test_date DATE,
    test_class_id INT,
    test_type VARCHAR,
    test_result VARCHAR,
    test_mileage INT,
    postcode_area VARCHAR,
    make VARCHAR,
    model VARCHAR,
    colour VARCHAR,
    fuel_type VARCHAR,
    cylinder_capacity INT,
    first_use_date DATE
);

CREATE TABLE fact_test_item (
    test_id INT,
    rfr_id INT,
    rfr_type_code VARCHAR,
    location_id INT,
    dangerous_mark VARCHAR
);



