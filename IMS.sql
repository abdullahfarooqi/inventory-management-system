create database IMS
use IMS
use master
create table Employee (
id int primary key,
empname varchar(50),
)

create table items (
id int primary key,
itemname varchar (100),
quantity int
)

create table requests (
requestid int,
itemid int foreign key references items (id),
itemname varchar (100),
empid int foreign key references Employee (id),
empname varchar (50),
branchname varchar (100),
quantity int,
status varchar (15)
)

drop table requests

create table roadcertificate (
rcnumber int primary key,
itemid int foreign key references items (id),
itemname varchar (100),
quantity int,
branchname varchar(100),
empname varchar (50),
dateandtime varchar (50),
stkeepsignature varchar (50)
)

create table inventoryregister (
rcnumber int foreign key references roadcertificate (rcnumber),
remainingquantity int,
receivername varchar (50),
receiversignature varchar (50)
)

insert into Employee VALUES (1,'Abdullah')
insert into items VALUES (1,'Badges',500)
insert into requests (requestid,itemid,itemname,empid,empname,quantity,status) VALUES (1,1,'Badges',1,'Abdullah',1,'Pending')

select * from Employee
select * from items

insert into roadcertificate VALUES (1,(select items.id, items.itemname,requests.quantity,requests.branchname,Employee.empname
								from Employee join requests on Employee.id=requests.empid join items on items.id=requests.itemid
								where items.id=1),'28-12-2020','MUII')

select * from requests
