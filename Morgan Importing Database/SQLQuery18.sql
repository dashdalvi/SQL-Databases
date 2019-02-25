Create view PurchaseSummaryView as
Select ItemID,PurchaseDate,ItemDescription,PriceUSD
from Item
select * from PurchaseSummaryView
