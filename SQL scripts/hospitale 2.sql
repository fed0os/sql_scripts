create database Hospital_2

--create table Departments
--(
--Id INT IDENTITY PRIMARY KEY NOT NULL,
--Name NVARCHAR(100) NOT NULL UNIQUE,
--Building int NOT NULL,
--CONSTRAINT CHECH_Building_VAL CHECK(Building Between 1 and 5)
--)

--INSERT INTO Departments
--VALUES
--('Department 1', 1),
--('Department 2', 2),
--('Department 3', 3),
--('Department 4', 1),
--('Department 5', 2),
--('Department 6', 3)


--CREATE TABLE Sponsors
--(
--Id INT IDENTITY PRIMARY KEY NOT NULL,
--Name NVARCHAR(100) NOT NULL UNIQUE,
--);

--INSERT INTO Sponsors
--VALUES
--('Sponsor 1'),
--('Sponsor 2'),
--('Sponsor 3'),
--('Sponsor 4'),
--('Sponsor 5'),
--('Sponsor 6')

--create table Doctors
--(
--Id INT IDENTITY PRIMARY KEY NOT NULL,
--Name NVARCHAR(100) NOT NULL UNIQUE,
--Surname NVARCHAR(max) NOT NULL,
--Premium money NOT NULL default 0,
--CONSTRAINT CHECH_Premium_VAL CHECK(Premium > 0)
--)

--ALTER TABLE Doctors
--ADD Salary  money NOT NULL default 0,
--CONSTRAINT CHECH_Salary_VAL CHECK(Salary > 0)



--INSERT INTO Doctors
--VALUES
--('Doctor 1', 'Surname 1', 100, 1000),
--('Doctor 2', 'Surname 2', 200, 2000),
--('Doctor 3', 'Surname 4', 300, 3000),
--('Doctor 4', 'Surname 4', 400, 4000),
--('Doctor 5', 'Surname 5', 500, 5000),
--('Doctor 6', 'Surname 6', 600, 6000),
--('Doctor 7', 'Surname 7', 700, 7000),
--('Doctor 8', 'Surname 8', 800, 8000),
--('Doctor 9', 'Surname 9', 900, 9000),
--('Doctor 10', 'Surname 10', 1000, 10000)


--create table Wards
--(
--Id INT IDENTITY PRIMARY KEY NOT NULL,
--Name NVARCHAR(20) NOT NULL UNIQUE,
--Places int NOT NULL,
--Departmentid int NOT NULL default 0,
--FOREIGN KEY (Departmentid) REFERENCES Departments(Id),
--CONSTRAINT CHECH_Places_VAL CHECK(Places > 0)
--)


--INSERT INTO Wards
--VALUES
----('Ward 1', 
----	4,
----(SELECT Id FROM Departments WHERE Name = 'Department 1')
----),
--('Ward 2',
--	4, 
--(SELECT Id FROM Departments WHERE Name = 'Department 1')
--),
--('Ward 3', 
--	6,
--(SELECT Id FROM Departments WHERE Name = 'Department 2')
--),
--('Ward 4', 
--	6,
--(SELECT Id FROM Departments WHERE Name = 'Department 2')
--),

--('Ward 5', 
--	2,
--(SELECT Id FROM Departments WHERE Name = 'Department 3')
--),

--('Ward 6', 
--	2,
--(SELECT Id FROM Departments WHERE Name = 'Department 3')
--),
--('Ward 7',
--	4,
--(SELECT Id FROM Departments WHERE Name = 'Department 4')
--),
--('Ward 8',
--	8,
--(SELECT Id FROM Departments WHERE Name = 'Department 5')
--),
--('Ward 9',
--	6,
--(SELECT Id FROM Departments WHERE Name = 'Department 5')
--),
--('Ward 10',
--	1,
--(SELECT Id FROM Departments WHERE Name = 'Department 6')
--)

--CREATE TABLE Examinations
--(
--Id INT IDENTITY PRIMARY KEY NOT NULL,
--Name NVARCHAR(100) NOT NULL UNIQUE,
--);
--INSERT INTO Examinations
--VALUES
--('Examination 1'),
--('Examination 2'),
--('Examination 3'),
--('Examination 4'),
--('Examination 5'),
--('Examination 6')



--CREATE TABLE Sponsors
--(
--Id INT IDENTITY PRIMARY KEY NOT NULL,
--Name NVARCHAR(100) NOT NULL UNIQUE,
--);

--INSERT INTO Sponsors
--VALUES
--('Sponsor 1'),
--('Sponsor 2'),
--('Sponsor 3'),
--('Sponsor 4'),
--('Sponsor 5'),
--('Sponsor 6')



