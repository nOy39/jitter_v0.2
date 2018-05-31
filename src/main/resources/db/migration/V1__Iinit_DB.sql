create sequence hibernate_sequence start 1 increment 1;

create table comment (
  id int8 not null,
  date date,
  dislikes int4 not null,
  likes int4 not null,
  message varchar(255),
  author_id int8,
  note_id int8,
  comment_id int8,
primary key (id)
);
