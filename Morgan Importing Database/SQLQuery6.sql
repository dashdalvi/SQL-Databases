CREATE TABLE SHIPMENT
(
ShipmentID int identity (100,1), 
ShipperID INT, 
PurchasingAgentID INT not NULL,
ShipperInvoiceNumber INT, 
Origin VARCHAR (20), 
Destination VARCHAR (20), 
ScheduledDepartureDate DATE,
ActualDepartureDate DATE, 
EstimatedArrivalDate DATE,
Constraint pk6 primary key(ShipmentID),
Constraint fk2 foreign key(ShipperID) references SHIPPER(ShipperID) ON DELETE CASCADE ON UPDATE CASCADE
)
