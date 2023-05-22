select * from tickets;

-- Добавить фильм с датой и временем 1 мая, 2023, 10:00:00.
alter table movies
add created_at timestamp;

insert into movies(title, rating, duration_minute, imdb_id, created_at)
values ('Movi_7', 9.3, 105, 478529, timestamp('2023-05-01 10:00:00')),
('Movi_8', 9.1, 110, 474529, timestamp('2023-05-01 10:00:00'));

-- Вывести билеты, купленные на определенную дату
select *
from tickets
where date(created_at) = '2023-05-08';

-- Вывести информацию о покупке билетов. В какие дни недели продаж больше всего: названиеднянедели, ко-во_продаж
select count(*) as total_ticket, dayname(created_at) as day_name
from tickets
group by day_name
order by total_ticket desc;