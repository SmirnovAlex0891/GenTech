

use gt37_38;
create table Jobs(
Job_id integer primary key auto_increment,
title varchar(128) not null,
description varchar(128) not null,
salary integer);

alter table Jobs
change title job_title varchar(128) not null;

alter table Jobs
change description job_description varchar(128) not null;

alter table Jobs
drop column salary;

alter table Jobs
add min_salary numeric(2, 1);

alter table Jobs
add max_salary integer;

alter table Jobs
modify min_salary integer; 

drop table Jobs;