--create database Hospital

--create table Department
--(
--Id INT IDENTITY PRIMARY KEY NOT NULL,
--Name NVARCHAR(100) NOT NULL UNIQUE
--);

--INSERT INTO Department
--VALUES
--('Department 1'),
--('Department 2'),
--('Department 3')


--CREATE TABLE Doctors
--(
--Id INT IDENTITY PRIMARY KEY NOT NULL,
--Name NVARCHAR(MAX) NOT NULL ,
--Surname NVARCHAR(MAX) NOT NULL ,
--Premium MONEY NOT NULL DEFAULT 0,
--Salary MONEY NOT NULL ,
--CONSTRAINT CHECH_Premium_MIN_VAL CHECK(Premium >= 0),
--CONSTRAINT CHECH_Salary_MIN_VAL CHECK(Salary >= 0)
--);

--INSERT INTO Doctors
--VALUES
--('Doctor 1', 'Surname 1', 100, 1000),
--('Doctor 2', 'Surname 2', 200, 2000),
--('Doctor 3', 'Surname 4', 300, 3000),
--('Doctor 4', 'Surname 4', 400, 4000),
--('Doctor 5', 'Surname 5', 500, 5000)



--CREATE TABLE Specializations
--(
--Id INT IDENTITY PRIMARY KEY NOT NULL,
--Name NVARCHAR(100) NOT NULL UNIQUE
--);

--INSERT INTO Specializations
--VALUES
--('Specialization 1'),
--('Specialization 2'),
--('Specialization 3')

--CREATE TABLE DoctorsSpecializations
--(
--Id INT IDENTITY PRIMARY KEY NOT NULL,
--DoctorId INT REFERENCES Doctors(Id) NOT NULL,
--SpecializationId INT REFERENCES Specializations(Id) NOT NULL
--)
--INSERT INTO DoctorsSpecializations
--VALUES
--(
--	(SELECT Id FROM Doctors WHERE Name = 'Doctor 1'),
--	(SELECT Id FROM Specializations WHERE Name = 'Specialization 1')
--),
--(
--	(SELECT Id FROM Doctors WHERE Name = 'Doctor 2'),
--	(SELECT Id FROM Specializations WHERE Name = 'Specialization 1')
--),
--(
--	(SELECT Id FROM Doctors WHERE Name = 'Doctor 3'),
--	(SELECT Id FROM Specializations WHERE Name = 'Specialization 2')
--),
--(
--	(SELECT Id FROM Doctors WHERE Name = 'Doctor 4'),
--	(SELECT Id FROM Specializations WHERE Name = 'Specialization 3')
--),
--(
--	(SELECT Id FROM Doctors WHERE Name = 'Doctor 5'),
--	(SELECT Id FROM Specializations WHERE Name = 'Specialization 2')
--);


--CREATE TABLE Sponsors
--(
--Id INT IDENTITY PRIMARY KEY NOT NULL,
--Name NVARCHAR(100) NOT NULL UNIQUE,
--);

--INSERT INTO Sponsors
--VALUES
--('Sponsor 1'),
--('Sponsor 2'),
--('Sponsor 3')

--CREATE TABLE Donations
--(
--Id INT IDENTITY PRIMARY KEY NOT NULL,
--Amount MONEY NOT NULL,
--Date DATE NOT NULL DEFAULT GETDATE(),
--DepartmentId INT NOT NULL,
--SponsorId INT NOT NULL,
--FOREIGN KEY (DepartmentId) REFERENCES Department(Id),
--FOREIGN KEY (SponsorId) REFERENCES Sponsors(Id),
--CONSTRAINT CHECH_Amount_MIN_VAL CHECK(Amount >= 0),
--CONSTRAINT CHECH_Date_MIN_VAL CHECK(Date > GETDATE())
--)


--USE Hospital
--INSERT INTO Donations(Amount, Date, DepartmentId, SponsorId)
--VALUES
--	(10000,
--	'2023-09-15',
--	(SELECT Id FROM Department WHERE Name = 'Department 1'),
--	(SELECT Id FROM Sponsors  WHERE Name = 'Sponsor 1')
--	),
--	(20000,
--	'2023-09-15',
--	(SELECT Id FROM Department WHERE Name = 'Department 2'),
--	(SELECT Id FROM Sponsors  WHERE Name = 'Sponsor 2')
--	),
--	(30000,
--	'2023-09-15',
--	(SELECT Id FROM Department WHERE Name = 'Department 3'),
--	(SELECT Id FROM Sponsors  WHERE Name = 'Sponsor 3')
--	)


