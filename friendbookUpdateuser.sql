USE friendbook
go
CREATE PROC friend_Update
		@Email VARCHAR(25),
		@friendEmail VARCHAR(25)
AS 
BEGIN 
 
UPDATE friend
SET  Email = @email,
     FriendEmail = @FriendEmail
WHERE  Email = @Email
END
GO