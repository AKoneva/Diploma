use notes;

DROP TABLE IF EXISTS `members`; 

CREATE TABLE IF NOT EXISTS `members`(
id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
isactive BOOLEAN  NOT NULL,
createtime DATETIME  NOT NULL ,
modifytime DATETIME NOT NULL  ,
photo BLOB  ,
note TEXT ,
firstname VARCHAR(255) ,
lastname VARCHAR(255)  ,
nickname VARCHAR(255)  ,
dateofbirth DATETIME NOT NULL ,
email VARCHAR(255)  ,
interests VARCHAR(255)
)ENGINE=INNODB; 


drop procedure if exists AddMember;
delimiter $$
create procedure AddMember(
		IN IsActive BOOLEAN ,
		IN CreateTime datetime  ,
		IN ModifyTime datetime  ,
		IN Photo BLOB ,
		IN Note TEXT ,
		IN FirstName VARCHAR(255) ,
		IN LastName VARCHAR(255) ,
		IN NickName VARCHAR(255) ,
		IN DateOfBirth datetime  ,
		IN Email VARCHAR(255) ,
		IN Interests VARCHAR(255) ,
		OUT Id int )

begin

	INSERT INTO `members`
	(isactive ,
	createtime ,
	modifytime ,
	photo ,
	note ,
	firstname ,
	lastname ,
	nickname ,
	dateofbirth ,
	email ,
	interests)
	VALUES
	( 
	IsActive ,
	CreateTime ,
	ModifyTime ,
	Photo ,
	Note ,
	FirstName ,
	LastName ,
	NickName ,
	DateOfBirth ,
	Email ,
	Interests );

set Id = last_insert_id();
end$$
delimiter ;


drop procedure if exists GetMemberById;
delimiter $$
create procedure GetMemberById(IN Id int)
begin
select * from `members` where `members`.id = Id;
end$$
delimiter ;

drop procedure if exists UpdateMember;
delimiter $$
create procedure UpdateMember(
		IN Id int,
		IN IsActive BOOLEAN ,
		IN CreateTime datetime  ,
		IN ModifyTime datetime  ,
		IN Photo BLOB ,
		IN Note TEXT ,
		IN FirstName VARCHAR(255) ,
		IN LastName VARCHAR(255) ,
		IN NickName VARCHAR(255) ,
		IN DateOfBirth datetime  ,
		IN Email VARCHAR(255) ,
		IN Interests VARCHAR(255))
begin

	UPDATE `members`
	SET 
	`members`.isactive = IsActive ,
	`members`.createtime = CreateTime ,
	`members`.modifytime = ModifyTime ,
	`members`.photo = Photo ,
	`members`.note = Note ,
	`members`.firstname = FirstName ,
	`members`.lastname = LastName ,
	`members`.nickname = NickName ,
	`members`.dateofbirth = DateOfBirth ,
	`members`.email = Email ,
	`members`.interests = Interests 
	WHERE id = Id;

/*create procedure UpdateMember(IN LastName VARCHAR(255), IN FirstName VARCHAR(255), IN Photo BLOB, IN IsActive BOOLEAN, IN Note TEXT, IN Id INT)

update `members` set `members`.LastName = LastName, `members`.FirstName = FirstName, `members`.Photo = Photo, `members`.ModifyTime = NOW(), `members`.IsActive = IsActive, `members`.Note = Note where `members`.id = Id;*/
end$$
delimiter ;


drop procedure if exists DeleteMember;
delimiter $$
create procedure DeleteMember(IN Id INT)
begin

delete from `members` where `members`.id = Id;
 
end$$
delimiter ;
