use swiggy_alter;
# Basic SQL Statements
-- 1.	Display all customer details. 
select * 
from Customers;

-- 2.	Display Customer ID, Customer Name, and City. 
Select CustomerID,FirstName,City
from Customers;

-- 3.	Display customers from Chennai. 
select FirstName,City
from Customers
where City = "Chennai";

-- 4.	Display customers from Coimbatore. 
select FirstName,City
from Customers
where City in ("Coimbatore");

-- 5.	Display the list of unique customer cities.
select distinct(City)
from Customers; 

-- 6.	Display customers in alphabetical order. 
select FirstName
from Customers
order by FirstName;

-- 7.	Display customers in reverse alphabetical order. 
select FirstName
from Customers
order by FirstName desc;

-- 8.	Display the first 10 customer records. 
select *
from Customers
order by CustomerID 
limit 10;

-- 9.	Display the first five restaurants. 
select *
from Restaurants
order by RestaurantID 
limit 5;

-- 10.	Display restaurants located in Bengaluru
select * 
from Restaurants
where City in ("Bengaluru");

#Filtering Records

-- 11.	Display all menu items. 
select * 
from Menuitems;

-- 12.	Display only vegetarian menu items. 
select * 
from Menuitems
where Isveg = true;

-- 13.	Display only non-vegetarian menu items.
 select * 
from Menuitems
where Isveg = false;

-- 14.	Display menu items costing more than ₹300. 
select * 
from Menuitems
where Price > 300;

-- 15.	Display menu items costing less than ₹200. 
select * 
from Menuitems
where Price < 200;

-- 16.	Display menu items priced between ₹200 and ₹400. 
select ItemName
from Menuitems
where Price between 200 and 400;

-- 17.	Display the ten most expensive menu items. 
select ItemName,Price
from Menuitems
order by Price
desc limit 10;

-- 18.	Display the ten least expensive menu items. 
select ItemName,Price
from Menuitems
order by Price
limit 10;

-- 19.	Display customers whose names begin with the letter 'A'. 
select FirstName
from Customers
where  FirstName like "A%";

-- 20.	Display customers whose names end with "Kumar". 
select FirstName
from Customers
where  FirstName like "%Kumar";

#Pattern Matching & Conditions
-- 21.	Display menu items containing the word "Chicken".
select *
from Menuitems
where ItemName like ("%Chicken%");

-- 22.	Display customers from Chennai, Coimbatore, and Madurai. 
select City,FirstName
from Customers
where City in ( "Chennai", "Coimbatore","Madurai");

-- 23.	Display customers who are not from Chennai. 
select City,FirstName
from Customers
where City not in ( "Chennai");

-- 24.	Display deliveries where the delivery rating is not available. 
select * from Delivery;
select *
from delivery
where DeliveryRating is Null;

-- 25.	Display deliveries that have received ratings. 
select *
from delivery
where DeliveryRating is not null;

#Orders, Payments & Reviews
-- 26.	Display all orders. 
select * 
from Orders;

-- 27.	Display delivered orders. 
select *
from Orders
where OrderStatus in ("Delivered");

-- 28.	Display cancelled orders. 
select *
from Orders
where OrderStatus in ("Cancelled");

-- 29.	Display pending orders. 
select *
from Orders
where OrderStatus in ("Pending");

-- 30.	Display completed payments.
select * from payments;
select *
from payments
where  PaymentStatus in ("Success");

-- 31.	Display failed payments. 
select *
from payments
where  PaymentStatus in ("Failed");

-- 32.	Display refunded payments. 
select *
from payments
where  PaymentStatus in ("Refunded");

-- 33.	Display the ten highest payment amounts.
select * 
from Payments
order by Amount 
desc limit 10;

-- 34.	Display the ten lowest payment amounts. 
select * 
from Payments
order by Amount 
limit 10;

-- 35.	Display all five-star reviews. 
select * from reviews;
select *
from reviews
where DeliveryRating = 5;

-- 36.	Display reviews with ratings less than three. 
select *
from reviews
where DeliveryRating <3;

