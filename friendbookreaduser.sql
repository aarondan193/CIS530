USE friendbook
go

CREATE PROC friendbook_Read
    @email varchar(50)
AS 
BEGIN 
    SELECT *
    FROM   userAccount
    WHERE  (Email = @Email) 
END
GO