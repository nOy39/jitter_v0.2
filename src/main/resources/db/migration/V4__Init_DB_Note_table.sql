create table note (
  id int8 not null,
  created timestamp,
  dead_line timestamp,
  description varchar(255),
  done boolean not null,
  message varchar(255),
  name varchar(255),
  user_id int8,
  desk_id int8,
  project_id int8,
  primary key (id)
);