create table DoctorsExaminations
(
Id int identity primary key not null,
StartTime time not null,
EndTime time not null,
DoctorId int not null,
ExaminationId int not null,
WardId int not null
FOREIGN KEY (DoctorId) REFERENCES Doctors(Id),
FOREIGN KEY (ExaminationId) REFERENCES Examinations(Id),
FOREIGN KEY (WardId) REFERENCES Wards(Id),
CONSTRAINT CHECH_StartTime_VAL CHECK(StartTime between '08:00:00' and '18:00:00'),
CONSTRAINT CHECH_EndTime_VAL CHECK(EndTime > StartTime)
)

--INSERT INTO DoctorsExaminations
--VALUES
----(
----	'08:30:00', 
----	'09:30:00',
----	(SELECT Id FROM Doctors WHERE Name = 'Doctor 1'),
----	(SELECT Id FROM Examinations WHERE Name = 'Examination 1'),
----	(SELECT Id FROM Wards WHERE Name = 'Ward 1')
----),
----(
----	'10:30:00', 
----	'11:30:00',
----	(SELECT Id FROM Doctors WHERE Name = 'Doctor 2'),
----	(SELECT Id FROM Examinations WHERE Name = 'Examination 2'),
----	(SELECT Id FROM Wards WHERE Name = 'Ward 2')
----),
--(
--	'08:30:00', 
--	'09:30:00',
--	(SELECT Id FROM Doctors WHERE Name = 'Doctor 3'),
--	(SELECT Id FROM Examinations WHERE Name = 'Examination 3'),
--	(SELECT Id FROM Wards WHERE Name = 'Ward 3')
--),
--(
--	'12:30:00', 
--	'13:00:00',
--	(SELECT Id FROM Doctors WHERE Name = 'Doctor 4'),
--	(SELECT Id FROM Examinations WHERE Name = 'Examination 1'),
--	(SELECT Id FROM Wards WHERE Name = 'Ward 4')
--),
--(
--	'13:30:00', 
--	'14:00:00',
--	(SELECT Id FROM Doctors WHERE Name = 'Doctor 5'),
--	(SELECT Id FROM Examinations WHERE Name = 'Examination 5'),
--	(SELECT Id FROM Wards WHERE Name = 'Ward 5')
--),
--(
--	'15:30:00', 
--	'16:00:00',
--	(SELECT Id FROM Doctors WHERE Name = 'Doctor 6'),
--	(SELECT Id FROM Examinations WHERE Name = 'Examination 1'),
--	(SELECT Id FROM Wards WHERE Name = 'Ward 6')
--),
--(
--	'14:00:00', 
--	'15:00:00',
--	(SELECT Id FROM Doctors WHERE Name = 'Doctor 7'),
--	(SELECT Id FROM Examinations WHERE Name = 'Examination 6'),
--	(SELECT Id FROM Wards WHERE Name = 'Ward 7')
--),
--(
--	'17:30:00', 
--	'18:00:00',
--	(SELECT Id FROM Doctors WHERE Name = 'Doctor 8'),
--	(SELECT Id FROM Examinations WHERE Name = 'Examination 1'),
--	(SELECT Id FROM Wards WHERE Name = 'Ward 1')
--),
--(
--	'10:30:00', 
--	'11:30:00',
--	(SELECT Id FROM Doctors WHERE Name = 'Doctor 9'),
--	(SELECT Id FROM Examinations WHERE Name = 'Examination 4'),
--	(SELECT Id FROM Wards WHERE Name = 'Ward 10')
--),
--(
--	'08:30:00', 
--	'09:00:00',
--	(SELECT Id FROM Doctors WHERE Name = 'Doctor 10'),
--	(SELECT Id FROM Examinations WHERE Name = 'Examination 1'),
--	(SELECT Id FROM Wards WHERE Name = 'Ward 9')
--)

--CREATE TABLE Donations
--(
--Id INT IDENTITY PRIMARY KEY NOT NULL,
--Amount MONEY NOT NULL,
--Date DATE NOT NULL DEFAULT GETDATE(),
--DepartmentId INT NOT NULL,
--SponsorId INT NOT NULL,
--FOREIGN KEY (DepartmentId) REFERENCES Departments(Id),
--FOREIGN KEY (SponsorId) REFERENCES Sponsors(Id),
--CONSTRAINT CHECH_Amount_MIN_VAL CHECK(Amount >= 0),
--CONSTRAINT CHECH_Date_MIN_VAL CHECK(Date <= GETDATE())
--)


