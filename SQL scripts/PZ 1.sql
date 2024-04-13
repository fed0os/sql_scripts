create database Sample

ALTER DATABASE Sample MODIFY NAME = Example

drop database Example


use students

create table Students
(
    [id] int primary key identity(1, 1) not null,
    [fio] nvarchar(100) not null,
    [city] nvarchar(20) not null,
    [country] nvarchar(20) not null,
    [birthdate] date not null,
    [email] nvarchar(20) null,
    [phone] nvarchar(20) null,
    [group_name] nvarchar(20) null,
    [average_mark] decimal(18, 8) null, -- дробное число
    [subject_name_min_mark] nvarchar(20) null,
    [subject_name_max_mark] nvarchar(20) null
)

insert into Students(
    [fio], [city], [country], [birthdate],[email],[phone],[group_name], [average_mark],
	[subject_name_min_mark], [subject_name_max_mark]
)
values('Test 4', 'City 4', 'Country 4', '2001-07-17', 'test4@gmail.com', '178945666', '1', '79', 'History', 'Math')



--Створіть наступні запити для таблиці з оцінками 
--студентів із попереднього завдання:


--■ Відображати всієї інформації з таблиці зі студентами 
--та оцінками.


select * from Students

--■ Відображати ПІБ усіх студентів.

select [fio] from Students


--■ Відображати усіх середніх оцінок.

select [average_mark] from Students

--■ Показати ПІБ усіх студентів з мінімальною оцінкою, 
--більшою, ніж зазначена. 

select [fio] from Students
where [average_mark] < 90


--■ Показати країни студентів. Назви країн мають бути 
--унікальними.

select distinct [country] from Students

--■ Показати міста студентів. Назви міст мають бути 
--унікальними.

select distinct [city] from Students


--■ Показати назви груп. Назви груп мають бути унікальними.


select distinct [group_name] from Students

--■ Показати назви усіх предметів із мінімальними 
--середніми оцінками. Назви предметів мають бути унікальними.


select distinct [subject_name_min_mark] from Students