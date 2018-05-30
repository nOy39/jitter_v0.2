create table upload_file (
  id int8 not null,
  filename varchar(255),
  original_name varchar(255),
  user_id int8,
  desk_id int8,
  note_id int8,
  primary key (id)
);
