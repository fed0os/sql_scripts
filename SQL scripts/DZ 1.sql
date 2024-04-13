
--1.
--create database Birds

----2.
--alter database Birds modify name = Cats

----3.

--drop database Cats

----4.
use HW_1

CREATE TABLE Fruits_and_Vegetables
(
    [Id] int primary key identity(1, 1) not null,
    ProdName NVARCHAR(20) not null,
    ProdType NVARCHAR(20) not null,
    Colour NVARCHAR(20) not null,
    Kcal INT not null,
    ProdDescription NVARCHAR(200)  null
)


INSERT INTO Fruits_and_Vegetables(ProdName, ProdType, Colour, Kcal, ProdDescription)
VALUES
	('Carrot', 'Vegetable', 'Orange', 41, 'A crunchy, orange vegetable known for its high vitamin A content.'),
    ('Apple', 'Fruit', 'Red', 52, 'A sweet and crisp fruit often eaten fresh or used in various recipes.'),
    ('Banana', 'Fruit', 'Yellow', 89, 'A tropical fruit with a soft texture and a distinctive flavor.'),
    ('Broccoli', 'Vegetable', 'Green', 55, 'A nutritious green vegetable known for its high fiber content.'),
    ('Grapes', 'Fruit', 'Purple', 69, 'Small, sweet fruits often used in making wine or eaten as a snack.'),
    ('Spinach', 'Vegetable', 'Green', 23, 'A leafy green vegetable packed with vitamins and minerals.'),
    ('Strawberry', 'Fruit', 'Red', 32, 'A juicy, red berry often used in desserts and smoothies.'),
    ('Cucumber', 'Vegetable', 'Green', 16, 'A crisp and refreshing vegetable commonly used in salads.'),
    ('Pineapple', 'Fruit', 'Yellow', 50, 'A tropical fruit known for its sweet and tangy flavor.'),
    ('Tomato', 'Vegetable', 'Red', 18, 'Often considered a vegetable in culinary contexts, its botanically a fruit.')



select * from Fruits_and_Vegetables


--Завдання 5
--Створіть наступні запити для таблиці з інформацією про 
--овочі та фрукти із попереднього завдання:
--■ Відображення всієї інформації з таблиці овочів та фруктів;
select * from Fruits_and_Vegetables

--■ Відображення усіх овочів;
select ProdName from Fruits_and_Vegetables
where ProdType = 'Vegetable'

--■ Відображення усіх фруктів;
select ProdName from Fruits_and_Vegetables
where ProdType = 'Fruit'

--■ Відображення усіх назв овочів та фруктів;
select ProdName from Fruits_and_Vegetables

--■ Відображення усіх кольорів. Кольори мають бути унікальними;
select distinct Colour from Fruits_and_Vegetables

--■ Відображення фруктів певного кольору;
select ProdName from Fruits_and_Vegetables
where Colour = 'Yellow' and ProdType = 'Fruit'

--■ Відображення овочів певного кольору.

select ProdName from Fruits_and_Vegetables
where Colour = 'Red' and ProdType = 'Vegetable'




