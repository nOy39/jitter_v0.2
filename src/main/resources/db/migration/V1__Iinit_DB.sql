create sequence hibernate_sequence start 1 increment 1;

create table comment (id int8 not null, date timestamp, dislikes int4 not null, likes int4 not null, message varchar(255), author_id int8, note_id int8, project_id int8, comment_id int8, primary key (id));

create table desk (id int8 not null, class_style varchar(255), is_public boolean not null, name varchar(255), project_id int8, primary key (id));
create table history (id int8 not null, created timestamp, message varchar(255), user_id int8, desk_id int8, note_id int8, project_id int8, primary key (id));
create table message (id int8 not null, filename varchar(255), head varchar(255), tag varchar(255), text varchar(255), user_id int8, primary key (id));
create table note (id int8 not null, created_date date, dead_line date, description varchar(255), done boolean not null, message varchar(255), name varchar(255), user_id int8, desk_id int8, project_id int8, primary key (id));
create table project (id int8 not null, created_date date, description varchar(255), is_share boolean not null, project_name varchar(255), publ boolean not null, uniqid varchar(255), user_id int8, primary key (id));
create table project_role (id int8 not null, user_id int8, project_id int8, primary key (id));
create table tag (id int8 not null, color varchar(255), name varchar(255), user_id int8, note_id int8, project_id int8, primary key (id));
create table upload_file (id int8 not null, filename varchar(255), original_name varchar(255), user_id int8, desk_id int8, note_id int8, project_id int8, primary key (id));
create table user_role (user_id int8 not null, roles varchar(255));
create table usr (id int8 not null, activation_code varchar(255), active boolean not null, avatar varchar(255), email varchar(255), firstname varchar(255), lastname varchar(255), password varchar(255), uniqid varchar(255), username varchar(255), primary key (id));
