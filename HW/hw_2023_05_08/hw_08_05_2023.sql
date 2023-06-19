select * from timetable;

-- Вывести название самого посещаемого кинозала
select halls.hall_id, halls.name as hall_name, count(*) as total_tickets
from tickets
left join timetable on tickets.timetable_id=timetable.timetable_id
left join halls on timetable.hall_id=halls.hall_id
group by halls.hall_id
order by total_tickets desc
limit 1;

-- Вывести название и ко-во проданных билетов самого непопулярного фильма
select movies.title as movi_name, count(*) as total_tickets
from tickets
left join timetable on tickets.timetable_id=timetable.timetable_id
left join movies on timetable.movie_id=movies.movie_id
group by movies.movie_id
order by total_tickets
limit 1;

-- Вывести процент времени, который отводится рекламе в каждом сеансе.
select timetable.duration_minute as total_time,
timetable.duration_minute - movies.duration_minute as advertising_time,
timetable.duration_minute / 100 * (timetable.duration_minute - movies.duration_minute) as percent
from timetable
left join movies on timetable.movie_id=movies.movie_id;


-- Вывести самый продолжительный фильм (название и продолжительность)
select title, duration_minute
from movies
order by duration_minute desc
limit 1;

-- Вывести среднюю стоимость билета для каждого фильма (ср/стоимость и название фильма - проекция)
select avg(tickets.cost), movies.title as movi_name
from tickets
left join timetable on tickets.timetable_id=timetable.timetable_id
left join movies on timetable.movie_id=movies.movie_id
group by movies.movie_id;

