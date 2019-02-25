CREATE VIEW StoreHistoryView as
SELECT StoreName, SUM(PriceUSD) AS TotalPurchases
FROM StorePurchaseHistoryView
GROUP BY StoreName;
SELECT * FROM StoreHistoryView
