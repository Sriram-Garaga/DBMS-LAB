CREATE DATABASE gram_panchayat_db;
USE gram_panchayat_db;
CREATE TABLE Citizen(citizen_id int PRIMARY KEY,full_name varchar(25) NOT NULL,date_of_birth DATE NOT NULL,gender char(1) NOT NULL CHECK(gender='M' OR gender='F'),mobile_number varchar(15) NOT NULL UNIQUE,occupation varchar(50),village_name varchar(50) NOT NULL,is_active boolean NOT NULL);
CREATE TABLE Certificate_Type(certificate_type_id int PRIMARY KEY,certificate_name varchar(200) NOT NULL UNIQUE,descript varchar(200) NOT NULL,processing_days int NOT NULL,application_fee decimal(8,2) NOT NULL,is_available boolean NOT NULL);
CREATE TABLE Certificate_Application(application_id int PRIMARY KEY,citizen_id int NOT NULL,certificate_name varchar(200) NOT NULL,application_date DATE NOT NULL,purpose VARCHAR(200) NOT NULL,application_status varchar(200) NOT NULL,fee_paid decimal(8,2) NOT NULL,reference_number varchar(200) NOT NULL UNIQUE);
CREATE TABLE Panchayat_Office(office_id int PRIMARY KEY,office_name varchar(200) NOT NULL,village_name varchar(200) NOT NULL,pincode varchar(200) NOT NULL,contact_number varchar(200) UNIQUE,office_email varchar(200) UNIQUE,opening_time TIME NOT NULL,is_operational boolean NOT NULL);
INSERT  INTO Citizen VALUES(101,"RAMMAYYA",'1950-01-10','M',9243567843,"FARMER","valluripalli",1);
DELETE FROM Citizen WHERE full_name="RAMMAYYA";
INSERT INTO Citizen VALUES(102,"Seethayya",'1965-12-12','M',8976543409,"FARMER","valluripalli",1),(103,"Ramesh Rao",'1990-03-06','M',9087567621,"Plumber","valluripalli",1),(104,"RamaLakshmi",'1995-01-09','F',9908786590,"House-Wife","valluripalli",1);
INSERT INTO Citizen VALUES(105,"Bhagya",'2000-08-08','F',9908786798,"Student","valluripalli",1),(106,"Srinu",'2002-10-10','M',8763425680,"Student","valluripalli",1);
INSERT INTO Certificate_Type VALUES(1,"Residence Certificate","Certifies the declred place of residence",6,300.00,1);
INSERT INTO Certificate_Type VALUES(2,"Birth Record Request","Request for a locally maintained birth record",7,250.00,1),(3,"Death Record Request","Request for a locally maintained death record",6,230.00,1),(4,"Family Member Certificate","Records decared family-mem",11,400.00,1),(5,"Property Certificate","Certificate related to locally maintained properly records",14,500.00,1),(6,"No-Dues Certificate","Indicates applicable local dues status",7,250.00,0);
DELETE FROM Certificate_Application;
INSERT INTO Certificate_Application VALUES(1001,101,"Residence Certificate",'2026-07-01',"Bank acount documentation","Submitted",300.00,"GP20260001"),(1002,102,"Family Member Certificate",'2026-07-02',"Welfare Scheme application","Under Review",40.00,"GP20260002"),(1003,103,"Property Certificate",'2026-07-03',"Property documentation","Submitted",50.00,"Gp20260003"),(1004,104,"Residence Certificate",'2026-07-04',"College admission","Approved",45.00,"GP20260004"),(1005,105,"No-Dues Certificate",'2026-07-05',"Local Service Requirement","Under Review",35.00,"GP20260005"),(1006,106,"Birth Record Request",'2026-07-06',"Personal documentation","Rejected",50.00,"GP20260006");
INSERT INTO Panchayat_Office VALUES(1,"Ramapuram Gram Panchayat","Ramapuram",521101,0866000001,"rama@gmail.com",'09:00:00',1),(2,"Seethampeta Gram Panchayat","Seethampeta",521102,0866000002,"seethampeta@gmail.com",'09:30:00',1),(3,"Lakshmipuram Gram Panchayat","Lakshmipuram",521103,0866000003,"Lakshmipuram@gmail.com",'09:00:00',1),(4,"KrishnaPuram Gram Panchayat","Krishnapuram",521104,0866000004,"krishnapuram@gmail.com",'10:00:00',1),(5,"VenkataPuram Gram Panchayat","VenkataPuram",521105,0866000005,"venkatapuram@gmail.com",'09:30:00',1),(6,"GopalaPuram Gram Panchayat","GopalaPuram",521106,0866000006,"gopalapuram@gmail.com",'09:00:00',0);
INSERT INTO Citizen VALUES(107,"Meena Kumari",'1998-12-30','F',9876500006,"Teacher","Darsiparru",0);
INSERT INTO Certificate_Type VALUES(7,"Income Certiificate","Certificate related to How much income will we get annually.",10,100.00,1);
UPDATE Certificate_Application SET application_status="Under Review" WHERE application_id=1001;
UPDATE Certificate_Application SET application_status="Approved" WHERE application_id=1002;
UPDATE Citizen SET occupation="Electrical Technician" WHERE citizen_id=105;
UPDATE Certificate_Type SET processing_days=20 WHERE certificate_name="Property Certificate";
UPDATE Certificate_Type SET is_available=1 WHERE certificate_name="No-Dues Certificate";
ALTER TABLE Citizen ADD COLUMN Address varchar(200);
ALTER TABLE Certificate_Type ADD COLUMN issued_date DATE;
ALTER TABLE Panchayat_Office ADD COLUMN closing_time TIME;
DELETE FROM  Citizen;
DELETE FROM Certificate_Type;
DELETE FROM Certificate_Application;
DELETE FROM Panchayat_Office;
SELECT * FROM Citizen;
SELECT * FROM Certificate_Type;
SELECT * FROM Certificate_Application;
SELECT * FROM Panchayat_Office;



