
use notes;

insert into `users` (login, password, memberid) values ('login', 'pasword', 1);
insert into `members` (isactive, createtime, modifytime, photo, note, firstname, lastname, nickname, dateofbirth, email, interests) 
values (1, now(), now(), null, 'Some text', 'Ivan', 'Ivanov', 'nick','1980-12-18 13:17:17', 'nick@gmail.com', 'interests');

/*isactive BOOLEAN  NOT NULL,
createtime DATETIME  NOT NULL ,
modifytime DATETIME NOT NULL  ,
photo BLOB  ,
note TEXT ,
firstname VARCHAR(255) ,
lastname VARCHAR(255)  ,
nickname VARCHAR(255)  ,
dateofbirth DATETIME NOT NULL ,
email VARCHAR(255)  ,
interests VARCHAR(255)*/

select * from `users` where `users`.login = 'login';
select * from `members` where `members`.nickname = 'nick';