-- 37.	Display customer names using the alias "Customer". 
select FirstName as Customer
from Customers;

-- 38.	Display menu item names using the alias "Food Item". 
select ItemName as "Food Item"

from Menuitems;

-- 39.	Display menu prices after adding a 5% service charge. 
select Price,Price*1.05  as  MenuPrice
from menuitems;
 
-- 40.	Display the latest ten registered customers. 
select * 
from Customers
order by RegistrationDate
desc limit 10;

#Aggregate Functions (Questions 41–60)
-- 41.	Display the total number of registered customers. 
select count(*) as total_cus
from Customers;

-- 42.	Display the total number of restaurants. 
select count(RestaurantID)
from Restaurants
where RestaurantID;

-- 43.	Display the total number of customer orders.
 select count(OrderID)
from Orders
where OrderID;

-- 44.	Display the total number of completed payments. 
select * from payments;
select count(*)
from payments
where PaymentStatus ="Success";

-- 45.	Display the total revenue generated through completed payments. 
select sum(Amount) as revenue
from payments
where PaymentStatus ="Success";

-- 46.	Display the average order amount. 
select avg(TotalAmount)
from Orders;

-- 47.	Display the highest order amount. 
select TotalAmount
from orders
order by TotalAmount desc
limit 1;

select max(TotalAmount)
from Orders;

-- 48.	Display the lowest order amount. 
select TotalAmount
from orders
order by TotalAmount 
limit 1;

select min(TotalAmount)
from Orders;

-- 49.	Display the average customer review rating.
 select * from reviews;
 
 select avg(FoodRating)
 from reviews;
 
-- 50.	Display the average review rating rounded to two decimal places. 
select round(avg(DeliveryRating),2)
from reviews;

-- 51.	Display the number of customers in each city. 
select count(CustomerID),City
from Customers
group by City;

-- 52.	Display the number of restaurants in each city. 
select count(RestaurantID),City
from restaurants
group by City;

-- 53.	Display the total revenue generated by each payment method. 
select * from Payments;
select PaymentMethod,
sum(Amount) as revenue
from payments
where PaymentStatus="Success"
group by PaymentMethod;

-- 54.	Display the number of transactions for each payment method. 
select PaymentMethod,count(PaymentID)
from payments
group by PaymentMethod;

-- 55.	Display the number of reviews for each rating. 
select * from reviews;

select DeliveryRating,count(ReviewID)
from reviews
group by DeliveryRating;

-- 56.	Display the number of menu items in each food category. 
select * from menuitems;

select CategoryID,count(CategoryID)
from menuitems
group by CategoryID;

-- 57.	Display cities having more than five registered customers. 
select * from customers;

select City,count(CustomerID)
from customers
group by City
having count(CustomerID) >5;

-- 58.	Display payment methods generating revenue greater than ₹20,000. 
select * from payments;

select PaymentMethod,sum(Amount) as revenue
from payments
group by PaymentMethod
having  revenue >20000;

-- 59.	Display the average menu price for each food category. 
 select CategoryID,avg(price)
 from menuitems
 group by CategoryID;

-- 60.	Display payment-method-wise transaction count, total revenue, average payment, highest payment, and lowest payment. 
select 
	PaymentMethod, 
	count(PaymentMethod) as Payment_count, 
    sum(Amount) as Total_Revenue, 
    avg(amount), 
    max(Amount), 
    Min(amount)
from payments
where paymentstatus = "Success"
group by PaymentMethod
order by Total_Revenue Desc;
#JOIN Queries (Questions 61–90)
-- 61.	Display customer name, order ID, order date, and total amount. 
select 
	c.FirstName,
	o.OrderId,
	o.OrderDate,
	o.TotalAmount
from Orders as o
inner join Customers as c
	on o.CustomerID = c.CustomerID;
     
-- 62.	Display order ID, restaurant name, order date, and order amount. 
select
	o.OrderId,
    r.RestaurantName,
    o.OrderDate,
    o.TotalAmount
from Orders as o
inner join restaurants as r
	on o.RestaurantID = r.RestaurantID;

