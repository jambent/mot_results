\c mot_results


UPDATE fact_test_class4_result 
SET corrected_make = 'AUDI'
WHERE SUBSTRING(make FOR 4) = 'AUDI'
AND LENGTH(make) > 4;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 6)
WHERE
LENGTH(make) > 4
AND 
corrected_make = 'AUDI';

UPDATE fact_test_class4_result 
SET corrected_make = 'BMW'
WHERE SUBSTRING(make FOR 3) = 'BMW'
AND LENGTH(make) > 3;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 5)
WHERE
LENGTH(make) > 3
AND 
corrected_make = 'BMW';

UPDATE fact_test_class4_result 
SET corrected_make = 'CITROEN'
WHERE SUBSTRING(make FOR 7) = 'CITROEN'
AND LENGTH(make) > 7;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 9)
WHERE
LENGTH(make) > 7
AND 
corrected_make = 'CITROEN';

UPDATE fact_test_class4_result 
SET corrected_make = 'FIAT'
WHERE SUBSTRING(make FOR 4) = 'FIAT'
AND LENGTH(make) > 4;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 6)
WHERE
LENGTH(make) > 4
AND 
corrected_make = 'FIAT';

UPDATE fact_test_class4_result 
SET corrected_make = 'FORD'
WHERE SUBSTRING(make FOR 4) = 'FORD'
AND LENGTH(make) > 4;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 6)
WHERE
LENGTH(make) > 4
AND 
corrected_make = 'FORD';

UPDATE fact_test_class4_result 
SET corrected_make = 'HONDA'
WHERE SUBSTRING(make FOR 5) = 'HONDA'
AND LENGTH(make) > 5;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 7)
WHERE
LENGTH(make) > 5
AND 
corrected_make = 'HONDA';

UPDATE fact_test_class4_result 
SET corrected_make = 'JAGUAR'
WHERE SUBSTRING(make FOR 6) = 'JAGUAR'
AND LENGTH(make) > 6;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 8)
WHERE
LENGTH(make) > 6
AND 
corrected_make = 'JAGUAR';

UPDATE fact_test_class4_result 
SET corrected_make = 'KIA'
WHERE SUBSTRING(make FOR 3) = 'KIA'
AND LENGTH(make) > 3;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 5)
WHERE
LENGTH(make) > 3
AND 
corrected_make = 'KIA';

UPDATE fact_test_class4_result 
SET corrected_make = 'LAND ROVER'
WHERE SUBSTRING(make FOR 10) = 'LAND ROVER'
AND LENGTH(make) > 10;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 12)
WHERE
LENGTH(make) > 10
AND 
corrected_make = 'LAND ROVER';

UPDATE fact_test_class4_result 
SET corrected_make = 'LAND ROVER'
WHERE SUBSTRING(make FOR 9) = 'LANDROVER'
AND LENGTH(make) > 9;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 11)
WHERE
LENGTH(make) > 9
AND SUBSTRING(make FOR 9) = 'LANDROVER';

UPDATE fact_test_class4_result 
SET corrected_make = 'LEXUS'
WHERE SUBSTRING(make FOR 5) = 'LEXUS'
AND LENGTH(make) > 5;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 7)
WHERE
LENGTH(make) > 5
AND SUBSTRING(make FOR 5) = 'LEXUS';

UPDATE fact_test_class4_result 
SET corrected_make = 'MCLAREN'
WHERE SUBSTRING(make FOR 7) = 'MCLAREN'
AND LENGTH(make) > 7;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 9)
WHERE
LENGTH(make) > 7
AND SUBSTRING(make FOR 7) = 'MCLAREN';

UPDATE fact_test_class4_result 
SET corrected_make = 'MERCEDES BENZ'
WHERE SUBSTRING(make FOR 13) = 'MERCEDES BENZ'
AND LENGTH(make) > 13;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 15)
WHERE
LENGTH(make) > 13
AND 
corrected_make = 'MERCEDES BENZ';

UPDATE fact_test_class4_result 
SET corrected_make = 'MINI'
WHERE SUBSTRING(make FOR 4) = 'MINI'
AND LENGTH(make) > 4;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 6)
WHERE
LENGTH(make) > 4
AND 
corrected_make = 'MINI';

UPDATE fact_test_class4_result 
SET corrected_make = 'NISSAN'
WHERE SUBSTRING(make FOR 6) = 'NISSAN'
AND LENGTH(make) > 6;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 8)
WHERE
LENGTH(make) > 6
AND 
corrected_make = 'NISSAN';

UPDATE fact_test_class4_result 
SET corrected_make = 'PEUGEOT'
WHERE SUBSTRING(make FOR 7) = 'PEUGEOT'
AND LENGTH(make) > 7;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 9)
WHERE
LENGTH(make) > 7
AND 
corrected_make = 'PEUGEOT';

UPDATE fact_test_class4_result 
SET corrected_make = 'RENAULT'
WHERE SUBSTRING(make FOR 7) = 'RENAULT'
AND LENGTH(make) > 7;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 9)
WHERE
LENGTH(make) > 7
AND 
corrected_make = 'RENAULT';

UPDATE fact_test_class4_result 
SET corrected_make = 'ROLLS ROYCE'
WHERE SUBSTRING(make FOR 11) = 'ROLLS ROYCE'
AND LENGTH(make) > 11;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 13)
WHERE
LENGTH(make) > 11
AND 
corrected_make = 'ROLLS ROYCE';

UPDATE fact_test_class4_result 
SET corrected_make = 'SEAT'
WHERE SUBSTRING(make FOR 4) = 'SEAT'
AND LENGTH(make) > 4;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 6)
WHERE
LENGTH(make) > 4
AND SUBSTRING(make FOR 4) = 'SEAT';

UPDATE fact_test_class4_result 
SET corrected_make = 'TOYOTA'
WHERE SUBSTRING(make FOR 6) = 'TOYOTA'
AND LENGTH(make) > 6;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 8)
WHERE
LENGTH(make) > 6
AND SUBSTRING(make FOR 6) = 'TOYOTA';

UPDATE fact_test_class4_result 
SET corrected_make = 'SUZUKI'
WHERE SUBSTRING(make FOR 6) = 'SUZUKI'
AND LENGTH(make) > 6;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 8)
WHERE
LENGTH(make) > 6
AND 
corrected_make = 'SUZUKI';

UPDATE fact_test_class4_result 
SET corrected_make = 'VAUXHALL'
WHERE SUBSTRING(make FOR 8) = 'VAUXHALL'
AND LENGTH(make) > 8;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 10)
WHERE
LENGTH(make) > 8
AND 
corrected_make = 'VAUXHALL';

UPDATE fact_test_class4_result 
SET corrected_make = 'VOLKSWAGEN'
WHERE SUBSTRING(make FOR 10) = 'VOLKSWAGEN';

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 12)
WHERE
LENGTH(make) > 10
AND 
corrected_make = 'VOLKSWAGEN';

UPDATE fact_test_class4_result 
SET corrected_make = 'VOLKSWAGEN'
WHERE SUBSTRING(make FOR 2) = 'VW'
AND LENGTH(make) > 2;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 4)
WHERE
LENGTH(make) > 2
AND SUBSTRING(make FOR 2) = 'VW';

UPDATE fact_test_class4_result 
SET corrected_make = 'VOLVO'
WHERE SUBSTRING(make FOR 5) = 'VOLVO'
AND LENGTH(make) > 5;

UPDATE fact_test_class4_result 
SET corrected_model = SUBSTRING(make FROM 7)
WHERE
LENGTH(make) > 5
AND 
corrected_make = 'VOLVO';



