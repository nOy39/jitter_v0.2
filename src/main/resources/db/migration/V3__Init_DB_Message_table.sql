create table message (
  id int8 not null,
  filename varchar(255),
  head varchar(255),
  tag varchar(255),
  text varchar(255),
  user_id int8,
  primary key (id)
);
