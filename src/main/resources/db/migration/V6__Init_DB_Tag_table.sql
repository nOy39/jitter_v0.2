create table tag (
  id int8 not null,
  color varchar(255),
  name varchar(255),
  user_id int8,
  project_id int8,
  primary key (id)
);
