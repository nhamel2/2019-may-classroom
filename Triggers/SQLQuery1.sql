USE [IQSchool]
GO


--1
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Trigg001]'))
    DROP TRIGGER Trigg001
GO

CREATE TRIGGER Trigg001
ON Activity
FOR INSERT, UPDATE
AS
IF UPDATE(StudentID) AND @@ROWCOUNT > 0 
BEGIN
	IF EXISTS (	SELECT * 
				FROM Activity A
						INNER JOIN inserted I ON I.StudentID = A.StudentID
				GROUP BY I.StudentID
				HAVING COUNT(*) > 3)
	BEGIN
		RAISERROR('Student can only be in a max of 3 clubs', 16, 1)
		ROLLBACK TRANSACTION
	END
END
RETURN
GO


--2
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Trigg002]'))
    DROP TRIGGER Trigg002
GO

CREATE TRIGGER Trigg002
ON Course
FOR UPDATE
AS
IF UPDATE(CourseCost) AND @@ROWCOUNT > 0 
BEGIN
	IF EXISTS (	SELECT * 
				FROM inserted I
						INNER JOIN deleted D ON D.CourseId = I.CourseId

				WHERE I.CourseCost > (D.CourseCost * 1.20))
	BEGIN
		RAISERROR('Course Cost can increase by a maximum of 20%', 16, 1)
		ROLLBACK TRANSACTION
	END
END
RETURN
GO

--3
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Trigg003]'))
    DROP TRIGGER Trigg003
GO

CREATE TRIGGER Trigg003
ON Registration
FOR INSERT
AS
IF @@ROWCOUNT > 0 
BEGIN
	IF EXISTS (	SELECT * 
				FROM inserted I
						INNER JOIN Student S ON S.StudentID = I.StudentID

				WHERE BalanceOwing > 500)
	BEGIN
		RAISERROR('Cannot register for more courses if owe more than $500', 16, 1)
		ROLLBACK TRANSACTION
	END
END
RETURN
GO

--4
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Trigg004]'))
    DROP TRIGGER Trigg004
GO

CREATE TRIGGER Trigg004
ON Registration
FOR INSERT, UPDATE
AS
IF @@ROWCOUNT > 0 
BEGIN
	IF UPDATE(StudentID) OR UPDATE(OfferingCode)
	BEGIN
		IF EXISTS (	SELECT * 
					FROM inserted 
					WHERE StudentID NOT IN (SELECT StudentID FROM Student))
		OR EXISTS (	SELECT * 
					FROM inserted 
					WHERE OfferingCode NOT IN (SELECT OfferingCode FROM Offering))
			BEGIN
				RAISERROR('Student ID or Offering Code not valid', 16, 1)
				ROLLBACK TRANSACTION
			END
	END
END
RETURN
GO


--5
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Trigg005]'))
    DROP TRIGGER Trigg005
GO

CREATE TRIGGER Trigg005
ON Registration
FOR DELETE
AS
IF @@ROWCOUNT > 0 
BEGIN
	IF UPDATE(StudentID) OR UPDATE(OfferingCode)
	BEGIN
		IF EXISTS (	SELECT * 
					FROM deleted D
							INNER JOIN Payment P ON P.StudentID = D.StudentID)
		OR EXISTS (	SELECT * 
					FROM deleted D
							INNER JOIN Registration R ON R.StudentID = D.StudentID)
		OR EXISTS (	SELECT * 
					FROM deleted D
							INNER JOIN Activity A ON A.StudentID = D.StudentID)
			BEGIN
				RAISERROR('Student still hass payments or registrations or belongs to a club', 16, 1)
				ROLLBACK TRANSACTION
			END
	END
END
RETURN
GO

--6
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Trigg006]'))
    DROP TRIGGER Trigg006
GO

CREATE TRIGGER Trigg006
ON Student
FOR UPDATE
AS
IF UPDATE(BalanceOwing) AND @@ROWCOUNT > 0 
BEGIN
	INSERT INTO LogTable(StudentID, Changedate, OldValue, NewValue)
	SELECT I.StudentID, GETDATE(), D.BalanceOwing, I.BalanceOwing
	FROM deleted D
			INNER JOIN inserted I ON I.StudentID = D.StudentID
END

RETURN
GO



--7
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Trigg007a]'))
    DROP TRIGGER Trigg007a
GO

CREATE TRIGGER Trigg007a
ON Club
FOR UPDATE
AS
IF UPDATE(ClubID) AND @@ROWCOUNT > 0 
BEGIN
	RAISERROR ('Club ID cannot be changed', 16, 1)
	ROLLBACK TRANSACTION
END
RETURN
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Trigg007a]'))
    DROP TRIGGER Trigg007a
GO

CREATE TRIGGER Trigg007a
ON Student
FOR UPDATE
AS
IF UPDATE(StudentID) AND @@ROWCOUNT > 0 
BEGIN
	RAISERROR ('Student ID cannot be changed', 16, 1)
	ROLLBACK TRANSACTION
END
RETURN
GO