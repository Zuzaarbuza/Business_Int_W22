insert into BI_BikesDW_50.Dim_Product
select product.ProductID, product.ProductName, model.ProductModelName, sub.Name, top.Name, product.StandardCost, product.ListPrice, product.SellStartDate, product.SellEndDate, 
		CASE WHEN (product.SellEndDate is NULL or product.SellEndDate > '2021-09-30') then 'Current' else 'Discontinued' end as Status from (((
        BI_Bikes_50.TB_Product as product left join BI_Bikes_50.TB_ProductModel as model on product.ProductModelID = model.ProductModelID) 
										  left join BI_Bikes_50.TB_ProductSubCategory as sub on product.ProductSubCategoryID = sub.ProductSubCategoryID) 
										  left join BI_Bikes_50.TB_ProductTopCategory as top on sub.ProductTopCategoryID = top.ProductTopCategoryID)