-- 63.	Display menu item name, category name, and price. 
select 
	m.ItemName,
    C.CategoryName,
    m.Price
from menuitems as m
inner join menucategories as C
	on m.CategoryID=C.CategoryID;
    
-- 64.	Display order ID, payment amount, payment method, and payment status. 
select
	o.OrderID,
    p.Amount,
    p.PaymentMethod,
    p.PaymentStatus
from orders as o
inner join payments as p
	on o.OrderID=p.OrderID;
    
-- 65.	Display order ID, delivery partner name, and delivery status. 
select 
	d.OrderID,
    dp.PartnerName,
    d.DeliveryStatus
from delivery as d
inner join deliverypartners as dp
	on d.PartnerID=dp.PartnerID;
    
-- 66.	Display customer name, review rating, and review comment. 
select 
	c.FirstName,
    r.FoodRating,
    r.DeliveryRating,
    r.ReviewComment
from customers as c
inner join reviews as r
	on c.CustomerID=r.CustomerID;
    
-- 67.	Display restaurant name, review rating, and review comment. 
select 
	rs.RestaurantName,
	r.FoodRating,
    r.DeliveryRating,
	r.ReviewComment
from restaurants as rs
inner join reviews as r
	on rs.RestaurantID=r.RestaurantID;
    
-- 68.	Display restaurant name, menu item, and menu price.
select 
	rs.RestaurantName,
	m.ItemName,
	m.Price
from restaurants as rs
inner join menuitems as m
	on rs.RestaurantID=m.RestaurantID;
	
-- 69.	Display all customers along with their orders, including customers who have not placed any orders.
 select
	c.FirstName,
    o.orderID
from customers c
left join orders o
	on o.CustomerID = c.CustomerID;
    
-- 70.	Display all restaurants along with their menu items.
 select
	rs.RestaurantName,
    m.ItemName
from restaurants as rs
inner join menuitems as m
	on rs.RestaurantID=m.RestaurantID;
    
-- 71.	Display all orders with their payment details, including unpaid orders.
select
	o.orderID,
    p.PaymentStatus
from orders as o
left join payments as p
	on o.OrderID = p.OrderID;
    
select * from payments;
-- 72.	Display all orders with delivery information, including undelivered orders.
select * from delivery;
select 
	o.OrderID,
    d.DeliveryStatus
from Orders as o
left join delivery as d
	on o.OrderID=d.OrderID
order by o.OrderID;

	
-- 73.	Display all restaurants along with their customer reviews. 
select 
	rs.RestaurantName,
    r.ReviewComment
from restaurants as rs
inner join reviews as r
	on rs.RestaurantID=r.RestaurantID;
    
-- 74.	Display all menu categories along with their menu items. 
select * from menucategories;
 
select
	mc.CategoryName,
    m.ItemName
from menucategories as mc
inner join menuitems as m
	on mc.CategoryID=m.CategoryID;

-- 75.	Display all payment records with their corresponding orders.
 select 
	o.orderID,
    p.PaymentMethod,
    p.PaymentStatus
 from payments p
 left join orders o
	on o.OrderID = p.OrderID;
	
-- 76.	Display all reviews with restaurant details. 
select
	rs.RestaurantName,
    rs.City,
    rs.Rating,
    r.ReviewComment
from restaurants as rs
inner join reviews as r
	on rs.RestaurantID=r.RestaurantID;
    
-- 77.	Display all delivery records with delivery partner details. 
select 
    d.orderID,
    d.DeliveryStatus,
    dp.PartnerName
from delivery as d
left join deliverypartners as dp
	on d.PartnerID=dp.PartnerID;
    
-- 78.	Display customer name, restaurant name, order amount, and payment status.
select 
	c.FirstName,
    rs.RestaurantName,
    o.TotalAmount,
    p.PaymentStatus
from orders as o
inner join customers as c
	on o.CustomerID= c.CustomerID
inner join restaurants as rs
	on o.RestaurantID=rs.RestaurantID
inner join payments as p
	on p.OrderID=o.OrderID;

