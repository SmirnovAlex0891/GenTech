select * from reactions;

insert into users(fullname, country, e_mail, is_blocked)
value ('Huan Carlos', 'Mexika', 'sffg@hty.com', 1);

insert into streams(user_id, title)
value (6, 'About stream 4');

insert into donations(donator_id, stream_id, amount)
value (6, 3, 5.99);

-- (1) Вывести пользователей, у которых не укан email-адрес
select * from users 
where e_mail = '' or e_mail is null;

-- (2) Вывести незаблокированных пользователей из Китая
select * from users
where country = 'China' and is_blocked = false;

-- (3) Вывести стримы, авторы которых заблокированы
select streams.stream_id, streams.title, users.fullname, users.is_blocked
from streams
join users on streams.user_id = users.user_id
where users.is_blocked = true;

-- (4) Вывести три последних реакции (включая имя_пользователя)
select reactions.*, users.fullname 
from reactions
join users on reactions.user_id = users.user_id
order by created_at desc
limit 3;

-- (5) Вывести пожертвования заблокированных пользователей

select donations.*, users.fullname
from donations
join users on donations.donator_id = users.user_id
where users.is_blocked = true;