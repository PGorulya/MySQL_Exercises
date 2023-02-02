SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM Orders
LEFT JOIN Customers
Customers ON Orders.CustomerID=Customers.CustomerID
LEFT JOIN Shippers
Shippers ON Orders.ShipperID= Shippers.ShipperID
WHERE Customers.Country='USA';