/*第七章 创建计算字段*/
/*这一章介绍什么是计算字段，如何创建计算字段，以及如何从应用中使用别名引用它们*/

/**
  计算字段：
  1、一般而言，存储在表中的数据都不是应用程序所需要的，我们需要直接从数据库中检索出
  "转换、计算或格式化过的数据"，而不是检索出数据，然后再在应用程序中重新进行计算或
  格式化
  2、计算字段并不实际存储于数据库表中，计算字段是运行时在 SELECT 语句内创建的
  3、SQL 语句内可完成的许多转换和格式化工作都可以直接在客户端应用程序内完成，但
  一般来说，在数据库服务器上完成这些操作，比在客户端中完成要快得多。
 */

/**
  拼接：将值联结到一起（将一个值附加到另一个值）构成单个值
  根据你所使用的 DBMS ,此操作可用加号（+）或两个竖杠（||）
  表示。在 MySQL 和 MariaDB 中，必须使用特殊的函数。
 */
/*TRIM()去掉字符串左右两边的空格*/
SELECT CONCAT(TRIM(vend_name), '(', TRIM(vend_country), ')')
FROM Vendors
ORDER BY vend_name;

/**
  使用别名：
  1、一个未命名的列名不能用于客户端应用中，因为客户端没有办法引用它。为了解决
  这个问题，SQL 支持列别名。别名（alias）是一个字段或值的替换名。别名使用AS
  关键字赋予
  2、很多 DBMS 中，AS 关键字是可选的，不过在实践中最好使用它
  3、别名最常用的使用时将多个单词的列名重命名为一个单词的名字
 */
SELECT CONCAT(RTRIM(vend_name), '(', LTRIM(vend_country), ')') AS vend_title
FROM Vendors
ORDER BY vend_name;

/**
  执行算术计算：计算字段的另一常见用途就是对检索出的数据进行算术计算
  如何测试计算？
  SELECT 语句为测试、检验函数和计算提供了很好的方法。SELECT 语句在
  省略了 FROM 子句后就是简单地访问和处理表达式，例如 SELECT 3*2;将
  返回 6，SELECT TRIM(' abc ')将返回abc,SELECT CURRENT_TIMESTAMP
  将返回当前的日期和时间
 */
SELECT prod_id, quantity, item_price, quantity * item_price AS expanded_price
FROM OrderItems
WHERE order_num = 20008;

SELECT 3*2;
SELECT TRIM(' ning zhi cheng ');
SELECT CURDATE();
SELECT CURRENT_TIMESTAMP;

/*挑战题*/
# T1
SELECT vend_id, vend_name AS vname, vend_address AS vaddress, vend_city AS vcity
FROM Vendors
ORDER BY vend_name;

# T2
SELECT prod_id, prod_price, prod_price * 0.9 AS sale_price
FROM Products;




