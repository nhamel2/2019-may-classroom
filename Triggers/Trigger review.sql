--You Can Do This

USE [IQSchool]
GO

/*
In order to be fair to all students, a student can only belong to a maximum of 3 clubs. Create a trigger to enforce this rule.
*/
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TriggerReview_EX01]'))
    DROP TRIGGER TriggerReview_EX01
GO
CREATE TRIGGER TriggerReview_EX01
ON	Activity
FOR	INSERT, UPDATE
AS
IF UPDATE(StudentID) AND @@ROWCOUNT > 0
BEGIN
	IF EXISTS(	SELECT	*
				FROM	Activity A
							INNER JOIN inserted I ON I.StudentID = A.StudentID
				GROUP BY I.StudentID 
				HAVING	 COUNT(*) > 3	)
	BEGIN
		RAISERROR('Student may only belong to a maximum of 3 clubs', 16, 1)
		ROLLBACK TRANSACTION
	END
END
RETURN
GO

/*
The Education Board is concerned with rising course costs! Create a trigger to ensure that a course cost does not get increased by more than 20% at any one time.
*/
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TriggerReview_EX02]'))
    DROP TRIGGER TriggerReview_EX02
GO
CREATE TRIGGER TriggerReview_EX02
ON	Course
FOR	UPDATE
AS
IF UPDATE(CourseCost) AND @@ROWCOUNT > 0
BEGIN
	IF EXISTS(	SELECT	*
				FROM	inserted I
							INNER JOIN deleted D ON I.CourseId = D.CourseId
				WHERE	I.CourseCost > (D.CourseCost * 1.20)	)
	BEGIN
		RAISERROR('Course Cost cannot increase more than 20%', 16, 1)
		ROLLBACK TRANSACTION
	END
END
RETURN
GO


/*
Too many students owe us money and keep registering for more courses! Create a trigger to ensure that a student cannot register for any more courses if they have a balance owing of >$500.
*/
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TriggerReview_EX03]'))
    DROP TRIGGER TriggerReview_EX03
GO
CREATE TRIGGER TriggerReview_EX03
ON	Registration
FOR	INSERT
AS
IF @@ROWCOUNT > 0
BEGIN
	IF EXISTS(	SELECT	*
				FROM	inserted I
							INNER JOIN Student S ON S.StudentID = I.StudentID
				WHERE	BalanceOwing > 500	)
	BEGIN
		RAISERROR('Student owes too much money to register for another course', 16, 1)
		ROLLBACK TRANSACTION
	END
END
RETURN
GO

/*
Our school DBA has suddenly become allergic to Foreign Key constraints and has disabled them in the database! Create a trigger on the Registration table to ensure that only valid CourseID’s, 
StudentID’s and StaffID’s are used for grade records. Use sp_help tablename to find the name of the foreign key constraints you need to disable to test your trigger. Try and have the trigger raise 
an error for each foreign key that is not valid. If you have trouble with this question create the trigger so it just checks for a valid student ID.
*/


ALTER TABLE Registration
NOCHECK CONSTRAINT fk_RegistrationToOffering
ALTER TABLE Registration
NOCHECK CONSTRAINT fk_RegistrationToStudent
GO



IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TriggerReview_EX04]'))
    DROP TRIGGER TriggerReview_EX04
GO
CREATE TRIGGER TriggerReview_EX04
ON	Registration
FOR	INSERT, UPDATE
AS
IF @@ROWCOUNT > 0
BEGIN
	IF UPDATE(StudentID) OR UPDATE(OfferingCode)
	BEGIN
		IF EXISTS (	SELECT *
					FROM inserted
					WHERE StudentID NOT IN (SELECT StudentID
											FROM	Student))
		OR	EXISTS (	SELECT *
						FROM inserted
						WHERE OfferingCode NOT IN (	SELECT OfferingCode
													FROM	Offering))
		BEGIN
			RAISERROR('Student ID or Course ID is NOT valid', 16, 1)
			ROLLBACK TRANSACTION
		END
	END
