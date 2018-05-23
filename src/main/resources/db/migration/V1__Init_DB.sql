create sequence hibernate_sequence start 1 increment 1;
create table desk (id int8 not null, is_complete boolean not null, is_important boolean not null, name varchar(255), project_id int8, primary key (id));
create table message (id int8 not null, filename varchar(255), head varchar(255), tag varchar(255), text varchar(255), user_id int8, primary key (id));

create table note (
id int8 not null,
date_complete varchar(255),
date_created varchar(255),
done boolean,
message varchar(255),
priority int4,
user_id int8,
desk_id int8,
primary key (id)
);

create table project (
id int8 not null,
created_date varchar(255),
deadline_date varchar(255),
description varchar(255),
is_public boolean not null,
isactive boolean not null,
prj_name varchar(255),
uniqid varchar(255),
user_id int8,
primary key (id)
);
create table tag (id int8 not null, color varchar(255), user_id int8, primary key (id));
create table user_role (user_id int8 not null, roles varchar(255));
create table usr (id int8 not null, activation_code varchar(255), active boolean not null, email varchar(255), firstname varchar(255), lastname varchar(255), password varchar(255), uniqid varchar(255), username varchar(255), primary key (id));
alter table if exists desk add constraint FKeiy57qht3qd4bp4dagfmyuadk foreign key (project_id) references project;
alter table if exists message add constraint FK70bv6o4exfe3fbrho7nuotopf foreign key (user_id) references usr;
alter table if exists note add constraint FKgq77x35wnx2x13llb4w8q9yg4 foreign key (user_id) references usr;
alter table if exists note add constraint FKc9dt6wl7hxffi0mduw9fj50b7 foreign key (desk_id) references desk;
alter table if exists project add constraint FKbfnwrq5lwqynoyfy2p5vfkr77 foreign key (user_id) references usr;
alter table if exists tag add constraint FKs5kjlptmpwpchvu0he6d62wo0 foreign key (user_id) references usr;
alter table if exists user_role add constraint FKfpm8swft53ulq2hl11yplpr5 foreign key (user_id) references usr;