-- 79.	Display customer name, restaurant name, delivery partner name, and delivery status. 
select
	c.FirstName,
    rs.RestaurantName,
    dp.PartnerName,
    d.DeliveryStatus
from orders as o
inner join customers as c
	on o.CustomerID=c.CustomerID
inner join restaurants as rs
	on o.RestaurantID=rs.RestaurantID
inner join delivery as d
	on o.OrderID=d.OrderID
inner join deliverypartners as dp
	on dp.PartnerID=d.PartnerID;
    
-- 80.	Display customer name, restaurant name, payment amount, payment method, and review rating. 
select 
	c.FirstName,
    rs.RestaurantName,
    p.Amount,
    p.PaymentMethod,
    r.FoodRating
from orders as o
inner join customers as c
	on o.CustomerID=c.CustomerID
inner join payments as p
	on o.OrderID=p.OrderID
inner join restaurants as rs
	on o.RestaurantID=rs.RestaurantID
inner join reviews as r
	on r.RestaurantID=rs.RestaurantID;
    
-- 81.	Display each customer's total number of orders.
 select 
	distinct c.FirstName as Customer_name ,
    count(o.OrderId) as total_orders
from Customers as c
inner join Orders as o
	on c.CustomerID=o.CustomerID
group by Customer_name;

-- 82.	Display each restaurant's total number of orders received. 
select 
	distinct rs.RestaurantName as RestaurantName,
    count(o.OrderId) as Orders_Recived
from Orders as o
inner join restaurants as rs 
	on rs.RestaurantID=o.RestaurantID
group by  RestaurantName;
	
-- 83.	Display the total revenue generated by each restaurant. 
select * from restaurants;
select *from Payments;
select * from orders;
select
	distinct rs.RestaurantName as Restaurant_Name,
    sum(o.TotalAmount) as Revenue
from Orders as o
inner join restaurants as rs
	on o.RestaurantID=rs.RestaurantID
group by Restaurant_Name;
    
    
-- 84.	Display the average customer rating for each restaurant. 
select 
	distinct rs.RestaurantName as Restaurant_Name,
    avg(r.FoodRating),
    avg(r.DeliveryRating)
from restaurants as rs
inner join reviews as r
	on r.RestaurantID=rs.RestaurantID
group by Restaurant_Name;

-- 85.	Display the total number of deliveries handled by each delivery partner.
 select 
	distinct dp.PartnerName as Delivry_Partner,
    count(d.DeliveryID) as total_deliveries
from delivery as d
inner join deliverypartners as dp
	on d.PartnerID=dp.PartnerID
group by Delivry_Partner;

-- 86.	Display the total payment collected through each payment method. 
select * from payments;
select distinct PaymentMethod,sum(Amount)
from payments
group by PaymentMethod;

-- 87.	Display customers along with the restaurants they reviewed. 
select
	c.FirstName,
    rs.RestaurantName,
    r.ReviewComment
from reviews as r
inner join customers as c
	on r.CustomerID=c.CustomerID
inner join restaurants as rs 
	on rs.RestaurantID=r.RestaurantID;
    
-- 88.	Display restaurant name, city, and average menu price. 
select
	rs.RestaurantName as RestaurantName,
	rs.City,
    avg (m.Price)
from restaurants as rs
inner join menuitems as m
	on rs.RestaurantID=m.RestaurantID
group by RestaurantName,City;

select*from menuitems;

-- 89.	Display each food category with the number of menu items. 
select
	distinct c.CategoryName ,
    count(m.ItemID)
from menucategories as c
inner join menuitems as m
	on m.CategoryID=c.CategoryID
group by CategoryName ;

-- 90.	Prepare a consolid)ated order report containing customer, restaurant, payment, and delivery details. 
select
	c.FirstName,
    rs.RestaurantName,
    p.Amount,
    p.PaymentStatus,
    d.DeliveryStatus
from orders as o
inner join customers as c
	on c.CustomerID=o.CustomerID
inner join restaurants as rs
	on o.RestaurantID=rs.RestaurantID
inner join payments as p
	on o.OrderID=p.OrderID
