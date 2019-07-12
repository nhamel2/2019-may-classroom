
--USE

Drop Trigger TR_foreign_key_check_for_GradeToStudent_Good
Go
Create Trigger TR_foreign_key_check_for_GradeToStudent_Good
On MickeyMouseGrade
For Update, Insert
As
BEGIN
	if @@ROWCOUNT > 0 and UPDATE(StudentID)
		BEGIN
			If exists	(Select	'x'
						 From	inserted
						 where	StudentID not in	(Select StudentID
													 from MickeyMouseStudent
													)
						)
				BEGIN
					Rollback Transaction
					Raiserror ('Not a valid StudentID',16,1)
				END
		END
END
Return
go
