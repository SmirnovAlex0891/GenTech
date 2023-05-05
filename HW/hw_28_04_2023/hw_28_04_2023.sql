select * from donations;

-- Вывести количественное распределение оценок (реакций) по стриму №1.
select stream_id, count(*)
from reactions
where stream_id = 1;

-- Вывести список стран, откуда идут пожертвования.
select distinct users.country
from donations
left join users on donations.donator_id = users.user_id;

-- Вывести сумму и ко-во всех полученных пожертвований стримером №1 
select streams.user_id, count(*) as num_donat, sum(donations.amount) as summ_donat
from donations
left join streams on donations.stream_id = streams.stream_id
group by streams.user_id;
