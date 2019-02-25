Create view StorePurchaseHistoryView as
SELECT S.StoreName, S.Phone, S.Contact, I.ItemID, I.PurchaseDate, I.ItemDescription, I.PriceUSD
FROM STORE AS S, ITEM AS I
WHERE S.StoreID=I.StoreID;
SELECT * FROM StorePurchaseHistoryView
