create database HW37_38;

use HW37_38;

-- Создать таблицу students
-- id уникальное значение, не null, автозаполнение 
-- firstname varchar not null
-- lastname varchar not null
-- class integer от 1 до 10
-- subject varchar not null
-- mark integer от 0 до 5 

create table students(
id integer primary key auto_increment,
firstname varchar(128) not null,
lastname varchar(128) not null,
class integer check(class between 1 and 10),
subject varchar(128) not null,
mark integer check(mark between 0 and 5));

-- Заполнить таблицу строками (10 шт)
insert into students (firstname, lastname, class, subject, mark)
values ('Steven', 'King', 6, 'Math', 5),
('Neena', 'Kochhar', 7, 'Bio', 4),
('Lex', 'De Haan', 8, 'Physics', 3),
('Alexander', 'Hunold', 3, 'Literatura', 5),
('Bruce', 'Ernst', 6, 'Math', 0),
('Valli', 'Pataballa', 10, 'Physics', 2),
('Diana', 'Lorentz', 8, 'Bio', 4),
('Nancy', 'Greenberg', 3, 'Music', 3),
('Daniel', 'Faviet', 7, 'Literatura', 2),
('Jose Manuel', 'Urman', 9, 'Music', 1);

select * from students;

-- Удалить из таблицы студентов, у которых оценка 0
set sql_safe_updates = 0;
delete from students
where mark = 0;

-- Найти всех студентов, у которых оценка выше 3
select * from students
where mark > 3;

-- Найти всех студентов, которые учатся в первом классе и у них оценка меньше 3
select * from students
where class = 1 and mark < 3;

-- Удалить из таблицы этих студентов
delete from students
where class = 1 and mark < 3;

-- Найти всех студентов, у которых длина имени больше 4 букв
select * from students
where length(firstname) > 4;

-- Найти всех студентов, у которых фамилия начинается с буквы "a" и имеет длину не менее 3 
-- символов.
select * from students
where lastname like 'a%' and length(lastname) > 3;

-- В таблице оставить тех студентов, которые (проходят Х предмет и оценка выше 4) и тех 
-- студентов (которые учатся 7-10 классах и у них оценки ниже 3).

delete from students
where not ((subject = 'Math' and mark > 4) or (class > 6 and mark < 3));
 
drop table students;







