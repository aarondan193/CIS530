USE [friendbook]
GO

select * from userAccount;
select * from friend;

EXEC	friendbook_create
		@name = 'Rachel',
		@ADDRESS = '333 test lane',
		@email = '12345@gmail.com',
		@phone = '123333456'

EXEC	friend_read_getfriends
		@email = '12345@gmail.com'

select * from userAccount;
select * from friend;

EXEC	friend_create_addfriend
		@email = '12345@gmail.com',
		@friendemail = 'test@yahoo.com'

select * from userAccount;
select * from friend;

EXEC	friend_create_addfriend
		@email = '12345@gmail.com',
		@friendemail = 'test@yahoo.com'

EXEC	friend_delete_removefriend
		@email = '12345@gmail.com',
		@friendemail = 'test@yahoo.com'

select * from userAccount;
select * from friend;
