-- DROP DATABASE IF EXISTS mot_results;
CREATE DATABASE mot_results;

\c mot_results

-- CREATE TABLE fact_test_result_for_table_copy AS
--     SELECT * FROM fact_test_result;
-- DROP TABLE if exists fact_test_result;
CREATE TABLE fact_test_result (
    test_id INT,
    vehicle_id INT,
    test_date DATE,
    test_class_id INT,
    test_type VARCHAR,
    test_result VARCHAR,
    test_mileage DECIMAL,
    postcode_area VARCHAR,
    make VARCHAR,
    model VARCHAR,
    colour VARCHAR,
    fuel_type VARCHAR,
    cylinder_capacity DECIMAL,
    first_use_date DATE,
    PRIMARY KEY (test_id)
);
-- INSERT INTO fact_test_result
-- SELECT * FROM fact_test_result_for_table_copy;
-- DROP TABLE fact_test_result_for_table_copy;

CREATE TABLE fact_test_item (
    test_id INT,
    rfr_id INT,
    rfr_type_code VARCHAR,
    location_id INT,
    dangerous_mark VARCHAR
);

-- CREATE TABLE dim_item_detail_for_table_copy AS
--     SELECT * FROM dim_item_detail;
-- DROP TABLE if exists dim_item_detail;
CREATE TABLE dim_item_detail (
    rfr_id INT,
    test_class_id INT,
    test_item_id INT,
    minor_item VARCHAR,
    rfr_deficiency_category VARCHAR,
    rfr_desc VARCHAR,
    rfr_loc_marker VARCHAR,
    rfr_insp_manual_desc VARCHAR,
    rfr_advisory_text VARCHAR,
    test_item_set_section_id INT,
    PRIMARY KEY (rfr_id,test_class_id)
);
-- INSERT INTO dim_item_detail
-- SELECT * FROM dim_item_detail_for_table_copy;
-- DROP TABLE dim_item_detail_for_table_copy;

-- DROP TABLE if exists dim_item_group;
CREATE TABLE dim_item_group (
    test_item_id INT,
    test_class_id INT,
    parent_id INT,
    test_item_set_section_id INT,
    item_name VARCHAR,
    PRIMARY KEY (test_item_id, test_class_id)
);

CREATE TABLE dim_mdr_fuel_types (
    type_code VARCHAR,
    fuel_type VARCHAR
);
-- DROP TABLE if exists dim_mdr_rfr_location;
CREATE TABLE dim_mdr_rfr_location(
    id INT,
    "lateral" VARCHAR,
    longitudinal VARCHAR,
    vertical VARCHAR,
    PRIMARY KEY(id)
);

CREATE TABLE dim_mdr_test_outcome(
    result_code VARCHAR,
    result VARCHAR
);

CREATE TABLE dim_mdr_test_type (
    type_code VARCHAR,
    test_type VARCHAR
);