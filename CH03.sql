/*第三章 排序检索数据*/
/*按照单列排序*/
SELECT prod_name
FROM Products
ORDER BY prod_name;

/*按照多列排序*/
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY prod_price DESC, prod_name ASC;

/*
按照列位置排序等价于上面的“按照多列排序”，
此处的 2，3 为 SELECT 清单中的第二和三列
  */
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY 2 DESC, 3 ASC;

/*
排序方向关键字只应用到直接位于其前面的列名；
如果想在多个列上进行降序排序，，必须对每一列都指定 DESC 关键字
*/
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY prod_price, prod_name DESC;


/*挑战题*/
# T1
SELECT cust_name
FROM Customers
ORDER BY cust_name DESC;

# T2
SELECT cust_id, order_num, order_date
FROM Orders
ORDER BY cust_id, order_date DESC;

# T3
SELECT quantity, item_price
FROM OrderItems
ORDER BY quantity DESC, item_price DESC;



