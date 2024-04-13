use HW_1

--Завдання 1
--Створіть наступні запити для бази даних з інформацією 
--про овочі та фрукти з попереднього домашнього завдання:
--■ Відображення усіх овочів з калорійністю, менше вказаної.
select * from Fruits_and_Vegetables
where Kcal < 40

--■ Відображення усіх фруктів з калорійністю у вказаному
--діапазоні.
select * from Fruits_and_Vegetables
where Kcal between 20 and 60

--■ Відображення усіх овочів, у назві яких є вказане слово. 
--Наприклад, слово: капуста.
select * from Fruits_and_Vegetables
where ProdName like '%apple%'

--■ Відображення усіх овочів та фруктів, у короткому описі 
--яких є вказане слово. Наприклад, слово: гемоглобін.
select * from Fruits_and_Vegetables
where ProdDescription like '%fruit%'

--■ Показати усі овочі та фрукти жовтого або червоного 
--кольору.
select * from Fruits_and_Vegetables
where Colour = 'Yellow' or Colour = 'Red'


--Завдання 2
--Створіть наступні запити для бази даних з інформацією 
--про овочі та фрукти з попереднього домашнього завдання:
--■ Показати кількість овочів.
select count(*) as Vege_count from Fruits_and_Vegetables
where ProdType = 'Vegetable'

--■ Показати кількість фруктів.
select count(*) as Fruit_count from Fruits_and_Vegetables
where ProdType = 'Fruit'

--■ Показати кількість овочів та фруктів заданого кольору.
select count(*) as red_count from Fruits_and_Vegetables
where Colour = 'Red'

--■ Показати кількість овочів та фруктів кожного кольору.
select count(*) as colour_count, Colour,ProdType from Fruits_and_Vegetables
group by Colour, ProdType
order by Colour, ProdType

--■ Показати колір мінімальної кількості овочів та фруктів.
--■ Показати колір максимальної кількості овочів та фруктів.


--■ Показати мінімальну калорійність овочів та фруктів.
select min(Kcal) as min_Kcal from Fruits_and_Vegetables

--■ Показати максимальну калорійність овочів та фруктів.
select max(Kcal) as max_Kcal from Fruits_and_Vegetables

--■ Показати середню калорійність овочів та фруктів.
select avg(Kcal) as avg_Kcal from Fruits_and_Vegetables

--■ Показати фрукт з мінімальною калорійністю.
select ProdName, Kcal from Fruits_and_Vegetables
where ProdType = 'Fruit'
and Kcal = (
    select min(Kcal) from Fruits_and_Vegetables
    where ProdType = 'Fruit'
)


--■ Показати фрукт з максимальною калорійністю
select ProdName, Kcal from Fruits_and_Vegetables
where ProdType = 'Fruit'
and Kcal = (
    select max(Kcal) from Fruits_and_Vegetables
    where ProdType = 'Fruit'
)