inner join delivery as d
	on o.OrderID=d.OrderID;
    
    -- PART D – Date Functions (Questions 91–120)
    
-- 91.	Display the current system date. 
select current_date();

-- 92.	Display the current system time. 
select current_time();

-- 93.	Display the current date and time. 
select concat( "Date : ",current_date() , "  ,Time : ",current_time());
select current_date(),current_time();

-- 94.	Display the system timestamp. 
select current_timestamp();

-- 95.	Display today's date using the CURRENT_DATE() function.
select current_date();
 
-- 96.	Display the current timestamp using CURRENT_TIMESTAMP(). 
select current_timestamp();

-- 97.	Display the order year for every order. 
select 
	OrderID, 
	year(OrderDate) as Order_Year
from orders;

-- 98.	Display the order month for every order.
select 
	OrderID,
    month (OrderDate) as Order_month
from Orders; 

-- 99.	Display the month name for every order.
select 
	orderID,
    monthname(OrderDate) as Order_Month_name
from Orders;

-- 100.	Display the day of the month for every order.
select 
	orderID,
    dayofmonth(OrderDate) as dayofmonth
from Orders;

-- 101.	Display the weekday name for every order.
select
	orderID,
    dayname(OrderDate) as weekday
from Orders;

-- 102.	Display the weekday number for every order. 
select 
	orderID,
    weekday(OrderDate) as weekday
from Orders;

-- 103.	Display the week number for every order.
select 
	orderID,
    week(OrderDate) as week_num
from Orders; 

-- 104.	Display the quarter for every order. 
select
	OrderId,
    quarter(OrderDate) 
from Orders;

-- 105.	Display the day number within the year for every order. 
select
	orderID,
    dayofyear(OrderDate) as day_of_year
from Orders;

-- 106.	Calculate the number of days between the order date and delivery date. 
select
	OrderID,
    datediff(OrderDate,EstimatedDelivery) as Between_o_d
from Orders;

-- 107.	Calculate the delivery duration in minutes. 
select 
	OrderID,
    timediff(OrderDate,EstimatedDelivery)
from Orders;

-- 108.	Display the expected delivery date by adding two days to the order date.
select
	OrderID,
    adddate(OrderDate,2) as"expected delivery date"
from orders;
    
-- 109.	Display a reminder date three days before the order date. 
select
	OrderID,
    subdate(OrderDate,3) as "reminder date"
from Orders;

-- 110.	Add seven days to each order date. 
select
	OrderID,
    adddate(OrderDate,7) as"add_7_Days"
from orders;

-- 111.	Subtract five days from each order date. 
select
	OrderID,
    subdate(OrderDate,5) as "Subtract_5_Days"
from Orders;

-- 112.	Display all orders placed during the last thirty days. 
select
	OrderId,
    Day(OrderDate)
from Orders
order by Day(OrderDate) desc
limit 30;

-- 113.	Display the order date in DD-MM-YYYY format. 
select
	OrderID,
    date_format(OrderDate, "%d-%m-%y") as "DD-MM-YYYY"
from orders;

-- 114.	Display the order month and year in "Month YYYY" format. 
select
	OrderID,
    date_format(OrderDate, "%M-%Y") as "Month YYYY"
from orders;

-- 115.	Display monthly revenue generated from completed payments. 
select
	Month(PaymentDate),
    PaymentStatus,
	sum(Amount) as Total_Revenue
from payments
where PaymentStatus = "Success"
group by Month(PaymentDate);

select * from payments;
-- 116.	Display the daily order count. 
select 
	date(OrderDate),
	count(OrderID)
from orders
group by date( OrderDate);
	
-- 117.	Display the total number of orders placed each month. 
select
	month(OrderDate),
    count(OrderId)
from orders
group by month(OrderDate);

-- 118.	Display the total number of orders placed on each weekday.
select
	weekday(OrderDate),
    count(OrderID)
from Orders
group by weekday(OrderDate);

-- 119.	Display the average delivery time in minutes.
 select * from delivery;
 select
	round(avg(time(DeliveryTime)))
from delivery;

