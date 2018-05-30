alter table if
  exists comment
  add constraint FK23kl900eipat1xpq25pqp63cy
  foreign key (author_id)
  references usr;

alter table if
  exists comment
  add constraint FK41heeawfghvw9jccau0d1tjox
  foreign key (note_id)
  references note;

alter table if
  exists comment
  add constraint FKmk3c8pbvysjndxywunibl2voc
  foreign key (comment_id)
  references comment;
