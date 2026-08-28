CREATE TABLE orders (
    OrderID VARCHAR(20) PRIMARY KEY,
    Date TIMESTAMP,
    CustomerID VARCHAR(20),
    Product VARCHAR(50),
    Quantity INT,
    UnitPrice NUMERIC(10, 2),
    ShippingAddress VARCHAR(255),
    PaymentMethod VARCHAR(50),
    OrderStatus VARCHAR(50),
    TrackingNumber VARCHAR(50),
    ItemsInCart INT,
    CouponCode VARCHAR(50),
    ReferralSource VARCHAR(50),
    TotalPrice NUMERIC(10, 2)
);

SELECT * FROM orders LIMIT 10;

SELECT orderid, customerid, product, totalprice, orderstatus 
FROM orders 
WHERE orderstatus = 'Delivered';

SELECT 
    product, 
    COUNT(orderid) AS order_count,
    SUM(quantity) AS total_units_sold,
    SUM(totalprice) AS total_revenue, 
    ROUND(AVG(unitprice), 2) AS avg_unit_price
FROM orders 
GROUP BY product
ORDER BY total_revenue DESC;

SELECT 
    paymentmethod, 
    COUNT(orderid) AS transaction_count,
    SUM(totalprice) AS total_revenue 
FROM orders 
GROUP BY paymentmethod 
HAVING SUM(totalprice) > 250000 
ORDER BY total_revenue DESC;

SELECT 
    product,
    SUM(totalprice) AS product_revenue,
    ROUND(
        (SUM(totalprice) / (SELECT SUM(totalprice) FROM orders)) * 100, 
        2
    ) AS percentage_contribution
FROM orders
GROUP BY product
ORDER BY product_revenue DESC;

SELECT 
    orderstatus, 
    COUNT(orderid) AS total_orders,
    SUM(totalprice) AS status_revenue
FROM orders
GROUP BY orderstatus
HAVING COUNT(orderid) > 235
ORDER BY total_orders DESC;