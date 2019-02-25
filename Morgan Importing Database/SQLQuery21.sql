Create View StoreContactPurchaseHistoryView as
Select StoreName,dbo.StoreContactAndPhone(Contact,Phone) as ContactPhone,ItemID,PurchaseDate,PriceUSD
From Store S,Item I
Where S.StoreID=I.StoreID
SELECT * from StoreContactPurchaseHistoryView
