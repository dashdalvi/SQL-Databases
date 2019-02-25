CREATE TABLE SHIPMENT_ITEM
(
ShipmentID INT, 
ShipmentItemID INT,
ItemID INT, 
InsuredValue INT DEFAULT 100,
Constraint pk7 primary key (ShipmentItemID),
Constraint fk3 foreign key (ShipmentID) references SHIPMENT(ShipmentID) ON DELETE CASCADE ON UPDATE CASCADE,
Constraint fk4 foreign key(ItemID) references ITEM(ItemID) ON DELETE CASCADE ON UPDATE CASCADE
)
