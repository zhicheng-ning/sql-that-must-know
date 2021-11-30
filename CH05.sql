/*第五章 高级数据过滤*/
/*本章讲授如何组合 WHERE 子句以建立功能更强、更高级的搜索条件，还有学习 NOT 和 IN 操作符*/

/**
  操作符：
  用来联结或改变 WHERE 子句中的子句的关键字（AND 操作符和 OR 操作符）
 */
/*AND 操作符*/
SELECT prod_id, prod_price, prod_name
FROM Products
WHERE vend_id = 'DLL01'
  AND prod_price <= 4;

/*OR 操作符*/
SELECT prod_name, prod_price
FROM Products
WHERE vend_id = 'DLL01'
   OR vend_id = 'BRS01';

/**
  在 WHERE 子句中使用圆括号：
  在任何时候使用具有 AND 和 OR 操作符的 WHERE 子句中，都应该使用圆括号
  明确地分组操作符。不要过分依赖默认求值顺序
 */
# 错误
SELECT prod_name, prod_price
FROM Products
WHERE vend_id = 'DLL01'
   OR vend_id = 'BRS01' AND prod_price >= 10;
# 正确
SELECT prod_name, prod_price
FROM Products
WHERE (vend_id = 'DLL01' OR vend_id = 'BRS01')
  AND prod_price >= 10;

/**
  IN 操作符：
  IN 操作符用来指定条件范围，范围中的每个条件都可以进行匹配。
  IN 取一组由逗号分隔、括在圆括号中的合法值。IN 操作符与 OR 操作符的功能相当。
  IN 操作符的优点有：
  - IN 操作符一般比一组 OR 操作符执行得更快
  - IN 操作符最大的优点是可以包含其他的 SELECT 语句，能够更动态地建立 WHERE 子句
 */
SELECT prod_name, prod_price
FROM Products
WHERE vend_id IN ('DLL01', 'BRS01')
ORDER BY prod_name;

/**
  NOT 操作符
  WHERE 子句中的 NOT 操作符有且只有一个功能，那就是否定其后跟的任何条件。
  因为 NOT 从来不单独使用（它总是与其他操作符一起使用），所以它的语法与其他
  操作符有所不同。NOT 关键字可以用在要过滤的列前，而不是在列后。
  - NOT 在与 IN 操作符联合使用时，NOT 可以非常简单地找出与条件列表不匹配的行。
 */
SELECT prod_name, vend_id
FROM Products
WHERE NOT vend_id = 'DLL01'
ORDER BY prod_name;

/*挑战题*/
# T1
SELECT vend_name
FROM Vendors
WHERE vend_country = 'USA'
  AND vend_city = 'California';

# T2
SELECT order_num, prod_id, quantity
FROM OrderItems
WHERE prod_id IN ('BR01', 'BR02', 'BR03')
  AND quantity >= 100;

# T3
SELECT prod_name, prod_price
FROM Products
WHERE prod_price >= 3
  AND prod_price <= 6
ORDER BY prod_price;

# T4
# ORDER BY 子句应该在 WHERE 子句的后面









