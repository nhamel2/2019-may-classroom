
USE [IQSchool]

--1.	In order to be fair to all students, a student can only belong to a maximum of 3 clubs. Create a trigger to enforce this rule.
Create Trigger TR_Max3Clubs_Insert_Update
On Activity
For Insert, Update
As
If Update(StudentID) AND @@Rowcount >0
	Begin
	If Exists (Select * from Activity inner join inserted on Activity.studentID = inserted.studentid
	 Group by inserted.StudentID	having count(*) >3)
		Begin
		RaisError('You may only belong to a maximum of 3 clubs! ',16,1)
		Rollback Transaction
		End
	End
Return
GO

--2.	The Education Board is concerned with rising course costs! Create a trigger to ensure that a course cost does not get increased by more than 20% at any one time.
alter Trigger TR_CourseCostsIncrease_Update
On Course
For Update
As
If update(coursecost) and @@rowcount >0
	Begin	
	If Exists (Select * from inserted inner join deleted
	on inserted.CourseID = deleted.CourseID
	where inserted.CourseCost > deleted.CourseCost * 1.2)
		Begin
		RaisError('Students can''t afford that!',16,1)
		Rollback Transaction
		End
	End
Return
GO
--3.	Too many students owe us money and keep registering for more courses! Create a trigger to ensure that a student cannot register for any more courses if they have a balance owing of >$500.
Create Trigger TR_StudentOwes_Insert
on Registration
For Insert 
As 
If  @@rowcount>0
	Begin
			if exists(Select * from inserted inner join Student on Inserted.StudentID = Student.StudentID where BalanceOwing >500)
		Begin
		RaisError('You owe too much money already!',16,1)
		Rollback Transaction
		End
	End
Return
GO
--4.	4.	Our school DBA has suddenly become allergic to Foreign Key constraints and has disabled them in the database! Create a trigger on the Registration table to ensure that only valid StudentID�s and OfferingCodes are used for registration records. Use sp_help tablename, object explorer, or the IQSchool script to find the name of the foreign key constraints you need to disable to test your trigger. Try and have the trigger raise an error for each foreign key that is not valid. 
Alter Table registration
nocheck constraint fk_RegistrationToOffering
Alter Table registration
nocheck constraint fk_RegistrationToStudent
GO

Create Trigger TR_ValidRegistration_Insert_Update
On registration
For Insert, Update
As
If @@rowcount >0
	Begin
	If update(StudentID)
		Begin
		If exists (Select * from inserted where studentid not in (select studentid from student))
			Begin
			RaisError('That is not a valid Student ID',16,1)
			rollback transaction
			End
		End
	 If update(OfferingCode)
		Begin
		If exists (Select * from inserted where offeringCode not in (Select offering code from offering))
			Begin
			RaisError('That is not a valid Course ID',16,1)
			rollback transaction
			End
		End				
	End
Return	


select * from Registration
--the above solution will have problems since the inserted table is empty after a rollback. the
--next if not exists will all not exist. Also, the second rollback will not have a corresponding begin transaction if the first statement rolled back. Fix by the using a flag variable instead.
go
Create Trigger TR_ValidRegistration_Insert_Update_with_flag
On registration
For Insert, Update
As
If @@rowcount >0
	Begin
	declare @valid char(1)
	set @valid = 'T'
	If update(StudentID)
		Begin
		If exists (Select * from inserted where studentid not in (select studentid from student))
			Begin
			RaisError('That is not a valid Student ID',16,1)
			set @valid = 'F'
			End
		End
	 If update(OfferingCode)
		Begin
		If exists (Select * from inserted where offeringCode not in (Select offering code from offering))
			Begin
			RaisError('That is not a valid Course ID',16,1)
			set @valid = 'F'
			End
		End			
	
	if @valid = 'F'
		Begin
		Rollback Transaction
		End
	End
Return	

GO
--OR simply Raise a common error message with this trigger
Create Trigger TR_ValidRegistration_Insert_Update_Common_Message
On registration
For Insert, Update
As
If @@rowcount >0
	Begin
	If update(StudentID) or update(OfferingCode) 
		Begin
		If exists (Select * from inserted where studentid not in (select studentid from student))
		or  exists (Select * from inserted where offeringCode not in (Select offering code from offering))
			Begin
			RaisError('Student ID or Staff ID or Course ID is not valid',16,1)
			Rollback Transaction
			End
		End
	End