-- 120.	Prepare a monthly business summary showing total orders, revenue, and average order value. 
select 
	month(OrderDate),
    count(OrderID),
    sum(TotalAmount) as Revenue,
    avg(OrderID)
from Orders
group by month(OrderDate);

-- PART E – Advanced SQL (Questions 121–150)
-- 121.	Display all customers with a row number based on their total spending.

with row_tab as(
select
	row_number () over (order by (sum(o.TotalAmount)) desc) as row_no,
	c.CustomerID,
	c.FirstName as Name_cust,
    sum(o.TotalAmount) as Total_spend
from Customers as C
inner join orders as o
	on C.CustomerID=o.CustomerID
group by Name_cust,	c.CustomerID)

select *from row_tab
where row_no<=3;

    
-- 122.	Rank restaurants according to total revenue.
with rank_row as (
select
	rank () over (order by(sum(o.TotalAmount)) desc ) as Rank_no,
	rs.RestaurantName,
    sum(o.TotalAmount) as revenue
from orders as o
inner join restaurants as rs
	on rs.RestaurantID=o.CustomerID
group by rs.RestaurantName) 

select * from rank_row 
where Rank_no<=5;

-- 123.	Assign a dense rank to customers based on lifetime spending. 
select
	dense_rank() over (order by (sum(o.TotalAmount)) desc) as dense_rank_no,
	c.CustomerID,
	c.FirstName as Name_cust,
    sum(o.TotalAmount) as Total_spend
from Customers as C
inner join orders as o
	on C.CustomerID=o.CustomerID
group by Name_cust,	c.CustomerID;

-- 124.	Divide customers into four spending groups using NTILE(). 
select
	ntile(4) over (order by (sum(o.TotalAmount)) desc) as Quantile,
	c.CustomerID,
	c.FirstName as Name_cust,
    sum(o.TotalAmount) as Total_spend
from Customers as C
inner join orders as o
	on C.CustomerID=o.CustomerID
group by c.CustomerID;
	
    
-- 125.	Display each customer payment along with the previous payment amount. 
select * from payments;
select 
	c.FirstName,
    p.PaymentID,
    p.Amount as Current_Amount,
    lag (p.Amount) over 
		(partition by C.FirstName
        order by p.PaymentID) as Previous_Amt
from orders as o
inner join customers as c
	on c.CustomerID=o.CustomerID
inner join payments as p
	on p.OrderID=o.OrderID;
    
-- 126.	Display each customer payment along with the next payment amount. 
select 
	c.FirstName,
    p.PaymentID,
    p.Amount as Current_Amount,
    lead (p.Amount) over 
		(partition by C.FirstName
        order by p.PaymentID) as nxt_Amt
from orders as o
inner join customers as c
	on c.CustomerID=o.CustomerID
inner join payments as p
	on p.OrderID=o.OrderID;
    
-- 127.	Calculate the running total of completed payments. 
select
	p.PaymentID,
    p.amount,
    sum(p.Amount) over ( order by PaymentID) as running_total,
    p.PaymentStatus
from Payments as p
where p.PaymentStatus = "Success";

-- 128.	Calculate the moving average of payment amounts. 
select
	p.PaymentID,
    p.Amount,
    ( select avg(p1.Amount)
	 from payments as p1
     where p1.PaymentID
     between (p.paymentID - 2) and (p.paymentID)
     ) as mov_avg
from payments as p;
    
-- 129.	Using a Common Table Expression (CTE), display restaurants with revenue greater than ₹20,000. 
select
	o1.RestaurantID,
    (
		select sum(o2.TotalAmount)
		from orders as o2
		where o2.RestaurantID=o1.RestaurantID
     ) as revenue
from orders as o1
group by o1.RestaurantID
having revenue > 20000;

select
	rs.RestaurantID,
	rs.RestaurantName,
	sum(o.TotalAmount) as res_revenue
from orders as o
inner join restaurants as rs
	on o.RestaurantID=rs.RestaurantID
group by rs.RestaurantID,rs.RestaurantName
having res_revenue>20000;


