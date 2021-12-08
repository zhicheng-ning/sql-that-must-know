/*第十一章 使用子查询*/
/*这一章介绍什么是子查询，如何使用它们*/

/**
  利用子查询进行过滤
  在 SELECT 语句中，子查询总是从内向外处理;
  对于能嵌套的子查询的数目没有限制，不过在实际使用时由于性能的限制，不能嵌套太多的子查询
  注意：作为子查询的 SELECT 语句只能查询单个列，企图检索多个列将返回错误
 */

SELECT cust_name, cust_contact
FROM Customers
WHERE cust_id IN
      (SELECT cust_id
       FROM Orders
       WHERE order_num IN (SELECT order_num
                           FROM OrderItems
                           WHERE prod_id = 'RGAN01'));

/**
  作为计算字段使用子查询
  下面例子中的 orders 是一个计算字段，它是由圆括号中的子查询建立的，该子查询对
  检索出的每一个顾客执行一次。子查询中的 WHERE 子句中使用了完全限定列名，而不是
  列名（cust_id），它指定表名和列名（Orders.cust_id 和 Customers.cust_id），
  用一个句点分隔表名和列名，在有可能混淆列名的时候必须使用这种语法。
 */

SELECT cust_name,
       cust_state,
       (SELECT COUNT(*) FROM Orders WHERE Orders.cust_id = Customers.cust_id) AS orders
FROM Customers
ORDER BY cust_name;

/*挑战题*/
-- T1
SELECT cust_id
FROM Orders
WHERE order_num IN (SELECT order_num FROM OrderItems WHERE item_price >= 10);

-- T2
SELECT cust_id, order_date
FROM Orders
WHERE order_num IN (SELECT order_num FROM OrderItems WHERE prod_id = 'BR01')
ORDER BY order_date;

-- T3
SELECT cust_id, cust_email
FROM Customers
WHERE cust_id IN (SELECT cust_id
                  FROM Orders
                  WHERE order_num IN
                        (SELECT order_num FROM OrderItems WHERE prod_id = 'BR01'));

-- T4
SELECT cust_id,
       SUM((SELECT SUM(item_price * quantity)
            FROM OrderItems
            WHERE Orders.order_num = OrderItems.order_num
            GROUP BY Orders.order_num)) AS total_ordered
FROM Orders
GROUP BY cust_id
ORDER BY total_ordered DESC;

-- T5
SELECT prod_name,
       (SELECT SUM(quantity)
        FROM OrderItems
        WHERE OrderItems.prod_id = Products.prod_id
       ) AS quant_sold
FROM Products;


