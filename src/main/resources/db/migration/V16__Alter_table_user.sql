alter table if
  exists user_role
  add constraint FKfpm8swft53ulq2hl11yplpr5
  foreign key (user_id)
  references usr;