insert into usr(id, username, password, active,uniqid,email,firstname,lastname)
    values (1,'admin','admin',true,'Ibah128<bn-1234567890','email@email.com','admin','admin');

insert into user_role (user_id, roles)
values (1, 'USER'), (1, 'ADMIN');