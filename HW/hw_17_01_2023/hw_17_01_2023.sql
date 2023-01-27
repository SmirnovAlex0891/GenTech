-- Д/З 
-- 8. Используем таблицу employees. 
-- Имя и фамилию соединить в новое поле full_name. 
-- 9. Поле email перевести в нижний регистр. 
-- 10. Используем бд sakila 
-- 11. Используем таблицу film 
-- В description слово beautiful заменить словом amazing. 
-- 12. Вывести поле title_len (количество символов поле title). 
-- 13. Объединить таблицы customer и staff, вывести поля first_name, last_name, email, address_id и 
-- active. 
-- 14. Используем бд gt37_38 
-- Объединить таблицы customers и employees, вывести поля full_name, email (если нет, то null). 
-- 15. Добавить сортировку по email.

use gt37_38;

alter table employees
add full_name varchar(128);

update employees
set full_name = concat_ws(' ', first_name, last_name);

update employees
set email = lower(email);

select * from employees;

use sakila;

-- select * from film
-- where description like '%beautiful%';

update film
set description = replace(description, 'beautiful', 'amazing');

select title, length(title) as title_len
from film;

select first_name, last_name, email, address_id, active
from customer
union all
select first_name, last_name, email, address_id, active
from staff;
 
use gt37_38;

select full_name, null as email
from customers
union all
select full_name, email
from employees;

select full_name, null as email
from customers
union all
select full_name, email
from employees
order by email;

