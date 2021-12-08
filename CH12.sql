/*第十二章 联结表*/
/*这一课会介绍什么是联结，为什么使用联结，如何编写使用联结的 SELECT 语句*/

/**
  SQL 最强大的功能之一就是能在数据查询的执行中联结（join）表。联结是利用 SQL 的
  SELECT 能执行的最重要的操作。联结是 SQL 中一个最重要、最强大的特性，有效地使用
  联结需要对关系数据库设计有基本的了解。

  相同的数据出现多次决不是一件好事，这是关系型数据库设计的基础，关系表的设计就是要把
  信息分解成多个表，一类数据一个表。各个表通过某些共同的值互相关联（所以才叫关系型数据库）

  关系型数据库可以有效地存储，方便地处理，因此关系型数据库的可伸缩性远比非关系型数据库要好
 */

/**
  创建联结:
  创建联结的方式非常简单，指定要联结的所有表以及关联它们的方式即可
  下面的例子中:
  使用 WHERE 子句建立联结关系似乎有点奇怪，但实际上是有个很充分的理由的。
  在联结两个表时，实际要做的是将第一个表中的每一行和第二个表中的每一行配对，
  WHERE 子句作为过滤条件，只包含那些匹配给定条件（这里是联结条件）的行，如果
  没有 WHERE 子句，第一个表中的每一行将与第二个表中的每一行配对，而不管他们逻
  辑上是否能配在一起。

  笛卡尔积:
  由没有联结条件的表关系返回的结果为笛卡尔积。检索出的行的数目将使
  第一个表中的行数乘以第二个表中的行数。（有时，返回笛卡尔积的联结，
  也称叉联结，即 cross join）
 */
SELECT vend_name, prod_name, prod_price
FROM Vendors,
     Products
WHERE Vendors.vend_id = Products.vend_id;

/**
  内联结（inner join）:
  等值联结（equijoin）是基于两个表之间的相等测试，也称作内联结（inner join）
  下面的 SELECT 语句返回与前面例子完全相同的数据
  此语句中的 SELECT 与前面的 SELECT 语句相同，但 FROM 子句不同。这里，两个
  表之间的关系是以 INNER JOIN 指定的部分 FROM 子句。在使用这种语法时，联结条
  件用特定的 ON 子句而不是 WHERE 子句给出，传递给 ON 的实际条件与传递给 WHERE
  的相同。

  值得一提的是:
  ANSI SQL 规范首选 INNER JOIN 语法，之前使用的是简单的等值语法。DBMS 都支持
  简单格式和标准格式，具体可选择自己更顺手的。
 */
SELECT vend_name, prod_name, prod_price
FROM Vendors
         INNER JOIN Products P on Vendors.vend_id = P.vend_id;

/**
  联结多个表:
  SQL 不限制一条 SELECT 语句中可以联结的表的数目。创建联结的基本规则也相同，
  首先列出所有表，然后定义表之间的关系。需要注意的是，不要联结不必要的表，联结
  的表越多，性能下降得越厉害。
 */
SELECT prod_name, vend_name, prod_price, quantity
FROM OrderItems,
     Products,
     Vendors
WHERE Products.vend_id = Vendors.vend_id
  AND OrderItems.prod_id = Products.prod_id
  AND order_num = 20007;

/*挑战题*/
-- T1
SELECT cust_name, order_num
FROM Customers,
     Orders
WHERE Customers.cust_id = Orders.cust_id
ORDER BY cust_name, order_num;

SELECT cust_name, order_num
FROM Customers
         INNER JOIN Orders O on Customers.cust_id = O.cust_id
ORDER BY cust_name, order_num;

-- T2
SELECT cust_name,
       order_num,
       (SELECT SUM(quantity * item_price) FROM OrderItems WHERE OrderItems.order_num = Orders.order_num)
FROM Customers,
     Orders
WHERE Customers.cust_id = Orders.cust_id
ORDER BY cust_name, order_num;

SELECT cust_name, Orders.order_num, SUM(quantity * item_price)
FROM Customers,
     Orders,
     OrderItems
WHERE Customers.cust_id = Orders.cust_id
  AND Orders.order_num = OrderItems.order_num
GROUP BY cust_name, OrderItems.order_num
ORDER BY cust_name, OrderItems.order_num;

-- T3
SELECT cust_id, order_date
FROM Orders,
     OrderItems
WHERE Orders.order_num = OrderItems.order_num
  AND prod_id = 'BR01'
ORDER BY order_date;

-- T4
SELECT cust_email
FROM Customers
         INNER JOIN Orders O on Customers.cust_id = O.cust_id
         INNER JOIN OrderItems OI on O.order_num = OI.order_num
WHERE prod_id = 'BR01';

-- T5
SELECT  DISTINCT cust_name
FROM Customers,
     Orders,
     OrderItems
WHERE Customers.cust_id = Orders.cust_id
  AND Orders.order_num = OrderItems.order_num
GROUP BY cust_name, OrderItems.order_num
HAVING SUM(quantity * item_price) >= 1000
ORDER BY cust_name;