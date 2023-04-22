USE friendbook
go
CREATE PROC friendbookDelete 
    @email varchar(50)
AS 
BEGIN 
DELETE
FROM   userAccount
WHERE  email = @email
 
END
GO