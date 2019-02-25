CREATE TABLE EMPLOYEE
(
EmployeeID int identity (1,1), 
LastName VARCHAR (20) Not null, 
FirstName VARCHAR (20) not null, 
Department VARCHAR (20), 
Phone VARCHAR (20), 
Fax VARCHAR (20),
EmailAddress VARCHAR (50) not null,
Constraint pk1 primary key(EmployeeID)
)
