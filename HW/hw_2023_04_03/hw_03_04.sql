-- (1) Описать связи между таблицами БД "песочница"
-- 	Customers.CustomerID	(1:M)	Orders.CustomerID
-- 	Categories.CategoryID	(1:M)	Products.CategoryID
-- 	Employees.EmployeeID	(1:M)	Orders.EmployeeID
-- 	Orders.OrderID			(1:M)	OrderDetails.OrderID
-- 	Products.ProductID		(1:M)	OrderDetails.ProductID
-- 	Shippers.ShipperID		(1:M)	Orders.ShipperID
-- 	Suppliers.SupplierID	(1:M)	Products.SupplierID

-- (2) Вывести страны клиентов (БД platform)
select user_id, fullname, country from users;

-- (3) Вывести пользователей без пароля (БД platform)
select user_id, fullname, password
from users
where password = '' or password = null;

-- (4) Вывести страны донаторов с максимальным и минимальным пожертвованиями (БД platform)
(select donations.donation_id, users.fullname, users.country, donations.amount
from donations
join users on donations.donation_id = users.user_id
order by donations.amount
limit 1)
union
(select donations.donation_id, users.fullname, users.country, donations.amount
from donations
join users on donations.donation_id = users.user_id
order by donations.amount desc
limit 1);