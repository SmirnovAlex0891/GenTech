select * from donations;

insert into users(fullname, country, e_mail, is_blocked)
value ('Huan Carlos', 'Mexika', 'sffg@hty.com', 1);

insert into streams(user_id, title)
value (6, 'About stream 4');

insert into donations(donator_id, stream_id, amount)
value (6, 3, 5.99);

select * from users where e_mail = '';

select * from users where country = 'China' and is_blocked = 0;

select streams.stream_id, streams.title, users.fullname, users.is_blocked
from streams
join users on streams.user_id = users.user_id
where users.is_blocked = 1;

select reactions.*, users.fullname 
from reactions
join users on reactions.user_id = users.user_id
order by reaction_id desc
limit 3;

select donations.*, users.fullname
from donations
join users on donations.donator_id = users.user_id
where users.is_blocked = 1;
