alter table if
  exists project
  add constraint FKbfnwrq5lwqynoyfy2p5vfkr77
  foreign key (user_id)
  references usr;

alter table if
  exists project_role
  add constraint FKpg4s26pt75twq85tatfuig4sq
  foreign key (user_id)
  references usr;

alter table if
  exists project_role
  add constraint FKpfnbi8wmwbr6ddejkm9fxoat8
  foreign key (project_id)
  references project;

alter table if
  exists project_role
  add constraint FKi60642yjvijvldv0pbvte3e5y
  foreign key (share_id)
  references project;
