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
