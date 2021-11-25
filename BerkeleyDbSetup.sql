IF OBJECT_ID(N'dbo.Boats', N'U') IS NOT NULL  
 Begin
   DROP TABLE [dbo].Boats  

Create table boats
(bid int, 
bname varchar(50),
bcolor varchar(50)
PRIMARY KEY(bid))
end
insert boats
values
(101, 'Nina', 'red'),
(102, 'Pinta', 'blue'),
(103, 'Santa Maria', 'red')

If Object_ID(N'dbo.Sailors', N'U') is not null
begin
Drop table Sailors
Create table Sailors
(sid int,
sname varchar(50),
rating int,
age int)

insert Sailors
values
(1, 'Tom', 5, 32),
(2, 'Dick', 7, 33),
(3, 'Harry', 8, 33),
(4, 'Ralph', null, null),
(5, 'Salty', 11, 68)
end

If Object_Id(N'dbo.Sailors', N'U') is not null
Begin
Drop Table Reserves
Create table Reserves
(rid int,
sid int,
bid int,
sched date)

Insert Reserves values
(1, 1, 103, '1-1-2021'),
(2, 2, 103, '1-1-2021'),
(3, 3, 102, '1-1-2021'),
(4, 3, 103, '1-1-2021'),
(5, 3, 101, '1-1-2021'),
(6, 3, 101, '1-1-2021')
End

