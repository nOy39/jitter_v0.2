create table project (
  id int8 not null,
  created_date varchar(255),
  deadline_date varchar(255),
  description varchar(255),
  isactive boolean not null,
  prj_name varchar(255),
  publ boolean not null,
  uniqid varchar(255),
  user_id int8,
  primary key (id)
);

create table project_role (
  id int8 not null,
  user_id int8,
  project_id int8,
  share_id int8,
  primary key (id)
);
