use notes;

DROP TABLE IF EXISTS `notes`; 

CREATE TABLE IF NOT EXISTS `notes`(
id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
memberid int NOT NULL,
publishtime DATETIME NOT NULL  ,
modifytime DATETIME NOT NULL  ,
photo BLOB  ,
text TEXT ,
topic VARCHAR(255) 
)ENGINE=INNODB; 


drop procedure if exists AddNote;
delimiter $$
create procedure AddNote(IN MemberId int,
		IN PublishTime datetime  ,
		IN ModifyTime datetime  ,
		IN Photo BLOB ,
		IN Text TEXT ,
		IN Topic VARCHAR(255), 
		OUT Id int )

begin

	INSERT INTO `notes`
	(memberid ,
	publishtime ,
	modifytime ,
	photo ,
	topic ,
	text)
	VALUES
	( 
	MemberId ,
	PublishTime ,
	ModifyTime ,
	Photo ,
	Topic ,
	Text);

set Id = last_insert_id();
end$$
delimiter ;


drop procedure if exists GetNoteById;
delimiter $$
create procedure GetNoteById(IN Id int)
begin
select * from `notes` where `notes`.id = Id;
end$$
delimiter ;


drop procedure if exists GetNoteCollectionByMemberId;
delimiter $$
create procedure GetNoteCollectionByMemberId(IN MemberId int)
begin
select * from `notes` where `notes`.memberid = MemberId;
end$$
delimiter ;


drop procedure if exists UpdateNote;
delimiter $$
create procedure UpdateNote(
		IN Id int,
		IN MemberId int,
		IN PublishTime datetime  ,
		IN ModifyTime datetime  ,
		IN Photo BLOB ,
		IN Text TEXT ,
		IN Topic VARCHAR(255))
begin

	UPDATE `notes`
	SET 
	`notes`.memberid = MemberId ,
	`notes`.publishtime = PublishTime ,
	`notes`.modifytime = ModifyTime ,
	`notes`.photo = Photo ,
	`notes`.topic = Topic ,
	`notes`.text = Text 
	WHERE id = Id;

end$$
delimiter ;


drop procedure if exists DeleteNote;
delimiter $$
create procedure DeleteNote(IN Id INT)
begin

delete from `notes` where `notes`.id = Id;
 
end$$
delimiter ;
