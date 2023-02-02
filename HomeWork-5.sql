-- use gt37_38;
-- set sql_safe_updates = 0;
-- Д.З
-- 9. Поле email перевести в нижний регистр.
update employees
set email = lower(email);
-- 10. Используем бд sakila
use sakila;
-- 11. Используем таблицу film
-- В description слово beautiful заменить словом amazing.
update film
set description = replace(description, 'beautiful', 'amazing');
-- 12. Вывести поле title_len (количество символов поле title)
select length(title) as title_len
from film;
-- 13. Объединить таблицы customer и staff, вывести поля first_name, last_name, email, address_id и active
select  first_name, last_name, email, address_id, active
from customer
union
select  first_name, last_name, email, address_id, active
from staff;
-- 14. Используем бд gt37_38
use gt37_38;
-- Объединить таблицы customers и employees, вывести поля full_name, email (если нет, то null)
select full_name, emai
from customes
union
select full_name, emai
from employees;
-- 15. Добавить сортировку по email.
select full_name, emai
from customes
union
select full_name, emai
from employees
order by email;