--CREATE TABLE Vacations
--(
--Id INT IDENTITY PRIMARY KEY NOT NULL,
--DoctorId INT NOT NULL,
--StartDate DATE NOT NULL,
--EndDate DATE NOT NULL,
--FOREIGN KEY (DoctorId) REFERENCES Doctors(Id),
--CONSTRAINT CHECH_EndDate CHECK(EndDate > StartDate)
--);

--INSERT INTO Vacations
--VALUES
--(
--(SELECT Id FROM Doctors WHERE Name = 'Doctor 1'),
--'2023-01-01',
--'2023-02-01'
--),
--(
--(SELECT Id FROM Doctors WHERE Name = 'Doctor 2'),
--'2023-02-01',
--'2023-03-01'
--),
--(
--(SELECT Id FROM Doctors WHERE Name = 'Doctor 3'),
--'2023-03-01',
--'2023-04-01'
--),
--(
--(SELECT Id FROM Doctors WHERE Name = 'Doctor 4'),
--'2023-04-01',
--'2023-05-01'
--),
--(
--(SELECT Id FROM Doctors WHERE Name = 'Doctor 5'),
--'2023-05-01',
--'2023-06-01'
--)





--CREATE TABLE Wards
--(
--Id INT IDENTITY PRIMARY KEY NOT NULL,
--Name NVARCHAR(20) NOT NULL UNIQUE,
--DepartmentId INT NOT NULL,
--FOREIGN KEY(DepartmentId) REFERENCES Department(Id)
--);

--INSERT INTO Wards
--VALUES
----('Ward 1', 
----(SELECT Id FROM Department WHERE Name = 'Department 1')
----),
----('Ward 2', 
----(SELECT Id FROM Department WHERE Name = 'Department 2')
----),
----('Ward 3', 
----(SELECT Id FROM Department WHERE Name = 'Department 3')
----)
--('Ward 4', 
--(SELECT Id FROM Department WHERE Name = 'Department 1')
--),
--('Ward 5', 
--(SELECT Id FROM Department WHERE Name = 'Department 2')
--),
--('Ward 6', 
--(SELECT Id FROM Department WHERE Name = 'Department 3')
--)




--1. Виведіть повні імена лікарів та їх спеціалізації.

select  
		(select Name from Doctors where DoctorsSpecializations.DoctorId = Doctors.Id) as Doctor_name,
		(select Name from Specializations where DoctorsSpecializations.SpecializationId = Specializations.Id) as Specialization_name

from DoctorsSpecializations
--2. Виведіть прізвища та зарплати (сума ставки та надбавки) лікарів, які не перебувають у відпустці.

SELECT 
	EndDate,
	(SELECT Name FROM Doctors WHERE Doctors.Id = Vacations.DoctorId) AS Doctor_name,
	(SELECT Salary FROM Doctors WHERE Doctors.Id = Vacations.DoctorId) AS Salary_name
FROM Vacations
WHERE EndDate < GETDATE()


--3. Виведіть назви палат, які знаходяться у відділенні
--«DEPARTMENT 2».
select [Name] from Wards
where DepartmentId = 2



--4. Виведіть назви відділень без повторень, які спонсоруються компанією «Sponsor 1».
select distinct [Departmentid] from Donations
where SponsorId = 1


--5. Виведіть усі пожертвування за останній місяць у вигляді: відділення, спонсор, сума пожертвування, дата
--пожертвування.
Select 
	(Select [Name] from Department where Department.Id = Donations.Id) as Department,
	(Select [Name] from Sponsors where Sponsors.Id = Donations.Id) as Sponsor,
	Amount,
	Date
from Donations	
where [Date] > '2023-09-01'

--6. Виведіть прізвища лікарів із зазначенням відділень,
--в яких вони проводять обстеження. Враховуйте обстеження, які проводяться лише у будні дні.

Select 
	(Select [Surname] from Doctors where Doctors.id = DoctorsSpecializations.DoctorId) as Surname,
	(Select [Name] from Specializations where Specializations.Id = DoctorsSpecializations.SpecializationId) as Specializations
from DoctorsSpecializations
--7. Виведіть назви палат і корпуси відділень, в яких проводить обстеження лікар «Helen Williams».



--8. Виведіть назви відділень, які отримували пожертвування у розмірі понад 100000, із зазначенням їх лікарів.



--9. Виведіть назви відділень, в яких лікарі не отримують
--надбавки.
--10. Виведіть назви спеціалізацій, які беруть участь у лікуванні захворювань із ступенем тяжкості вище 3.
--11. Виведіть назви відділень і назви захворювань, обстеження з яких вони проводили за останні півроку.
--12. Виведіть назви відділень і назви палат, в яких проводилися обстеження із заразних захворювань.


