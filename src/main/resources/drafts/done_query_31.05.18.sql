create sequence hibernate_sequence start 1 increment 1
create table desk (id int8 not null, class_style varchar(255), is_public boolean not null, name varchar(255), project_id int8, primary key (id))
create table message (id int8 not null, filename varchar(255), head varchar(255), tag varchar(255), text varchar(255), user_id int8, primary key (id))
create table project (id int8 not null, created_date varchar(255), description varchar(255), share boolean not null, projectName varchar(255), publ boolean not null, uniqid varchar(255), user_id int8, primary key (id))
create table project_role (id int8 not null, user_id int8, project_id int8, share_id int8, primary key (id))
create table tag (id int8 not null, color varchar(255), name varchar(255), user_id int8, project_id int8, primary key (id))
create table upload_file (id int8 not null, filename varchar(255), original_name varchar(255), user_id int8, desk_id int8, note_id int8, primary key (id))
create table user_role (user_id int8 not null, roles varchar(255))
create table usr (id int8 not null, activation_code varchar(255), active boolean not null, avatar varchar(255), email varchar(255), firstname varchar(255), lastname varchar(255), password varchar(255), uniqid varchar(255), username varchar(255), primary key (id))

alter table if exists comment add constraint FK23kl900eipat1xpq25pqp63cy foreign key (author_id) references usr
alter table if exists comment add constraint FK41heeawfghvw9jccau0d1tjox foreign key (note_id) references note
alter table if exists comment add constraint FKmk3c8pbvysjndxywunibl2voc foreign key (comment_id) references comment
alter table if exists desk add constraint FKeiy57qht3qd4bp4dagfmyuadk foreign key (project_id) references project
alter table if exists message add constraint FK70bv6o4exfe3fbrho7nuotopf foreign key (user_id) references usr
alter table if exists note add constraint FKgq77x35wnx2x13llb4w8q9yg4 foreign key (user_id) references usr
alter table if exists note add constraint FKc9dt6wl7hxffi0mduw9fj50b7 foreign key (desk_id) references desk
alter table if exists note add constraint FKdyhnx444m2t6sb8hn85wfp5g3 foreign key (project_id) references project
alter table if exists project add constraint FKbfnwrq5lwqynoyfy2p5vfkr77 foreign key (user_id) references usr
alter table if exists project_role add constraint FKpg4s26pt75twq85tatfuig4sq foreign key (user_id) references usr
alter table if exists project_role add constraint FKpfnbi8wmwbr6ddejkm9fxoat8 foreign key (project_id) references project
alter table if exists project_role add constraint FKi60642yjvijvldv0pbvte3e5y foreign key (share_id) references project
alter table if exists tag add constraint FKs5kjlptmpwpchvu0he6d62wo0 foreign key (user_id) references usr
alter table if exists tag add constraint FKbyy56vice9njgl86752up8120 foreign key (project_id) references project
alter table if exists upload_file add constraint FK97mxbnys7ss637igxx2y2b1ru foreign key (user_id) references usr
alter table if exists upload_file add constraint FK6lm7h9icwohhb4n08wao2g3cb foreign key (desk_id) references desk
alter table if exists upload_file add constraint FK2er7kv46mwkjibjcymyknfxnm foreign key (note_id) references note
alter table if exists user_role add constraint FKfpm8swft53ulq2hl11yplpr5 foreign key (user_id) references usr