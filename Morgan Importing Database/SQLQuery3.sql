CREATE TABLE STORE
(
StoreId int identity (1000,50),
StoreName VARCHAR (20) Not NULL, 
City VARCHAR (20), 
Country VARCHAR (30) Not NULL, 
Phone VARCHAR (20), 
Fax VARCHAR (20),
EmailAddress VARCHAR (50) Not NULL,
Contact VARCHAR (20),
Constraint pk2 primary key(StoreId),
Constraint Country_ch CHECK (Country='Hong Kong' or Country='India' or Country='Japan' or Country='Peru' or Country='Philippines' or Country='Singapore' or Country='United States')
)
