#PART-A

USE gram_panchayat_db;
SHOW TABLES;

#PART-B

#LEVEL_1

SELECT UPPER(full_name) AS Citizen_names FROM citizen;
SELECT LOWER(village_name) AS Villages FROM citizen;
SELECT LENGTH(full_name) AS Length FROM citizen;
SELECT SUBSTRING(reference_number,1,4) AS Ref_nums FROM certificate_Application;
SELECT CONCAT(full_name,'-',village_name) AS Particulars FROM citizen;

#LEVEL-2

UPDATE Certificate_Type SET certificate_name=REPLACE(certificate_name,"Certificate","Cert.");
UPDATE Certificate_Application SET certificate_name=REPLACE(certificate_name,"Certificate","Cert.");
SELECT TRIM(certificate_name) AS certificate_name FROM Certificate_type;
SELECT SUBSTRING_INDEX(full_name,' ',1) AS full_name FROM Citizen;

#LEVEL-3

SELECT CONCAT('Citizen:',full_name,'\nVillage:',village_name) AS Details FROM Citizen;
SELECT *FROM Certificate_Application WHERE reference_number LIKE 'GP2026%';

#PART-C

#LEVEL-1

UPDATE Certificate_Type SET application_fee=ROUND(application_fee);
SELECT certificate_name,ABS(processing_days-10) AS difference FROM Certificate_Type;
SELECT certificate_name,POWER(processing_days,2) AS power FROM Certificate_Type;

#LEVEL-2

SELECT certificate_name,MOD(processing_days,3) AS remainders FROM Certificate_Type;
UPDATE Certificate_Type SET application_fee=ROUND(application_fee,1);
SELECT application_id,CEIL(fee_paid) AS ceiling_value,FLOOR(fee_paid) AS floor_value FROM Certificate_Application;
 
 #LEVEL-3
 
 SELECT FLOOR(RAND()*100)+1 AS random_number;
 SELECT certificate_name,SQRT(processing_days) AS square_root FROM Certificate_Type;
 SELECT certificate_name,processing_days*2 AS double_processing_days FROM Certificate_Type;
 
 #PART-D
 
 #LEVEL-1

SELECT CURDATE() AS today_date;
SELECT NOW() AS date_time;
SELECT YEAR(application_date) AS only_year FROM Certificate_Application;
SELECT MONTH(application_date) AS only_month FROM Certificate_Application;
SELECT DAY(application_date) AS only_date FROM Certificate_Application;

#LEVEL-2

SELECT ca.application_id,ca.application_date,ct.processing_days,DATE_ADD(ca.application_date,INTERVAL ct.processing_days DAY) AS expected_issue_date FROM Certificate_Application ca JOIN Certificate_Type ct ON ca.certificate_name = ct.certificate_name;
SELECT application_id,DATE_ADD(application_date,INTERVAL 30 DAY) AS after_30_days FROM Certificate_Application;
SELECT application_id,DATE_SUB(application_date,INTERVAL 7 DAY) AS before_7_days FROM Certificate_Application;

#LEVEL-3

SELECT application_id,DATEDIFF(CURDATE(),application_date) AS days_difference FROM Certificate_Application;
SELECT *FROM Certificate_Application WHERE YEAR(application_date)=2026;

#PART-E

#LEVEL-1

SELECT application_id,CAST(fee_paid AS SIGNED) AS fee_integer FROM Certificate_Application;
SELECT certificate_name,CAST(processing_days AS CHAR) AS processing_days_char FROM Certificate_Type;

#LEVEL-2

SELECT application_id,CAST(application_date AS DATETIME) AS application_datetime FROM Certificate_Application;
SELECT certificate_name,CAST(processing_days AS DECIMAL(5,2)) AS processing_days_decimal FROM Certificate_Type;

#LEVEL-3

SELECT application_id,CAST(fee_paid AS CHAR) AS fee_as_text FROM Certificate_Application;
SELECT certificate_name,CAST(processing_days AS DECIMAL(5,2)) * 2 AS doubled_processing_days FROM Certificate_Type;