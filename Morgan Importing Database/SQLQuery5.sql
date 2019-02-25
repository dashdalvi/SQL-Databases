CREATE TABLE SHIPPER 
(
ShipperID int identity (1,1),
ShipperName VARCHAR (20), 
Phone VARCHAR (20), 
Fax VARCHAR (20), 
EmailAddress VARCHAR (50) not NULL, 
Contact VARCHAR (20),
Constraint pk5 primary key(ShipperID)
)
