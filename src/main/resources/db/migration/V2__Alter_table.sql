alter table if exists comment
add constraint FK9asue0b657ka6wa0itjmnjf98
foreign key (desk_id) references desk;

alter table if exists comment
add constraint FK41heeawfghvw9jccau0d1tjox
foreign key (note_id) references note;

alter table if exists comment
add constraint FKgcgdcgly6u49hf4g8y2di3g4p
foreign key (user_id) references usr;

alter table if exists desk
add constraint FKeiy57qht3qd4bp4dagfmyuadk
foreign key (project_id) references project;

alter table if exists message
add constraint FK70bv6o4exfe3fbrho7nuotopf
foreign key (user_id) references usr;

alter table if exists note
add constraint FKgq77x35wnx2x13llb4w8q9yg4
foreign key (user_id) references usr;

alter table if exists note
add constraint FKc9dt6wl7hxffi0mduw9fj50b7
foreign key (desk_id) references desk;

alter table if exists note
add constraint FKdyhnx444m2t6sb8hn85wfp5g3
foreign key (project_id) references project;

alter table if exists project
add constraint FKbfnwrq5lwqynoyfy2p5vfkr77
foreign key (user_id) references usr;

alter table if exists tag
add constraint FKs5kjlptmpwpchvu0he6d62wo0
foreign key (user_id) references usr;

alter table if exists tag
add constraint FKbyy56vice9njgl86752up8120
foreign key (project_id) references project;

alter table if exists upload_file
add constraint FK97mxbnys7ss637igxx2y2b1ru
foreign key (user_id) references usr;

alter table if exists upload_file
add constraint FK6lm7h9icwohhb4n08wao2g3cb
foreign key (desk_id) references desk;

alter table if exists upload_file
add constraint FK2er7kv46mwkjibjcymyknfxnm
foreign key (note_id) references note;

alter table if exists user_role
add constraint FKfpm8swft53ulq2hl11yplpr5
foreign key (user_id) references usr;