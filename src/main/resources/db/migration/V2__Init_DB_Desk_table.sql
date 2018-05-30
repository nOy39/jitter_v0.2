create table desk (
  id int8 not null,
  class_style varchar(255),
  is_public boolean not null,
  name varchar(255),
  project_id int8,
  primary key (id)
);
