use streaming;
create table videos(
video_id int primary key auto_increment,
name varchar(256) not null,
description varchar(256),
autor_id int,
autor varchar(64) not null,
duration numeric (5,2) not null,
video_category int,
is_block tinyint(1) default 0,
foreign key (autor_id) references autors(autor_id),
foreign key (video_category) references video_categories(video_category_id)
); 

create table autors(
autor_id int primary key auto_increment,
full_name varchar(256) not null,
email varchar(256) not null,
age int,
gender_person varchar(64) not null
);

create table video_categories(
video_category_id int primary key auto_increment,
name_of_category varchar(128) not null,
age_limit int not null,
description_category varchar(256) not null
);


