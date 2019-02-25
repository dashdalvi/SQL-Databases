CREATE VIEW MajorSources as
SELECT StoreName, TotalPurchases
FROM StoreHistoryView
WHERE TotalPurchases > 100000
GROUP BY StoreName, TotalPurchases;
Select * from MajorSources
