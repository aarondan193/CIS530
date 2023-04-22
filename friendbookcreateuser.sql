use friendbook
GO
CREATE PROCEDURE friendbook_create
	    @NAME VARCHAR(25),
		@ADDRESS VARCHAR(50),
		@email varchar(50),
		@phone varchar(25)
AS
BEGIN
INSERT INTO userAccount(
	   [NAME],
	   [ADDRESS],
	   [email],
	   [phone])
    VALUES(
	   @Name,
	   @ADDRESS,
	   @Email,
	   @Phone
	   )

	   SET @Email = SCOPE_IDENTITY()
 
SELECT 
	   Name = @NAME,
	   Address = @ADDRESS,
	   Email	= @Email,
	   Phone = @Phone

FROM userAccount 
WHERE  Email = @Email
END
 
 
