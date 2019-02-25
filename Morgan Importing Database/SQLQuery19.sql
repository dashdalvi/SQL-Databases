CREATE FUNCTION dbo.StoreContactAndPhone
( @varStoreContact char(25),
@varStorePhone  char(25) )
RETURNS Varchar(60)
AS
BEGIN
DECLARE @varContactAndPhone varchar(60);
SELECT @varContactAndPhone=RTRIM(@varStoreContact)+': '+RTRIm(@varStorePhone);
RETURN @varContactAndPhone;
END
Select StoreName,dbo.StoreContactAndPhone(Contact,Phone) as ContactPhone,ItemID,PurchaseDate,PriceUSD
From Store S,Item I
Where S.StoreID=I.StoreID
