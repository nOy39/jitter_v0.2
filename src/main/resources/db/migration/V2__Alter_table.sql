alter table if
  exists comment
  add constraint FK23kl900eipat1xpq25pqp63cy
  foreign key (author_id)
  references usr;

  alter table if
  exists comment
  add constraint
  FK41heeawfghvw9jccau0d1tjox
  foreign key (note_id)
  references note;

  alter table if
  exists comment
  add constraint FKb5kenf6fjka6ck0snroeb5tmh
  foreign key (project_id)
  references project;

  alter table if
  exists comment
  add constraint FKmk3c8pbvysjndxywunibl2voc
  foreign key (comment_id)
  references comment;

alter table if
exists desk
add constraint FKeiy57qht3qd4bp4dagfmyuadk
foreign key (project_id)
references project;

alter table if
exists history
add constraint FKq3ab874r0wh41ihfkv5aieboq
foreign key (user_id)
references usr;

alter table if
exists history
add constraint FKhcuxn9git8if7hp5vhbr6ehdh
foreign key (desk_id)
references desk;

alter table if
exists history
add constraint
FKj79ki10l1mxxckri1mogniss5
foreign key (note_id)
references note;

alter table if
exists history
add constraint
FKo85y510lpxvd8vyk32diab6qq
foreign key (project_id)
references project;

alter table if
exists message
add constraint
FK70bv6o4exfe3fbrho7nuotopf
foreign key (user_id)
references usr;

alter table if
exists note
add constraint
FKgq77x35wnx2x13llb4w8q9yg4
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
exists tag
add constraint FKs5kjlptmpwpchvu0he6d62wo0
foreign key (user_id)
references usr;

alter table if
exists tag
add constraint FKbyy56vice9njgl86752up8120
foreign key (project_id)
references project;

alter table if
exists upload_file
add constraint FK97mxbnys7ss637igxx2y2b1ru
foreign key (user_id)
references usr;

alter table if
exists upload_file
add constraint FK6lm7h9icwohhb4n08wao2g3cb
foreign key (desk_id)
references desk;

alter table if
exists upload_file
add constraint FK2er7kv46mwkjibjcymyknfxnm
foreign key (note_id)
references note;

alter table if
exists upload_file
add constraint FKie7yxq5twm88x0aerd9332qd9
foreign key (project_id)
references project;

alter table if
exists user_role
add constraint FKfpm8swft53ulq2hl11yplpr5
foreign key (user_id)
references usr;