-- 130.	Using a Common Table Expression (CTE), display customer-wise total spending. 
select
	c.CustomerID,
    c.FirstName,
    (
    select sum(o.TotalAmount)
    from orders as o
    where o.CustomerID=c.CustomerID
    ) as Spend_Amt
from customers as c;

select
	c.CustomerID,
    c.FirstName,
    sum(o.TotalAmount) as Spend
from Orders as o
inner join customers as c
	on c.CustomerID=o.CustomerID
group by c.CustomerID;

-- 131.	Display customers whose total spending is greater than the average customer spending. 
select
	c1.CustomerID,
    c1.FirstName,
	sum(o1.TotalAmount) as Cus_spend,
    ( select 
		avg(o2.TotalAmount)
        from orders as o2
	
	) as avg_Spend_Amt
from orders as o1
inner join customers as c1
	on c1.CustomerID=o1.CustomerID
group by c1.CustomerID
having Cus_spend > avg_Spend_Amt ;

-- 132.	Display orders whose value is greater than the average order value of the same restaurant.
select 
	rs1.RestaurantID,
    rs1.RestaurantName,
    sum(o1.TotalAmount) as res_amnt,
    (
		select 
         avg(o2.TotalAmount)
		from orders as o2
	
	) as avg_res_amt
    from Orders as o1
	inner join restaurants as rs1
		on o1.RestaurantID = rs1.RestaurantID
	group by  rs1.RestaurantID
    having res_amnt > avg_res_amt;
    
-- 133.	Categorize orders as Low, Medium, or High value using the CASE statement. 
select
	orderID,
    TotalAmount,
    case
		when TotalAmount<=300 then "low"
        when TotalAmount<=600 then "mid"
        else "High"
	end  as Catagorize
from orders;

-- 134.	Display the total number of completed, pending, failed, and refunded payments using conditional aggregation. 
select 
	PaymentStatus,
	count(p.PaymentStatus) as order_detail
from payments as p
group by PaymentStatus;

select
	p.PaymentStatus,
	count(p.PaymentStatus) as order_detail,
case
	when PaymentStatus = "Success" then 'Success'
    when PaymentStatus = "Pending" then 'Pending'
    when PaymentStatus = "Failed" then 'Fail'
    else 'refunded'
end as category
from payments as p
group by p.PaymentStatus;

-- 135.	Display customers who have placed at least one order. 
select
	c.CustomerID,
    c.FirstName,
    count(o.OrderID)
from customers as c
inner join orders as o
	on o.CustomerID=c.CustomerID
group by c.CustomerID
having count(o.OrderID) >=1;

-- 136.	Display customers who have never placed any order.
select
	c.CustomerID,
    c.FirstName,
    count(o.OrderID)
from customers as c
inner join orders as o
	on o.CustomerID=c.CustomerID
group by c.CustomerID
having count(o.OrderID) is null;
 
-- 137.	Display the top five restaurants based on revenue. 
select
	rank () over (order by(sum(o.TotalAmount) )desc ) as Rank_as,
	rs.RestaurantID,
    rs.RestaurantName,
    sum(o.TotalAmount)
from orders as o
inner join restaurants as rs 
	on o.RestaurantID = rs.RestaurantID
group by rs.RestaurantID
limit 5;
    
-- 138.	Display the top ten customers based on lifetime spending. 
select
	row_number() over (order by(sum(o.TotalAmount) ) desc) as Row_as,
	c.CustomerID,
    c.FirstName,
    sum(o.TotalAmount) as spend
from Orders as o
inner join customers as c
	on c.CustomerID=o.CustomerID
group by c.CustomerID
limit 10;
	
-- 139.	Display restaurants having an average customer rating greater than 4.5. 
select
	rs.RestaurantID,
    rs.RestaurantName,
    avg(rs.Rating) avg_rat
from restaurants as rs
group by rs.RestaurantID
having  avg(rs.Rating) > 4.5;
    
-- 140.	Calculate the Customer Lifetime Value (CLV) for every customer. 
select
	c.CustomerID,
    c.FirstName,
    sum(o.TotalAmount)
