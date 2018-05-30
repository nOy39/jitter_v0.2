alter table if
  exists note
  add constraint FKgq77x35wnx2x13llb4w8q9yg4
  foreign key (user_id)
  references usr;

alter table if
  exists note
  add constraint
  FKc9dt6wl7hxffi0mduw9fj50b7
  foreign key (desk_id)
  references desk;

alter table if
  exists note
  add constraint FKdyhnx444m2t6sb8hn85wfp5g3
  foreign key (project_id)
  references project;
