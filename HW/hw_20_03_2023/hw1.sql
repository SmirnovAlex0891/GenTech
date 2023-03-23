create table if not exists reaction (
reaction_id integer primary key auto_increment,
user_id integer,
created_at datetime default current_timestamp,
is_like bool default true,
foreign key (user_id) references users(user_id)
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

drop table donats;