CREATE TABLE SHIPMENT_RECEIPT 
(
ReceiptNumber int identity (200001,1), 
ShipmentID INT, 
ItemID INT,
ReceivingAgentID INT, 
ReceiptDate DATE, 
ReceiptTime TIME, 
ReceiptQuantity INT,
isReceivedUndamaged VARCHAR (20), 
DamageNotes VARCHAR (50),
Constraint pk9 primary key(ReceiptNumber),
Constraint fk5 foreign key(ShipmentID) references SHIPMENT(ShipmentID) ON DELETE CASCADE ON UPDATE CASCADE,
Constraint fk6 foreign key(ItemID) references ITEM(ItemID)ON DELETE CASCADE ON UPDATE CASCADE
)
