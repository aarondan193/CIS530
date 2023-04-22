use friendbook
GO
CREATE PROCEDURE friend_create_addfriend
	    @email VARCHAR(50),
		@friendemail VARCHAR(50)
AS
BEGIN
INSERT INTO friend(
	   [email],
	   [friendEmail]
	   )
    VALUES(
	   @email,
	   @friendemail
	   )

	   SET @Email = SCOPE_IDENTITY()
 
SELECT 
	   Email	= @Email,
	   friendEmail = @friendemail

FROM friend 
WHERE  Email = @Email
END
 
 
