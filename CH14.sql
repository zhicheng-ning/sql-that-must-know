/*第十四章 组合查询*/
/*本章讲述如何利用 UNION 操作符将多条 SELECT 语句组合成一个结果集*/

/**
  SQL 允许执行多个查询（多条 SELECT 语句），并将结果作为一个查询结果集返回，这些组合查询通常
  被称为并（union），主要有两种情况需要使用组合查询:
  1、在一个查询中从不同的表返回结构数据
  2、对一个表执行多个查询，按一个查询返回数据
 */

/**
  创建组合查询:
  可以使用 UNION 操作符来组合数条 SQL 查询，利用 UNION ，可给出多条 SELECT 语句，
  将它们的结果组合成一个结果集。注意：任何具有多个 WHERE 子句的 SELECT 语句都可以
  作为一个组合查询。
 */

SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
   OR cust_name = 'Fun4All';

SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All';

/**
  UNION 规则:
  1、UNION 必须由两条或两条以上的 SELECT 语句组成，语句之间用关键字 UNION 分隔
  2、UNION 中的每个查询都必须包含相同的列、表达式或聚集函数（不过，各个列不需要以
  相同的次序列出）
  3、列数据类型必须兼容：类型不必完全相同，但必须是 DBMS 可以隐含转换的类型
 */

/**
  包含或取消重复的行：
  UNION 从查询结果集中自动去除了重复的行；换句话说，它的行为与一条 SELECT 语句中使用
  多个 WHERE 子句条件一样。这是 UNION 的默认行为，如果想返回所有的匹配行，可使用 UNION ALL
  而不是 UNION
 */

SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION ALL
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All';

/**
  对组合查询结果排序：
  在使用 UNION 组合查询时，只能使用一条 ORDER BY 子句，它必须位于最后一条 SELECT 语句之后，
  对于结果集，不存在用一种方式排序一部分，而用另外一种方式排序另一部分的情况，因此不允许使用多
  条 ORDER BY 子句
 */

SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All'
ORDER BY cust_name, cust_contact;

/*挑战题*/
-- T1
SELECT prod_id, quantity
FROM OrderItems
WHERE quantity = 100
UNION
SELECT prod_id, quantity
FROM OrderItems
WHERE prod_id LIKE 'BNBG%'
ORDER BY prod_id;

-- T2
SELECT prod_id, quantity
FROM OrderItems
WHERE quantity = 100 OR prod_id LIKE 'BNBG%'
ORDER BY prod_id;

-- T3
SELECT prod_name
FROM Products
UNION
SELECT cust_name
FROM Customers
ORDER BY prod_name;

-- T4
/*有误，在使用 UNION 组合查询时，只能使用一条 ORDER BY 子句，它必须位于最后一条 SELECT 语句之后*/