USE gram_panchayat_db;
ALTER TABLE Certificate_Application ADD COLUMN certificate_id int;
ALTER TABLE Certificate_Application ADD COLUMN office_id int;
UPDATE Certificate_Application SET certificate_id = 1 WHERE application_id = 1001;
UPDATE Certificate_Application SET certificate_id = 4 WHERE application_id = 1002;
UPDATE Certificate_Application SET certificate_id = 5 WHERE application_id = 1003;
UPDATE Certificate_Application SET certificate_id = 1 WHERE application_id = 1004;
UPDATE Certificate_Application SET certificate_id = 6 WHERE application_id = 1005;
UPDATE Certificate_Application SET certificate_id = 2 WHERE application_id = 1006;
UPDATE Certificate_Application SET office_id = 1 WHERE application_id = 1001;
UPDATE Certificate_Application SET office_id = 2 WHERE application_id = 1002;
UPDATE Certificate_Application SET office_id = 3 WHERE application_id = 1003;
UPDATE Certificate_Application SET office_id = 4 WHERE application_id = 1004;
UPDATE Certificate_Application SET office_id = 5 WHERE application_id = 1005;
UPDATE Certificate_Application SET office_id = 1 WHERE application_id = 1006;
DELETE FROM Certificate_Application WHERE citizen_id NOT IN (SELECT citizen_id FROM Citizen);
ALTER TABLE Certificate_Application
ADD CONSTRAINT fk_certificate
FOREIGN KEY (certificate_id)
REFERENCES Certificate_Type(certificate_type_id);

ALTER TABLE Certificate_Application
ADD CONSTRAINT fk_office
FOREIGN KEY (office_id)
REFERENCES Panchayat_Office(office_id);
SHOW CREATE TABLE Certificate_Application;
DELETE FROM Citizen WHERE citizen_id = 101;
#DELETE FROM Certificate_Type WHERE certificate_type_id = 1;
INSERT INTO Certificate_Application VALUES (3001, 999, '2026-08-01', 'Test', 'Submitted', 100, 'REF3001', 1, 1);

-- ❌ Invalid certificate_id
#INSERT INTO Certificate_Application VALUES (3002, 102, '2026-08-01', 'Test', 'Submitted', 100, 'REF3002', 999, 1);


SELECT * FROM Citizen;

SELECT * FROM Certificate_Application;

SELECT full_name FROM Citizen ORDER BY full_name ASC;

SELECT DISTINCT village_name FROM Citizen;

SELECT DISTINCT certificate_name FROM Certificate_Type;

SELECT DISTINCT office_name FROM Panchayat_Office;

SELECT * FROM Certificate_Application WHERE application_status = 'Pending';

SELECT * FROM Citizen WHERE village_name = 'Ramapuram';

SELECT * FROM Certificate_Application 
WHERE YEAR(application_date) = 2026;

SELECT * FROM Certificate_Application 
ORDER BY application_date DESC;

SELECT ca.* 
FROM Certificate_Application ca
JOIN Panchayat_Office po ON ca.office_id = po.office_id
WHERE po.office_name = 'Nuzvid Panchayat Office';

SELECT c.full_name
FROM Citizen c
JOIN Certificate_Application ca ON c.citizen_id = ca.citizen_id
JOIN Certificate_Type ct ON ca.certificate_id = ct.certificate_type_id
WHERE ct.certificate_name = 'Income Certificate';
-- UNION
SELECT full_name FROM Citizen c
JOIN Certificate_Application ca ON c.citizen_id = ca.citizen_id
WHERE certificate_id = 7
UNION
SELECT full_name FROM Citizen c
JOIN Certificate_Application ca ON c.citizen_id = ca.citizen_id
WHERE certificate_id = 1;

-- INTERSECT (MySQL alternative using JOIN)
SELECT c.full_name
FROM Citizen c
JOIN Certificate_Application ca1 ON c.citizen_id = ca1.citizen_id
JOIN Certificate_Application ca2 ON c.citizen_id = ca2.citizen_id
WHERE ca1.certificate_id = 7 AND ca2.certificate_id = 1;

-- EXCEPT (MySQL alternative using NOT IN)
SELECT full_name FROM Citizen c
JOIN Certificate_Application ca ON c.citizen_id = ca.citizen_id
WHERE certificate_id = 7
AND c.citizen_id NOT IN (SELECT citizen_id FROM Certificate_Application WHERE certificate_id = 1);
-- IN
SELECT full_name FROM Citizen
WHERE citizen_id IN (SELECT citizen_id FROM Certificate_Application);

-- NOT IN
SELECT full_name FROM Citizen
WHERE citizen_id NOT IN (SELECT citizen_id FROM Certificate_Application);

-- EXISTS
SELECT full_name FROM Citizen c
WHERE EXISTS (SELECT 1 FROM Certificate_Application ca WHERE ca.citizen_id = c.citizen_id);

-- NOT EXISTS
SELECT full_name FROM Citizen c
WHERE NOT EXISTS (SELECT 1 FROM Certificate_Application ca WHERE ca.citizen_id = c.citizen_id);
-- ANY
SELECT full_name FROM Citizen
WHERE date_of_birth < ANY (SELECT date_of_birth FROM Citizen WHERE village_name='Ramapuram');

-- ALL
SELECT full_name FROM Citizen
WHERE date_of_birth < ALL (SELECT date_of_birth FROM Citizen WHERE village_name='Ramapuram');
-- Most applications
SELECT c.full_name, COUNT(*) AS total
FROM Citizen c
JOIN Certificate_Application ca ON c.citizen_id = ca.citizen_id
GROUP BY c.full_name
ORDER BY total DESC
LIMIT 1;

-- Office with max applications
SELECT po.office_name, COUNT(*) AS total
FROM Panchayat_Office po
JOIN Certificate_Application ca ON po.office_id = ca.office_id
GROUP BY po.office_name
ORDER BY total DESC
LIMIT 1;

-- Certificate types with >5 applications
SELECT ct.certificate_name, COUNT(*) AS total
FROM Certificate_Type ct
JOIN Certificate_Application ca ON ct.certificate_type_id = ca.certificate_id
GROUP BY ct.certificate_name
HAVING total > 5;

-- Villages with no applications
SELECT DISTINCT village_name FROM Citizen WHERE citizen_id NOT IN (SELECT citizen_id FROM Certificate_Application);
