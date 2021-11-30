/*第二章 检索数据 */
SELECT prod_name
FROM Products;

# DISTINCT 作用于所有列，而不仅仅只作用于它后面跟着的一列
SELECT  vend_id, prod_price
FROM Products;
SELECT DISTINCT vend_id, prod_price
FROM Products;

# OFFSET 从第几行开始 LIMIT 取几条数据
SELECT prod_name
FROM Products
LIMIT 5 OFFSET 0;

/*与上面的 LIMIT 5 OFFSET 0 等价*/
SELECT prod_name
FROM Products
LIMIT 0,5;

/*挑战题*/
/*T1*/
SELECT cust_id
FROM Customers;

/*T2*/
SELECT DISTINCT prod_id
FROM OrderItems;

/*T3*/
# SELECT *
SELECT cust_id,cust_name
FROM Customers;





