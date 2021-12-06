/*第九章 汇总数据*/
/*这一课介绍什么是 SQL 的聚集函数，如何利用它们汇总表的数据*/

/**
  聚集函数：
  对某些行运行的函数，计算并返回一个值
  AVG(): 返回某列的平均值
  COUNT(): 返回某列的行数
  MAX(): 返回某列的最大值
  MIN(): 返回某列的最小值
  SUM(): 返回某列值之和
 */

/**
  AVG() 函数忽略列值为 NULL 的行，AVG() 只能用来确定特定数值列的平均值，而且列名必须作为函数参数给出
 */
SELECT AVG(DISTINCT prod_price) AS avg_price
FROM Products;

/**
  COUNT() 函数有两种使用方式：
  1、使用 COUNT(*) 对表中行的数目进行计数，不管表列中包含的是空值（NULL）还是非空值
  2、使用 COUNT(column) 对特定列中具有值的行进行计数，忽略 NULL 值
 */
SELECT COUNT(*) AS num_cust
FROM Customers;

SELECT COUNT(cust_email) AS num_cust
FROM Customers;

/**
  MAX() 函数和 MIN() 函数:
  虽然 MAX() 一般用来找出最大的数值或日期值，但许多 DBMS 允许将它用来返回任意列中的最大值，包括返回
  文本列的最大值。在用于文本数据时，MAX() 返回按该列排序后的最后一行（注：MIN() 则返回按该列排序后的
  第一行）。MAX() 函数和 MIN() 函数都忽略列值为 NULL 的行
 */

SELECT MAX(prod_price) AS pro_price_max, MIN(prod_name)
FROM Products;

/**
  SUM() 函数用来返回指定列值的和，SUM() 函数也可以用来合计计算值
  在多个列上进行计算:
  如下面的列子所示，利用标准的算术操作符，所有的聚集函数都可以用来执行多个列上的计算
 */

SELECT SUM(item_price * quantity) AS total_price
FROM OrderItems
WHERE order_num = 20005;

/**
  聚集不同的值: 以上的五个聚集函数都可以如下使用
  1、对所有行执行计算，指定 ALL 参数或不指定参数（默认参数就是 ALL）
  2、只包含不同的值，指定 DISTINCT 参数
 */

-- 使用了 DISTINCT 参数，因此平均值只考虑不同的价格
SELECT AVG(DISTINCT prod_price) AS avg_price
FROM Products
WHERE vend_id = 'DLL01';

-- DISTINCT 不能用于 COUNT(*)，必须使用列名
SELECT COUNT(vend_id), COUNT(DISTINCT vend_id)
FROM Products;

/*挑战题*/
-- T1
SELECT SUM(quantity)
FROM OrderItems;

-- T2
SELECT SUM(quantity)
FROM OrderItems
WHERE prod_id = 'BR01';

-- T3
SELECT MAX(prod_price) AS max_price
FROM Products
WHERE prod_price <= 10;