-- create schema supermarket;
use supermarket;



-- Calculate Total Sales. 
with s as(
select UnitPrice, Quantity, TaxRate, GrossMargin
from sales),
t as(
select round(sum(UnitPrice*Quantity),2) as total_sales, 
round(sum(UnitPrice*Quantity*(1+taxRate*0.01)),2) as sales_after_tax,
round(sum(UnitPrice*Quantity*(1+taxRate*0.01)*(1-GrossMargin*0.01)),2) as COGS,
round(sum(UnitPrice*Quantity*(1+taxRate*0.01)*GrossMargin*0.01),2) as GrossProfit
from s)
select *, round(GrossProfit/sales_after_tax*100,2) as GrossMargin
from t;

-- Branch Analysis
select * from sales;
select City,
round(sum(UnitPrice*Quantity*1.05),2) as totalSales, 
round(sum(UnitPrice*Quantity*GrossMargin*0.01),2) as GrossProfit 
from sales
group by City
order by totalSales desc;-- branch C has the most revenue


-- City, CustomerType Pivot Table
select CustomerType, round(sum(UnitPrice*Quantity*1.05),2) as sales
from sales
group by CustomerType;
select City, 
round(sum(case when CustomerType="Member" then UnitPrice*Quantity*1.05 else 0 end),2) as Member_sales_after_tax,
round(sum(case when CustomerType="Normal" then UnitPrice*Quantity*1.05 else 0 end),2) as Normal_sales_after_tax
from sales
group by City; -- Member has more sales;



-- City Analysis
select City, 
round(sum(UnitPrice*Quantity*1.05),2) as totalSales_afterTax, 
round(sum(UnitPrice*Quantity*1.05*GrossMargin*0.01),2) as GrossProfit_afterTax 
from sales
group by City
order by totalSales_afterTax desc;

select * from sales;
-- Gender
select Gender, round(sum(UnitPrice*Quantity*1.05),2) as sales_afterTax
from sales
group by Gender;
-- City -Gender Pivot table
select City, 
round(sum(case when Gender="Female" then UnitPrice*Quantity*1.05 else 0 end)) as Female_sales_afterTax,
round(sum(case when Gender="Male" then UnitPrice*Quantity*1.05 else 0 end)) as Male_sales_afterTax
from sales
group by City; -- Female does more shopping than males, 

-- city-branch analysis
select Branch, City,
round(sum(UnitPrice*Quantity),2) as totalSales_aftertax, 
round(sum(UnitPrice*Quantity*GrossMargin*0.01),2) as GrossProfit_aftertax 
from sales
group by Branch, City
order by totalSales_aftertax desc;

-- membership analysis
select CustomerType,
count(CustomerType) as num_membership
from sales
group by CustomerType; -- same level of memberships and nonmemberships

select 
CustomerType, 
round(sum(UnitPrice*Quantity*1.05),2) as totalSales, 
round(sum(UnitPrice*Quantity*GrossMargin*0.01*1.05),2) as GrossProfit 
from sales
group by CustomerType; -- members spent more than normal

-- City-CustomerType
with s as(
select City, CustomerType, 
count(CustomerType) as num_customers,
round(sum(UnitPrice*Quantity),2) as totalSales, 
round(sum(UnitPrice*Quantity*GrossMargin*0.01),2) as GrossProfit 
from sales
group by City, CustomerType
order by 3 desc)
select *, round(totalSales/num_customers,2) as sales_per_customer
from s
order by totalSales desc;

-- City-Customer-Pivot
select City, 
round(sum(case when CustomerType="Member" then UnitPrice*Quantity*1.05 else 0 end),2) as member_sales,
round(sum(case when CustomerType="Normal" then UnitPrice*Quantity*1.05 else 0 end),2) as normal_sales
from sales
group by City;

-- gender analysis
with s as(
select Gender, count(Gender) as num,
round(sum(UnitPrice*Quantity),2) as sales,
round(sum(UnitPrice*Quantity*GrossMargin*0.01),2) as GrossProfit
from sales
group by Gender)
select *, 
round(sales/num,2) as sales_mean,
round(GrossProfit/num,2) as gross_mean
from s; -- women do the most shoppings in terms of revenue

-- ProductLine, gender -pivot table
select ProductLine,
round(sum(UnitPrice*Quantity*1.05),2) as sales_after_tax
from sales
group by ProductLine
order by 2 desc;

select 
ProductLine,
round(sum(case when Gender="Female" then UnitPrice*Quantity*1.05 else 0 end),2) as Sales_Female_afterTax,
round(sum(case when Gender="Male" then UnitPrice*Quantity*1.05 else 0 end),2) as Sales_Male_afterTax
from sales
group by ProductLine; -- Male spent more in Healthy and beauty, 
-- Female spent more on Home and lifestyle, sports and travel, 
-- Food and beverage, and Fashion accessories.


-- Date, Time, Average Hour
select * from sales;
select hour(Time) as Hour,
round(avg(UnitPrice*Quantity*1.05),2) as revenue_per_hour
from sales
group by Hour
order by 2 desc; -- The peak shopping hours are 14, 19, 11, 13, 17, and 16.
-- It happens before and after lunch and dinner time.

-- Date, Hour
select 
substr(Date_time,1,1) as moth,
hour(Time) as hr,
round(avg(UnitPrice*Quantity*1.05),2) as avg_revenue
from sales
group by moth, hr
order by avg_revenue desc; -- The hours with the highest sales are 13, 11, 14, 16, 19 17
-- very similar to the average top hour sales.

