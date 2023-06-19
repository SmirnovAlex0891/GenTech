select * from reactions;

-- ТОП-2 страны по сумме донатов
select sum(donations.amount) as total_amount, users.country
from donations
left join users on donations.donator_id = users.user_id
group by users.country
order by total_amount desc
limit 2;

-- Вывести рейтинг для каждого незавершенного стрима
select reactions.stream_id, avg(reactions.value) as rating
from reactions
left join streams on reactions.stream_id = streams.stream_id
where streams.is_completed = 0
group by reactions.stream_id;

-- Вывести ТОП-1 донаторов (имя, сумма в долларах)
select users.fullname, sum(donations.amount) * 1.09 as total_summ_usd
from donations
left join users on donations.donator_id = users.user_id
group by users.fullname
order by total_summ_usd desc
limit 1;

-- Вывести страны стримеров, у которых рейтинг ниже 2
select users.fullname, users.country, avg(reactions.value) as avg
from reactions
left join users on reactions.user_id = users.user_id
group by reactions.user_id
having avg < 2;

-- Вывести имена пользователей и сколько оценок за все время они поставили
select users.fullname, count(*) as num_rat
from reactions
left join users on reactions.user_id = users.user_id
group by reactions.user_id;