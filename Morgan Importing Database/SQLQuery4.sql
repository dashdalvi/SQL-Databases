CREATE TABLE ITEM 
(
ItemID int identity (500,5), 
StoreId INT, 
PurchasingAgentID INT not NULL,
PurchaseDate DATE,
ItemDescription VARCHAR (50), 
Category VARCHAR (20), 
PriceUSD float,
Constraint pk4 primary key(ItemID),
Constraint fk1 foreign key(StoreId) references STORE(StoreId) ON DELETE CASCADE ON UPDATE CASCADE
)