select hour(time) as Hr,
round(sum(case when substr(Date_time,1,1)=1 then UnitPrice*Quantity*1.05 else 0 end),2) as Jan_sales,
round(sum(case when substr(Date_time,1,1)=2 then UnitPrice*Quantity*1.05 else 0 end),2) as Feb_sales,
round(sum(case when substr(Date_time,1,1)=3 then UnitPrice*Quantity*1.05 else 0 end),2) as Mar_sales
from sales
group by Hr
order by Hr; -- The peak shopping hours are 14, 19, 11, 13, 17, and 16.
-- It happens before and after lunch and dinner time.

-- MOnth sales
select 
substr(Date_time, 1,1) as mnth,
round(sum(UnitPrice*Quantity*1.05),2) as revenue
from sales
group by mnth
order by revenue; -- January, March, and Feburary with high to low revenue

-- ProductLine (Graph needed)
with t as(
select 
substr(Date_time,1,1) as mnth,
ProductLine,
round(sum(UnitPrice*Quantity),2) as revenue
from sales
group by mnth, ProductLine
order by revenue)
select *, 
row_number() over(partition by mnth order by revenue desc) as drank
from t; -- no pattern

-- Month, ProductLine pivot
select ProductLine, 
round(sum(case when substr(Date_time,1,1)=1 then UnitPrice*Quantity*1.05 else 0 end),2) as Jan_sales_afterTax,
round(sum(case when substr(Date_time,1,1)=2 then UnitPrice*Quantity*1.05 else 0 end),2) as Feb_sales_afterTax,
round(sum(case when substr(Date_time,1,1)=3 then UnitPrice*Quantity*1.05 else 0 end),2) as Mar_sales_afterTax
from sales
group by ProductLine; -- in January, top sales are Electronic accessories and sports and travel
-- In Feburary, Food and beverage and Fashion accessory are top sales,
-- In March, Home and sports are top sales.





-- Payment
select Payment,
round(sum(UnitPrice*Quantity*1.05),2) as revenue
from sales
group by Payment
order by revenue desc; -- cash>ewallet> credit card

-- Payment Gender -pivot
select Payment,
round(sum(case when Gender="Female" then UnitPrice*Quantity*1.05 else 0 end),2) as female_sales,
round(sum(case when Gender="Male" then UnitPrice*Quantity*1.05 else 0 end),2) as male_sales
from sales
group by Payment; -- most women pay with cash and credit card.

-- Payment ProductLine, Pivot Table
select ProductLine,
round(sum(case when Payment="Ewallet" then UnitPrice*Quantity*1.05 else 0 end),2) as revenue_ewallet_afterTax,
round(sum(case when Payment="Cash" then UnitPrice*Quantity*1.05 else 0 end),2) as revenue_cash_afterTax,
round(sum(case when Payment="Credit Card" then UnitPrice*Quantity*1.05 else 0 end),2) as revenue_credit_afterTax
from sales
group by ProductLine; -- ewallet top sale Home and lifestyle,
-- cash electronic accessories, credit card food beverage

-- City Payment
select Payment,
round(sum(case when City="Mandalay" then UnitPrice*Quantity*1.05 else 0 end),2) as Mandalay_sales,
round(sum(case when City="Naypyitaw" then UnitPrice*Quantity*1.05 else 0 end),2) as Naypyitaw_sales,
round(sum(case when City="Yangon" then UnitPrice*Quantity*1.05 else 0 end),2) as Yangon_sales
from sales
group by Payment; -- In Mandalay, Credit Card is top method, 
-- Naypyitaw, Cash,
-- Yangon, Ewallet;

-- Rating
select City, round(avg(Rating),2) as avg_rating
from sales
group by City order by 2 desc; -- Naypyitaw highest rating,

select Gender, round(avg(Rating),2) as avg_rating
from sales
group by Gender order by 2; -- Both Gender have the same rating

-- Rating and Product
select ProductLine, round(avg(Rating),2) as avg_rating
from sales
group by ProductLine order by 2 desc;

-- Rating and City
select city, round(avg(rating),2) as avg_rating,
round(avg(UnitPrice*Quantity*1.05),2) as avg_sales
from sales
group by city;


-- pivot Gender, ProductLine
select Gender,
round(avg(case when Branch="A" then UnitPrice*Quantity else 0 end),2) as A,
round(avg(case when Branch="B" then UnitPrice*Quantity else 0 end),2) as B,
round(avg(case when Branch="C" then UnitPrice*Quantity else 0 end),2) as C
from sales
group by Gender; 
-- membership-city
select CustomerType,
round(avg(case when Branch="A" then UnitPrice*Quantity else 0 end),2) as A,
round(avg(case when Branch="B" then UnitPrice*Quantity else 0 end),2) as B,
round(avg(case when Branch="C" then UnitPrice*Quantity else 0 end),2) as C
from sales
group by CustomerType;-- Memebership consume more than non-membership, Branch C conusmes the most

-- city-payment-pivot
select Payment,
round(avg(case when Branch="A" then UnitPrice*Quantity else 0 end),2) as A,
round(avg(case when Branch="B" then UnitPrice*Quantity else 0 end),2) as B,
round(avg(case when Branch="C" then UnitPrice*Quantity else 0 end),2) as C
from sales
group by Payment; -- City A pays the most with EWallet, B spent the most with credit card, C spent the most with Cash;
-- Gender, Payment
select Payment, 
round(avg(case when Gender="Male" then UnitPrice*Quantity else 0 end),2) as Male,
round(avg(case when Gender="Female" then UnitPrice*Quantity else 0 end),2) as Female
from sales
group by Payment; -- women spent more shopping while Female spent more with Cash and Credit card.