from Orders as o
inner join customers as c
	on c.CustomerID=o.CustomerID
group by c.CustomerID;

-- 141.	Display monthly revenue generated through completed payments. 
select
	month(o.OrderDate),
    sum(p.Amount) as revenue
from payments as p
inner join orders as o
	on o.OrderID=p.OrderID
where p.PaymentStatus = "Success"
group by month(o.OrderDate);
    
-- 142.	Display the total number of orders placed during each hour of the day. 
select
    hour(o.OrderDate),
    count(o.OrderID) as no_orders
from Orders as o
group by hour(o.OrderDate);
    
-- 143.	Display the average delivery time for each delivery partner. 
select
	dp.partnerId,
    dp.partnername,
    avg(timediff(d.deliverytime,d.assignedtime)) as deliverytime
from delivery as d
inner join Deliverypartners as dp
	on dp.partnerID = d.partnerId
group by partnerID;

-- 144.	Identify the delivery partner with the lowest average delivery time. 
select
	dp.PartnerID,
    dp.PartnerName,
    avg(timediff(d.DeliveryTime,d.AssignedTime)) as  Avg_Delivery_time
from delivery as d
inner join deliverypartners as dp
	on d.PartnerID=dp.PartnerID
group by PartnerID 
order by Avg_Delivery_time limit 1 ;

-- 145.	Rank payment methods based on completed transactions. 
select
	rank() over(order by(sum(o.TotalAmount))),
	p.PaymentMethod,
	p.PaymentStatus,
    sum(o.TotalAmount)
from orders as o
inner join payments as p
	on o.OrderID=p.OrderID
where p.PaymentStatus="Success"
group by p.PaymentMethod;
    
-- 146.	Display each restaurant's revenue along with its percentage contribution to total revenue. 
with res_each as (select
	rs.RestaurantID,
    rs.RestaurantName,
    sum(o.TotalAmount) as  revenue
from orders as o
inner join restaurants as rs
	on rs.RestaurantID=o.RestaurantID
group by rs.RestaurantID,  rs.RestaurantName)

select 
	RestaurantID,
    RestaurantName,
    revenue,
	sum(revenue) over () as total_res,
    (revenue / sum(revenue) over ())*100 as percentage 
from res_each
order by percentage ;
    
-- 147.	Display customers who have placed more than five orders.
select
	C.FirstName,
	C.CustomerID,
    count(o.OrderID) as ord_no
from orders as o
inner join customers as C
	on C.CustomerID=o.CustomerID
group by C.FirstName,C.CustomerID
having  ord_no>=5;
    
-- 148.	Display customers who have ordered from more than one restaurant. 
select
	C.CustomerID,
    C.FirstName,
    count(rs.RestaurantID) as no_res
from orders as o
inner join restaurants as rs
	on o.RestaurantID=rs.RestaurantID
inner join customers as C
	on o.CustomerID=c.CustomerID
group by  C.FirstName,C.CustomerID
having  no_res>=1;

-- 149.	Prepare a KPI dashboard showing total customers, restaurants, orders, completed payments, and reviews. 
with over_tab as(
select
	(select count(c.CustomerID)from customers c)as Total_cust,
    (select count(rs.RestaurantID)from restaurants rs)as Total_res,
    (select count(o.OrderID)from orders o)as Total_ord,
    (select count(p.PaymentStatus )from payments p  where p.PaymentStatus="Success") as Total_pay,
    (select count(r.ReviewID) from reviews r) as total_reviews)
select * 
from over_tab;

-- 150.	Prepare an executive business report showing restaurant name, total orders, total revenue, average customer rating, and average delivery time.

select
	rs.RestaurantName as res_name,
    count(o.OrderID) as tot_ord,
    sum(o.TotalAmount) as tot_revenue ,
    avg(rs.Rating) as avg_rat,
    sec_to_time(avg(timediff(d.DeliveryTime,d.AssignedTime))) as avg_delivery_time
from orders as o
inner join restaurants as rs
	on rs.RestaurantID=o.RestaurantID
inner join delivery as d
	on d.OrderID=o.OrderID
group by res_name;

    