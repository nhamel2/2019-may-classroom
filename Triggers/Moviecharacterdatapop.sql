
--USE[]

Drop Table MovieCharacter
Drop Table Agent
create table Agent
(
AgentID int identity(1,1)not null constraint pk_Agent primary key clustered,
AgentName varchar(70) not null,
AgentFee money not null
)

create table MovieCharacter
(
CharacterID int identity(1,1)not null constraint pk_Character primary key clustered,
CharacterName varchar(70) not null,
CharacterMovie varchar(70) not null,
CharacterRating char(1) null constraint DF_characterRating default 3,
Characterwage smallmoney null,
AgentID int null constraint  fk_MovieCharacterToAgent references Agent(AgentID)
)

Insert into Agent (AgentName,AgentFee)
values('Bob the agent',50)
Insert into Agent (AgentName,AgentFee)
values('Good Acting For U',125)
Insert into Agent (AgentName,AgentFee)
values('I represent anyone',5)

insert into MovieCharacter (CharacterName,CharacterMovie,CharacterRating,CharacterWage,AgentID)
values('ET','ET The Extraterrestrial','4',20000,3)
insert into MovieCharacter (CharacterName,CharacterMovie,CharacterRating,CharacterWage,AgentID)
values('Luke Skywalker','Star Wars','5',12000,2)
insert into MovieCharacter (CharacterName,CharacterMovie,CharacterRating,CharacterWage,AgentID)
values('R2D2','Star Wars','4',0,1)
insert into MovieCharacter (CharacterName,CharacterMovie,CharacterRating,CharacterWage,AgentID)
values('Winnie The Pooh','Heffalump','1',20000,2)
insert into MovieCharacter (CharacterName,CharacterMovie,CharacterRating,CharacterWage,AgentID)
values('Guy in red uniform','Star Trek II','4',20000,1)

