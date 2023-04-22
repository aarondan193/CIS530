USE friendbook
go
CREATE PROC friend_delete_removefriend 
    @email varchar(50),
	@friendemail varchar(50)
AS 
BEGIN 
DELETE
FROM   friend
WHERE  email = @email and friendemail = @friendemail

DELETE
FROM   friend
WHERE  friendemail = @email and email = @friendemail
 
END
GO