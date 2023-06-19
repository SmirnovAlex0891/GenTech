create table if not exists reactions (
reaction_id integer primary key auto_increment,
user_id integer,
stream_id integer,
created_at datetime default current_timestamp,
value integer check(value between 1 and 5),
foreign key (user_id) references users(user_id),
foreign key (stream_id) references streams(stream_id)
);

create table if not exists donats (
donat_id integer primary key auto_increment,
user_id integer,
from_user varchar(128),
from_stream integer,
created_at datetime default current_timestamp,
size_of_donat numeric(2,2) not null,
foreign key (user_id) references users(user_id),
foreign key (from_stream) references streams(stream_id)
);

drop table reactions;