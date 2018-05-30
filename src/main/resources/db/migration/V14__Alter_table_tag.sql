alter table if
    exists tag
    add constraint FKs5kjlptmpwpchvu0he6d62wo0
    foreign key (user_id)
    references usr;

alter table if
  exists tag
  add constraint FKbyy56vice9njgl86752up8120
  foreign key (project_id)
  references project;
