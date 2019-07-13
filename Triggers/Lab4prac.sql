USE [SQL-1]
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Lab4_Q1]'))
    DROP TRIGGER Lab4_Q1 
GO
CREATE TRIGGER Lab4_Q1 
ON	Title
FOR	UPDATE
AS
IF UPDATE(SuggestedPrice) AND @@ROWCOUNT > 0
BEGIN
	IF EXISTS(	SELECT * 
				FROM inserted I
						INNER JOIN deleted D ON D.SuggestedPrice = I.SuggestedPrice
				WHERE I.SuggestedPrice > (D.SuggestedPrice * 1.25))
	RAISERROR('Suggested price cannot increase by more than 25% at a time', 16, 1)
	ROLLBACK TRANSACTION
END
RETURN
GO



IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Lab4_Q2]'))
    DROP TRIGGER Lab4_Q2 
GO
CREATE TRIGGER Lab4_Q2 
ON	Title
FOR	UPDATE
AS
IF UPDATE(SuggestedPrice) AND @@ROWCOUNT > 0
BEGIN
	IF EXISTS(	SELECT * 
				FROM inserted I
						INNER JOIN deleted D ON D.SuggestedPrice = I.SuggestedPrice
				WHERE I.SuggestedPrice > (D.SuggestedPrice * 1.25))
	RAISERROR('Suggested price cannot increase by more than 25% at a time', 16, 1)
	ROLLBACK TRANSACTION
END
RETURN
GO

