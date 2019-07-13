--Create database, tables, and populate with data

Create database Quiz4Review
Use Quiz4Review
--News 2 Go

Drop Table CustomerPaper
Drop Table Paper
Drop Table DeliveryType
Drop Table Customer
Drop Table Route
Drop Table Region
Drop Table DropSite
Drop Table Carrier
Drop Table Distributor

--Notice that the carrier now has a Y/N Active field

Create Table Carrier
(
	CarrierID int identity (1,1) not null
		Constraint PK_Carrier primary key clustered,		
	CarrierFirstName varchar(30) not null,
	CarrierLastName varchar(30) not null,
	Phone char(10) not null
		Constraint ck_Phone check (Phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Active char(1) not null
		Constraint CK_Active Check (Active like 'Y' or Active like 'N')
)

Create Table DropSite
(
	DropSiteId int not null
	Constraint PK_DropSite primary key clustered,
	DropSiteName varchar(50) not null,
	DropSiteAddress varchar(60) not null
)

Create Table Distributor
(
	DistributorID int identity (1,1) not null
	Constraint PK_Distributor primary key clustered,
	DistributorFirstName varchar(30) not null,
	DistributorLastName varchar(30) not null,
	PagerNumber char(10) not null
	Constraint ck_pager check (PagerNumber like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	wage smallmoney not null
	Constraint CK_wage
	check(wage >= 0)
	Constraint df_wage default 12.00 
)

Create Table Region
(
	RegionID int not null
	Constraint PK_Region primary key clustered,
	RegionName varchar(50) not null,
	RegionSupervisorFirstName varchar(30) not null,
	RegionSupervisorLastName varchar(30) not null,
	DistributorID int not null
	constraint fk_RegionToDistributor references Distributor(DistributorID)
)

Create Table Route 
(
	RouteID int not null
	Constraint PK_Route primary key clustered,
	RouteName varchar(50) not null,
	EstimatedTime varchar(3) not null,
	RegionID int not null
	Constraint FK_RouteToRegion
	references Region (RegionID),
	DropSiteID int not null
	Constraint FK_RouteToDropSite
	references DropSite (DropSiteID),
	CarrierId int not null
	Constraint FK_RouteToCarrier
	references Carrier (CarrierId)
)

Create Table Customer
(
	CustomerID int not null
	Constraint PK_Customer primary key clustered,
	CustomerFirstName varchar(30) not null,
	CustomerLastName varchar(30) not null,
	Address varchar(50) not null,
	City varchar(30) not null,
	Province char(2) not null
	Constraint ck_province check (Province Like '[A-Z][A-Z]')
	Constraint DF_Province Default 'AB',
	PC char(7) not null
	Constraint CK_PostalCode 
	Check (PC Like '[A-Z][0-9][A-Z] [0-9][A-Z][0-9]'),
	PrePaidTip smallmoney not null
	Constraint ck_prepaidtip check (PrepaidTip >=0)
	Constraint DF_PrepaidTip Default 0,
	RouteID int not null
	Constraint FK_CustomerToRoute
	references Route(RouteID)
)

Create Table DeliveryType 
(
	DeliveryTypeID smallint not null
	Constraint PK_DelieverType primary key clustered,
	DeliveryTypeDescription varchar(10) not null,
	DeliveryTypeCharge smallmoney not null
)

Create Table Paper
(
	PaperId smallint identity (1,1) not null
	Constraint PK_Paper primary key clustered, 
	PaperDescription varchar(30) not null
)

Create Table CustomerPaper 
(
	CustomerID int not null
	Constraint FK_CustomerPaperToCustomer
	references Customer (CustomerId),
	PaperID smallint not null
	Constraint FK_CustomerPaperToPaper
	references Paper (PaperId),
	DeliveryTypeID smallint not null
	Constraint FK_CustomerPaperToDeliveryType
	references DeliveryType (DeliveryTypeId),
	Constraint	PK_CustomerPaper_CustomerID_PaperID primary key clustered
	(CustomerID, PaperID)
)

--Insert data

--Paper Table
Insert into paper(PaperDescription)
Values('Journal')
Insert into paper(PaperDescription)
Values('Sun')
Insert into paper(PaperDescription)
Values('National Post')
Insert into paper(PaperDescription)
Values('Globe and Mail')

--Carrier Table
Insert into carrier(CarrierFirstName,CarrierLastName,Phone,Active)
values('Bub','Slug','5551245454', 'Y')
Insert into carrier(CarrierFirstName,CarrierLastName,Phone,Active)
values('Betty','Rubble','5558372716', 'Y')
Insert into carrier(CarrierFirstName,CarrierLastName,Phone,Active)
values('Luke','Skywalker','5558881212', 'Y')
Insert into carrier(CarrierFirstName,CarrierLastName,Phone,Active)
values('Princess','Leia','5558881212', 'Y')
Insert into carrier(CarrierFirstName,CarrierLastName,Phone,Active)
values('Bob','Barker','5558881212', 'Y')
Insert into carrier(CarrierFirstName,CarrierLastName,Phone,Active)
values('Rob','Tomlinson','5558881212', 'Y')


--Distributor Table
Insert into Distributor(DistributorFirstName, DistributorLastName, PagerNumber, Wage)
Values ('Homer', 'Simpson','5551222544', 15)
Insert into Distributor(DistributorFirstName, DistributorLastName, PagerNumber, Wage)
Values ('Marge', 'Simpson','8787772918', 16)
Insert into Distributor(DistributorFirstName, DistributorLastName, PagerNumber, Wage)
Values ('Lisa', 'Simpson','8889727272', 9)
Insert into Distributor(DistributorFirstName, DistributorLastName, PagerNumber, Wage)
Values ('Bart', 'Simpson','8887371777', 10)

--Region Table
Insert into Region (RegionID, RegionName, RegionSupervisorFirstName,RegionSupervisorLastName, DistributorID)
values (100,'Edmonton','Joni','Jones',1)
Insert into Region (RegionID, RegionName, RegionSupervisorFirstName,RegionSupervisorLastName, DistributorID)
values (200,'Sherwood Park','John','Jacobs',2)
Insert into Region (RegionID, RegionName, RegionSupervisorFirstName, RegionSupervisorLastName, DistributorID)
values (300,'St. Albert','Heather','Hollack',4)


--Drop Site Table
Insert into DropSite(DropSiteID, DropSiteName, DropSiteAddress)
values (10, 'Sherwood Park Mall','12232 Sherwood Drive')
Insert into DropSite(DropSiteID, DropSiteName, DropSiteAddress)
values (20, 'West Edmonton Mall','Edmonton')
Insert into DropSite(DropSiteID, DropSiteName, DropSiteAddress)
values (30, 'DownTown Library','DownTown')

--Route Table
Insert into Route (RouteID, RouteName, EstimatedTime, RegionID, DropSiteID,Carrierid)
values(1,'Riverbend','90',100,20,1)
Insert into Route (RouteID, RouteName, EstimatedTime, RegionID, DropSiteID,Carrierid)
values(5,'Mills Haven','60',200,20,1)
Insert into Route (RouteID, RouteName, EstimatedTime, RegionID, DropSiteID,Carrierid)
values(10,'North St.Albert','45',300,10,3)
Insert into Route (RouteID, RouteName, EstimatedTime, RegionID, DropSiteID,Carrierid)
values(20,'Millwoods','75',100,20,2)

--customer table
Insert into Customer (CustomerID,CustomerFirstName, CustomerLastName, Address, City, Province, PC, PrePaidTip, RouteID)
Values(1,'Jone', 'Simpson', '13312 121 street','Edmonton','AB','T3J 1J2',90,1)
Insert into Customer (CustomerID,CustomerFirstName, CustomerLastName, Address, City, Province, PC, PrePaidTip, RouteID)
Values(2,'Lisa', 'Jones', '16512 122 street','Edmonton','AB','T3J 1J2',55,20)
Insert into Customer (CustomerID,CustomerFirstName, CustomerLastName, Address, City, Province, PC, PrePaidTip, RouteID)
Values(3,'George', 'Forman', '63271 44 Avenue','St. Albert','AB','T1J 4J6',20,10)
Insert into Customer (CustomerID,CustomerFirstName, CustomerLastName, Address, City, Province, PC, PrePaidTip, RouteID)
Values(4,'Rob', 'smilie', '13312 121 street','Sherwood Park','AB','T3J 1J2',10,5)
Insert into Customer (CustomerID,CustomerFirstName, CustomerLastName, Address, City, Province, PC, PrePaidTip, RouteID)
Values(5,'Cyndi', 'Lauper', '13312 121 street','Sherwood Park','AB','T3J 1J2',10,5)
Insert into Customer (CustomerID,CustomerFirstName, CustomerLastName, Address, City, Province, PC, PrePaidTip, RouteID)
Values(6,'Bob', 'Marley', '13312 121 street','Edmonton','AB','T3J 1J2',95,1)
Insert into Customer (CustomerID,CustomerFirstName, CustomerLastName, Address, City, Province, PC, PrePaidTip, RouteID)
Values(7,'Elvis', 'Presely', '13312 121 street','Edmonton','AB','T3J 1J2',15,1)
Insert into Customer (CustomerID,CustomerFirstName, CustomerLastName, Address, City, Province, PC, PrePaidTip, RouteID)
Values(8,'Eric', 'Clapton', '13312 121 street','Sherwood Park','AB','T3J 1J2',75,5)
Insert into Customer (CustomerID,CustomerFirstName, CustomerLastName, Address, City, Province, PC, PrePaidTip, RouteID)
Values(9,'Dennis', 'Johnson', '13312 121 street','St. Albert','AB','T3J 1J2',45,10)
Insert into Customer (CustomerID,CustomerFirstName, CustomerLastName, Address, City, Province, PC, PrePaidTip, RouteID)
Values(10,'James', 'Douglas', '13312 121 street','Edmonton','AB','T3J 1J2',20,20)
Insert into Customer (CustomerID,CustomerFirstName, CustomerLastName, Address, City, Province, PC, PrePaidTip, RouteID)
Values(11,'Jay', 'Leno', '13312 121 street','Edmonton','AB','T3J 1J2',1,1)
Insert into Customer (CustomerID,CustomerFirstName, CustomerLastName, Address, City, Province, PC, PrePaidTip, RouteID)
Values(12,'Ethan', 'Little', '13312 121 street','Edmonton','AB','T3J 1J2',5,1)
Insert into Customer (CustomerID,CustomerFirstName, CustomerLastName, Address, City, Province, PC, PrePaidTip, RouteID)
Values(13,'Nathan', 'Tyler', '13312 121 street','Sherwood Park','AB','T3J 1J2',0,5)
Insert into Customer (CustomerID,CustomerFirstName, CustomerLastName, Address, City, Province, PC, PrePaidTip, RouteID)
Values(14,'Susan', 'McDonald', '13312 121 street','St. Albert','AB','T3J 1J2',0,10)
Insert into Customer (CustomerID,CustomerFirstName, CustomerLastName, Address, City, Province, PC, PrePaidTip, RouteID)
Values(15,'Betty', 'Carlson', '13312 121 street','Edmonton','AB','T3J 1J2',0,20)


--DeliveryType Table
Insert into DeliveryType (DeliveryTypeID, DeliveryTypeDescription, DeliveryTypeCharge)
values(1,'Daily',.50)
Insert into DeliveryType (DeliveryTypeID, DeliveryTypeDescription, DeliveryTypeCharge)
values(2,'Weekends',1.00)
Insert into DeliveryType (DeliveryTypeID, DeliveryTypeDescription, DeliveryTypeCharge)
values(3,'Friday',1.00)
Insert into DeliveryType (DeliveryTypeID, DeliveryTypeDescription, DeliveryTypeCharge)
values(4,'Sunday',1.00)


--CustomerPaper Table
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(1,1,2)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(1,2,4)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(2,1,1)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(3,1,1)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(1,4,1)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(4,1,2)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(5,1,2)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(6,1,2)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(7,3,2)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(8,1,2)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(9,3,2)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(10,1,1)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(11,1,1)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(12,1,1)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(13,1,1)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(14,1,1)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(15,1,1)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(10,2,1)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(13,2,1)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(11,3,1)
Insert into CustomerPaper (CustomerID,PaperID, DeliveryTypeID)
values(10,4,1)


Select * from Paper
Select * from carrier
Select * from distributor
Select * from region
Select * from dropsite
Select * from route
Select * from customer
Select * from deliverytype
Select * from customerPaper

--1. Create a trigger called TR_Region_Insert_Update that will add $5 to 
--the wage of a distributer when they are assigned a new region. This
--occurs when a record is added to the region table for that distributor
--or an existing region is changed from a different distributor to 
--that distributor.
Create trigger TR_Region_Insert_Update
on Region for Insert, Update As
If @@rowcount >0 and Update (DistributorID)
	Begin
	Update Distributor set Wage = Wage + 5
	where DistributorID in (select DistributorID from inserted)
	End
return

--Test
Select * from region		--Homer distributor 1
Select * from distributor	--Homer wage 15.00
sp_help region				--Copy column names
Insert Region (RegionID, RegionName, RegionSupervisorFirstName, RegionSupervisorLastName, DistributorID)
Values (400, 'Beaumont', 'Mike', 'Besney', 1) --New region for Homer 
Select * from distributor	--Homer wage 20.00
Update Region Set DistributorID = 1 Where RegionID = 200
Select * from distributor	--Homer wage 25.00


--2. Given the following log table
Create Table CustomerPrepaidTipLog
(
	CustomerID int not null
	Constraint PK_CustomerPrepaidTipLog primary key clustered,
	ChangeDate DateTime,
	OldPrePaidTip smallmoney not null
		Constraint ck_oldprepaidtip check (OldPrepaidTip >=0)
		Constraint DF_OldPrepaidTip Default 0,
	NewPrePaidTip smallmoney not null
		Constraint ck_newprepaidtip check (NewPrepaidTip >=0)
		Constraint DF_NewPrepaidTip Default 0,
)

--Create a trigger called TR_Customer_Update that adds a record to the CustomerPrepaidTipLog
--table when a customers prepaid tip changes. Do not add records where the
--value of the prepaid tip field did not change.

create Trigger TR_Customer_Update
on Customer for update as
if @@rowcount>0 and update(PrepaidTip)
	Begin
	Insert into CustomerPrepaidTipLog (CustomerID, ChangeDate, OldPrePaidTip, NewPrePaidTip)
	Select Inserted.CustomerID, getdate(), deleted.PrePaidTip, Inserted.PrePaidTip 
		from inserted inner join deleted on inserted.CustomerID = deleted.CustomerID
		where inserted.PrepaidTip <> deleted.PrepaidTip
	End
return	

--Test
select * from Customer --Customer 1 PrepaidTip 90.00
Update Customer 
Set PrepaidTip = 95.00
Where CustomerId = 1
select * from Customer --Customer 1 PrepaidTip 95.00
select * from CustomerPrepaidTipLog
Update Customer 
Set PrepaidTip = 100.00
Where CustomerId between 2 and 4
select * from Customer 
select * from CustomerPrepaidTipLog
Update Customer 
Set PrepaidTip = 10.00 --Same as previous prepaidtip
Where CustomerId =5
select * from CustomerPrepaidTipLog

--3. Create a trigger called TR_Route_Insert_Update that will enforce the rule that a route cannot be inserted/updated 
--if the carrier is not active (has an Active value of 'N'). 

create Trigger TR_Route_Insert_Update
on route for Insert, Update As
if @@rowcount>0 and update(CarrierId)
	Begin
	If exists (Select * from inserted inner join Carrier on inserted.CarrierID  = Carrier.CarrierID where Active = 'N')
		Begin
		RaisError('Route operation failed - carrier is inactive!',16,1)
		Rollback Transaction
		End
	End
Return

--Test
Select * from carrier
Update Carrier			--Make Bub Slug inactive
Set Active = 'N'
Where CarrierId = 1
Select * from carrier

Select * from Route
sp_help Route			--Copy column names
Insert Route (RouteID, RouteName, EstimatedTime, RegionID, DropSiteID, CarrierId)
Values (25, 'Southgate', 50, 100, 20, 1) --Fails
Insert Route (RouteID, RouteName, EstimatedTime, RegionID, DropSiteID, CarrierId)
Values (25, 'Southgate', 50, 100, 20, 2) --Succeeds





 