END
RETURN
GO

/*
Contrary to the advice of the school doctor, the DBA still thinks he is allergic to Foreign Key constraints! Yikes! Create a trigger on the Student table that will ensure that we do not delete 
any students that have made payments, have Registration records, or belong to any clubs.
*/
ALTER TABLE Registration
NOCHECK CONSTRAINT fk_registrationToStudent
ALTER TABLE Activity 
NOCHECK CONSTRAINT fk_ActivityToStudent
ALTER TABLE Payment
NOCHECK CONSTRAINT fk_PaymentToStudent
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TriggerReview_EX05]'))
    DROP TRIGGER TriggerReview_EX05
GO
CREATE TRIGGER TriggerReview_EX05
ON	Registration
FOR	DELETE
AS
IF @@ROWCOUNT > 0
BEGIN
	IF EXISTS (	SELECT *
				FROM deleted D
						INNER JOIN Payment P ON P.StudentID = D.StudentID)
	OR	EXISTS (	SELECT *
				FROM deleted D
						INNER JOIN Registration R ON R.StudentID = D.StudentID)
	OR	EXISTS (	SELECT *
				FROM deleted D
						INNER JOIN Activity A ON A.StudentID = D.StudentID)
	BEGIN
		RAISERROR('Cannot delete student, has payments, or has records, or belongs to a club', 16, 1)
		ROLLBACK TRANSACTION
	END
END
RETURN
GO


/*
Not only has the school DBA come down with some mysterious allergy but our network security officer suspects our system has a virus that is allowing students to alter their Balance Owing! In order to
track down what is happening we want to create a logging table that will log any changes to the balanceowing in the student table. You must create the logging table and the trigger to populate it 
when a balance owing is updated.
*/
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'BalanceOwingLog')
	DROP TABLE BalanceOwingLog
GO

CREATE TABLE BalanceOwingLog
(
	LogID						int  
		CONSTRAINT PK_BalanceOwingLog_LogID
			PRIMARY KEY							
		IDENTITY(1, 1)							NOT NULL, 
	StudentID					int				NOT NULL,
	ChangeDateTime			datetime			NOT NULL,
	OldBalance				decimal (7,2)		NOT NULL,
	NewBalance				decimal (7,2)		NOT NULL
)
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TriggerReview_EX06]'))
    DROP TRIGGER TriggerReview_EX06
GO
CREATE TRIGGER TriggerReview_EX06
ON	Student
FOR	UPDATE
AS
IF UPDATE(BalanceOwing) AND @@ROWCOUNT > 0
BEGIN
	INSERT INTO BalanceOwingLog (StudentID, ChangedateTime, OldBalance, NewBalance)
	SELECT I.StudentID, GETDATE(), D.BalanceOwing, I.BalanceOwing
	FROM deleted D
			INNER JOIN inserted I ON I.StudentID = D.StudentID
END
RETURN
GO


/*
We have learned it is a bad idea to update primary keys. Yet someone keeps trying to update the Club tables ClubID column and the Course tables CourseId column! Create a trigger(s) to stop this 
from happening! You are authorized to use whatever force is necessary! Well, in your triggers, anyways !
*/

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TriggerReview_EX07a]'))
    DROP TRIGGER TriggerReview_EX07a
GO
CREATE TRIGGER TriggerReview_EX07a
ON	Club
FOR	UPDATE
AS
IF UPDATE(ClubID) AND @@ROWCOUNT > 0
BEGIN
	RAISERROR('Club ID cannot be changed', 16, 1)
	ROLLBACK TRANSACTION
END
RETURN
GO


IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TriggerReview_EX07b]'))
    DROP TRIGGER TriggerReview_EX07b
GO
CREATE TRIGGER TriggerReview_EX07b
ON	Course
FOR	UPDATE
AS
IF UPDATE(CourseID) AND @@ROWCOUNT > 0
BEGIN
	RAISERROR('Course ID cannot be changed', 16, 1)
	ROLLBACK TRANSACTION
END
RETURN
GO