Return	
GO
--5.	Contrary to the advice of the school doctor, the DBA still thinks he is allergic to Foreign Key constraints! Yikes! Create a trigger on the Student table that will ensure that we do not delete any students that have made payments, have Registration records, or belong to any clubs.
Alter Table Registration
nocheck constraint fk_registrationToStudent
Alter Table Activity 
nocheck constraint fk_ActivityToStudent
Alter Table Payment
nocheck constraint fk_PaymentToStudent
GO
Create Trigger TR_ValidStudentDelete_Delete
On Student
For Delete
As
Declare @Commit char(1)
Set @Commit = 'T'
If @@rowcount >0
	Begin
	If  exists (Select * from Deleted inner join payment on Deleted.StudentID = Payment.StudentID)
		Begin
		RaisError('Student has payments. Cannot Delete',16,1)
		Set @Commit = 'F'
		End
	If  exists (Select * from Deleted inner join registration on	Deleted.StudentID = Registration.StudentID)
		Begin
		RaisError('Student has Registrations. Cannot Delete',16,1)
		Set @Commit = 'F'
		End
	If  exists (Select * from Deleted inner join Activity on Deleted.StudentID = Activity.StudentID)
		Begin
		RaisError('Student has activities. Cannot Delete',16,1)
		Set @Commit = 'F'
		End
	End
If @Commit = 'F'
	Begin
	Rollback Transaction
	End
Return	
GO
--OR simply Raise a common error message with this trigger
Create Trigger TR_ValidStudentDelete_Delete_Common_Message
On Student
For Delete
As
Declare @Commit char(1)
Set @Commit = 'T'
If @@rowcount >0
	Begin
	If  exists (Select * from Deleted inner join payment on Deleted.StudentID = Payment.StudentID)
	or exists (Select * from Deleted inner join registration on	Deleted.StudentID = registration.StudentID)
	or exists (Select * from Deleted inner join Activity on Deleted.StudentID = Activity.StudentID)
		Begin
		RaisError('Student has payments. Cannot Delete',16,1)
		Rollback Transaction
		End
	End
Return
GO
--6.	6.	Not only has the school DBA come down with some mysterious allergy but our network security officer suspects our system has a virus that is allowing students to alter their Registration records! In order to track down what is happening we want to create a logging table that will log any changes to the mark in the registration table. You must create the logging table and the trigger to populate it when a mark is updated.
Create Table BalanceOwingLog
(
LogID int  identity (1,1) not null constraint pk_GradeLog Primary Key clustered,
StudentID int not null,
ChangeDateTime datetime not null,
OldBalance decimal (7,2) not null,
NewBalance decimal (7,2) not null
)
go
Create Trigger TR_BalanceLog_Update
on Student
For Update
As
If @@rowcount >0 and update (BalanceOwing)
	Begin
	insert into BalanceOwingLog (StudentID,ChangedateTime,OldBalance,NewBalance)
	select inserted.StudentID, getdate(),deleted.BalanceOwing, inserted.BalanceOwing from deleted inner join inserted on deleted.studentid = inserted.studentid
	
	End
Return
--7.	7.	We have learned it is a bad idea to update primary keys. Yet someone keeps trying to update the Club tables ClubID column and the Course tables CourseId column! Create a trigger(s) to stop this from happening! You are authorized to use whatever force is necessary! Well, in your triggers, anyways!
go
Create Trigger TR_NoClubPKUpdate_Update
On Club
For Update
As
If @@rowcount >0 and update(ClubID)
	Begin
	RaisError('You cannot update the Club ID!',16,1)
	Rollback Transaction
	End
Return
go
Create Trigger TR_NoCoursePKUpdate_Update
On Course
For Update
As
If @@rowcount >0 and update(CourseID)
	Begin
	RaisError('You cannot update the course ID!',16,1)
	Rollback Transaction
	End
Return


