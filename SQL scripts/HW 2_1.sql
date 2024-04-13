--create database Academy

--use Academy

--create table Departments
--(
--Id INT IDENTITY Primary Key not null,
--Name  nvarchar(100) unique not null,
--Financing money not null
--)
--insert into Departments ([Name], [Financing])
--values

--('Department 1', 100000),
--('Department 2', 123455),
--('Department 3', 213365),
--('Department 4', 456123),
--('Department 5', 789456),
--('Department 6', 321987)



--create table Faculties
--(
--Id INT IDENTITY Primary Key not null,
--Name  nvarchar(100) unique not null,
--Dean nvarchar(max) not null
--)
--insert into Faculties ([Name], [Dean])
--values

--('Facult 1', 'Dean 1'),
--('Facult 2', 'Dean 2'),
--('Facult 3', 'Dean 3'),
--('Facult 4', 'Dean 4'),
--('Facult 5', 'Dean 5'),
--('Facult 6', 'Dean 6')


--create table Groups
--(
--Id INT IDENTITY Primary Key not null,
--[Name]  nvarchar(100) unique not null,
--Rating int not null,
--[Year] int not null,
--constraint Rating_value check([Rating] between 0 and 5),
--constraint Year_value check([Year] between 1 and 5)
--)

--insert into Groups
--values
--('Group 1', 5, 4),
--('Group 2', 4, 1),
--('Group 3', 3, 4),
--('Group 4', 5, 5),
--('Group 5', 4, 3),
--('Group 6', 3, 3)



--create table Teachers
--(
--Id INT IDENTITY Primary Key not null,
--EmploymentDate  date  not null,
--IsAssistant bit not null default 0,
--IsProfessor bit not null default 0,
--Name nvarchar(max) not null,
--Surname nvarchar(max) not null,
--Premium money not null default 0,
--Salary money not null default 0,
--constraint EmploymentDate_value check(EmploymentDate > '01.01.1990'),
--constraint Premium_value check(Premium >= 0),
--constraint Salary_value check(Salary >= 0)
--)

--insert into Teachers
--values
--('2020-01-18', 1, 0, 'Name 1', 'Surname 1', 1234, 5000),
--('2021-10-03',0, 1, 'Name 2', 'Surname 2', 3214, 7000),
--('2018-11-26',1, 0, 'Name 3', 'Surname 3', 2341, 15000),
--('2014-04-14',1, 1, 'Name 4', 'Surname 4', 6541, 10000),
--('2015-07-28',0, 1, 'Name 5', 'Surname 5', 3216, 8000),
--('2002-03-31',1, 1, 'Name 6', 'Surname 6', 9874, 20000)



--�������� 2
--��� ���� ����� ������� ������� ��� ������:
--1. ������� ������� ������, ��� ����������� �� ���� � ���������� �������.

select *  from Departments 
order by id desc

--2. ������� ����� ���� �� �� �������� � ����������� �� ���� 
--���� �������� �� ����� �������.
select Name, Rating from Groups

--3. ������� ��� ���������� �� �������, ������� ������ �� 
--��������� �� �������� �� ������� ������ �� ��������� �� �������� (���� ������ �� ��������).
select Surname,
	(Premium / Salary) * 100 as perc_prem_to_sal,
	(Salary / Premium) * 100 as perc_sal_to_prem
from Teachers


--4. ������� ������� ���������� ����� ����� � ������ ������: �The dean of faculty [faculty] is [dean].�.

select 'The dean of faculty ' +  [Name] + ' is ' + [Dean] from Faculties

--5. ������� ������� ���������, ������ ���� �������� 1050.

select Surname from Teachers
where Salary > 1050

--6. ������� ����� ������, ���� ������������ ���� ������, 
--�� 120000 ��� ������ �� 460000.
select Name from Departments
where Financing not between 120000 and 460000


--7. ������� ����� ����������, ���� ���������� �Facult 6�

select Name from Faculties
where Name != 'Facult 6'

--8. ������� ������� �� ������ ����������, �� �� � �����������.
select Surname , IsAssistant = 'Assistant' from Teachers
where IsAssistant = 1 and IsProfessor = 0

--9. ������� �������, ������, ������ �� �������� ���������, 
--�������� ���� � ������� �� 160 �� 550.

select Surname , IsAssistant = 'Assistant', Salary, Premium from Teachers
where IsAssistant = 1 and IsProfessor = 0 and Premium between 1600 and 5500

--10. ������� ������� �� ������ ���������.

select Surname , Salary from Teachers
where IsAssistant = 1 and IsProfessor = 0

--11. ������� ������� �� ������ ����������, �� ���� ������� 
--�� ������ �� 01.01.2018.

select Surname, IsAssistant, IsProfessor from Teachers
where EmploymentDate < '2018-01-01'

--12. ������� ����� ������, �� � ���������� ������� ������� �� ������� �Software Development�. �������� ���� 
--������ �Name of Department�.

SELECT Name AS "Name of Department"
FROM Departments
WHERE Id < (
    SELECT Id
    FROM Departments
    WHERE Name = 'Department 2'
)
ORDER BY Id;

--13. ������� ������� ��������� �� ��������� (���� ������ 
--�� ��������) �� ����� 1200.


select Surname from Teachers
where IsAssistant = 1 and Premium + Salary < 12000

--14. ������� ����� ���� 4-�� ����� � ��������� � ������� 
--�� 2 �� 4.

select Name from Groups
where [Year] = 4 and Rating between 2 and 4

--15. ������� ������� ��������� � ������� �����, �� 550
--��� ��������� �����, �� 200

select Surname from Teachers
where Salary < 550 or Premium < 200
