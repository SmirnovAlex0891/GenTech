-- (1) Вывести все пожертвования от 10 EUR, с указанием имениавторапожертвования и суммы
select users.fullname, donations.amount 
from donations
join users on donations.donation_id = users.user_id
where donations.amount >= 10;

-- (2) Вывести стримера, которому было сделано самое минимальное пожертвование (имя_стримера, сумма)
select users.fullname as strimer_name, donations.amount as summ
from donations
join streams on donations.stream_id = streams.stream_id
join users on streams.user_id = users.user_id
order by donations.amount
limit 1;

-- (3) Вывести последнее пожертвование (название_стрима, сумма)
select streams.title as stream_name, donations.amount as summ
from donations
join streams on donations.stream_id = streams.stream_id
order by donations.created_at desc
limit 1;

select * from streams;

