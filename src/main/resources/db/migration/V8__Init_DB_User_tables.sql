create table user_role (
  user_id int8 not null,
  roles varchar(255)
);

create table usr (
  id int8 not null,
  activation_code varchar(255),
  active boolean not null,
  avatar varchar(255),
  email varchar(255),
  firstname varchar(255),
  lastname varchar(255),
  password varchar(255),
  uniqid varchar(255),
  username varchar(255),
  primary key (id)
);

