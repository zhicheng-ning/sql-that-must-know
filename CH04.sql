/*第四课 过滤数据*/
/*如何使用 SELECT 语句的 WHERE 字句指定搜索条件*/

/**
  SQL 过滤和应用层过滤，数据也可以在应用层过滤，客户端代码对返回数据进行循环，提取出所需的行，
  但是，这种做法极为不妥，因为让客户端（或开发语言）处理数据库的工作将会极大的影响到应用的性能，
  并且使所创建的应用不具备可伸缩性。此外，如果在客户端过滤数据，服务器不得不通过网络发送多余的
  数据，这将导致网络带宽的浪费。
 */

/**
  在同时使用 WHERE 字句和 ORDER BY 字句的时候，应该让 ORDER BY 字句位于 WHERE 子句之后，
  否则将会产生错误。
 */
/*BETWEEN AND 匹配范围内的所有值，包括开始值和结束值*/
SELECT prod_name, prod_price
FROM Products
WHERE prod_price BETWEEN 4 AND 10;

/**
  需要注意 NULL 值，它与字段包含 0、空字符串或仅仅包含空格不同。
  确定值是否为 NULL ，不能简单地检查是否等于 NULL，而应该使用 IS NULL
 */
# 错误写法
SELECT cust_name, cust_email
FROM Customers
WHERE cust_email = NULL;
# 正确写法
SELECT cust_name, cust_email
FROM Customers
WHERE cust_email IS NULL;

/**
  通过过滤选择不包含指定值的所有行时，你可能希望返回含有 NULL 值的行。但是这做不到，因为 NULL 值比较
  特殊，所以在进行匹配过滤或非匹配过滤的时候，不会返回这些结果。
 */
SELECT cust_name, cust_email
FROM Customers
WHERE cust_email != 'sales@villagetoys.com';


/*不匹配检查*/
/**
  单引号用来限定字符串，如果将值与字符串类型的列进行比较，就需要限定引号。
  用来与数值列进行比较的值不用引号。
 */

SELECT vend_id, prod_name
FROM Products
WHERE vend_id != 'DLL01';

/*挑战题*/
# T1
SELECT prod_id, prod_name, prod_price
FROM Products
WHERE prod_price = 9.49;

# T2
SELECT prod_id, prod_name, prod_price
FROM Products
WHERE prod_price >= 9.49;

# T3
SELECT DISTINCT order_num
FROM OrderItems
WHERE quantity >= 100;

# T4
SELECT prod_name, prod_price
FROM Products
WHERE prod_price BETWEEN 3 AND 6
ORDER BY prod_price;