--INSERT INTO Donations(Amount, Date, DepartmentId, SponsorId)
--VALUES
--	(10000,
--	'2023-08-10',
--	(SELECT Id FROM Departments WHERE Name = 'Department 1'),
--	(SELECT Id FROM Sponsors  WHERE Name = 'Sponsor 1')
--	),
--	(20000,
--	'2023-09-10',
--	(SELECT Id FROM Departments WHERE Name = 'Department 2'),
--	(SELECT Id FROM Sponsors  WHERE Name = 'Sponsor 2')
--	),
--	(30000,
--	'2023-09-11',
--	(SELECT Id FROM Departments WHERE Name = 'Department 3'),
--	(SELECT Id FROM Sponsors  WHERE Name = 'Sponsor 3')
--	),
--	(100000,
--	'2023-01-17',
--	(SELECT Id FROM Departments WHERE Name = 'Department 4'),
--	(SELECT Id FROM Sponsors  WHERE Name = 'Sponsor 4')
--	),
--	(200000,
--	'2023-02-17',
--	(SELECT Id FROM Departments WHERE Name = 'Department 5'),
--	(SELECT Id FROM Sponsors  WHERE Name = 'Sponsor 5')
--	),
--	(300000,
--	'2023-03-17',
--	(SELECT Id FROM Departments WHERE Name = 'Department 6'),
--	(SELECT Id FROM Sponsors  WHERE Name = 'Sponsor 6')
--	)

--Завдання 1
--1. Виведіть назви відділень, які знаходяться у тому ж 
--корпусі, що й відділення «1».
use Hospital_2
select [Name] from Departments
where Building = 1

--2. Виведіть назви відділень, які знаходяться у тому ж 
--корпусі, що й відділення «Department 1» та «Department 4».

select Building, Name from Departments
where Name = 'Department 1' or Name = 'Department 4'
select * from Departments

--3. Виведіть назву відділення, яке отримало найменше 
--пожертвувань.
select min(Amount),
	(select Name from Departments where Departments.Id = Donations.DepartmentId)
from Donations
group by DepartmentId


--4. Виведіть прізвища лікарів, ставка яких більша, ніж 
--у лікаря «Doctor 3».

select Name, Salary from doctors
where Salary > (Select Salary from Doctors where Name = 'Doctor 3')

--5. Виведіть назви палат, місткість яких більша, ніж середня місткість палат відділення «1».

select Name, Places from Wards
where Places > (Select Avg(Places) from Wards where Departmentid = 1)

--6. Виведіть повні імена лікарів, зарплати яких (сума 
--ставки та надбавки) перевищують, більше, ніж на 
--100, зарплату лікаря «Anthony Davis».

select Name, Surname, Salary + Premium as result from doctors
where Salary + Premium > (Select Salary + Premium from Doctors where Name = 'Doctor 3' and Surname = 'Surname 4') + 100


--7.Виведіть назви відділень, в яких проводить обстеження лікар «Joshua Bell».

--8. Виведіть назви спонсорів, які не робили пожертвування відділенням 
--«Department 1» та «Department 5».

select 
	(select Name from Sponsors where Sponsors.Id = Donations.DepartmentId) as Sponsor,
	(select [Name] from Departments where Departments.Id = Donations.DepartmentId) as Name
from Donations
where Donations.DepartmentId NOT IN (
    select Id from Departments where [Name] = 'Department 1' or [Name] = 'Department 5')
--where DepartmentId != '1' and DepartmentId != '5'
--9. Виведіть прізвища лікарів, які проводять обстеження 
--у період з 12:00 до 15:00

select CONCAT(StartTime , '-',EndTime) as [Time],

	(select Name from Doctors where Doctors.Id = DoctorsExaminations.DoctorId) as result
from DoctorsExaminations
where StartTime >= '12:00:00' and EndTime <= '15:00:00'



select * from Doctors


alter table Doctors
add DepartmentId int default 1

select Id from doctors

UPDATE Doctors
SET DepartmentId = 1
WHERE Id between 1 and 5;

UPDATE Doctors
SET DepartmentId = 5
WHERE Id between 6 and 10;
--Завдання 2


--1. Виведіть кількість палат, місткість яких більша за 10.
select count(name)  from Wards
where Places > 10
--2. Виведіть назви корпусів і кількість палат у кожному 
--з них.


--3. Виведіть назви відділень і кількість палат у кожному 
--з них.

select 
(select Name from Departments where Departments.Id = Wards.Departmentid) as Dep_name,
Count(name) as Wards_count
from Wards
group by Departmentid

--4. Виведіть назви відділень і сумарну надбавку лікарів 
--у кожному з них.

select * from DoctorsExaminations

--5. Виведіть назви відділень, в яких проводять обстеження 5 та більше лікарів.

--6. Виведіть кількість лікарів та їх сумарну зарплату (сума 
--ставки та надбавки).

select count(Name) as doctors_count, sum(Salary + Premium) money_sum  from Doctors 

--7. Виведіть середню зарплату (сума ставки та надбавки) 
--лікарів.

select AVG(Salary + Premium) money_sum  from Doctors 

--8. Виведіть назви палат з мінімальною місткістю.
select Name from Wards
where Places = (Select min(Places) from Wards)

--9. Виведіть, в яких із корпусів 1, 6, 7 та 8 сумарна 
--кількість місць у палатах перевищує 100. При цьому враховуватиме лише палати з кількістю місць 
--більше 10


