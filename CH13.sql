/*第十三章 创建高级联结*/
/*本章讲解另外一些联结（包括他们的含义和使用方法），介绍如何使用表别名，如何对被联结的表使用聚集函数*/

/**
  表别名：
  SQL 除了可以对列名和计算字段使用别名，还允许给表名起别名，主要是因为：
  1、缩短 SQL 语句
  2、允许在一条 SELECT 语句中多次使用相同的表

  注意: 表别名不只用于 WHERE 子句，还可以用于 SELECT 的列表、ORDER BY 子句以及其他语句部分
 */

SELECT cust_name, cust_contact
FROM Customers AS C,
     Orders AS O,
     OrderItems AS OI
WHERE C.cust_id = O.cust_id
  AND OI.order_num = O.order_num
  AND prod_id = 'RGAN01';

/**
  使用不同类型的联结：
  除了前几章使用过的内联结或等值联结这种简单联结，还有其他几种联结：
  1、自联结（self-join）
  2、自然联结（natural-join）
  3、外联结（outer-join）
 */

/**
  自联结：
  使用表别名的一个主要原因是能在一条 SELECT 语句中不止一次引用相同的表
  自联结通常作为外部语句用来替代从相同表中检索数据的子查询语句，虽然结果
  都相同，但大部分的 DBMS 处理联结远比处理子查询快得多
 */
-- 子查询
SELECT cust_id, cust_name, cust_contact
FROM Customers
WHERE cust_name = (SELECT cust_name
                   FROM Customers
                   WHERE cust_contact = 'Jim Jones');
-- 自联结
SELECT c1.cust_id, c1.cust_name, c1.cust_contact
FROM Customers AS c1,
     Customers AS c2
WHERE c1.cust_name = c2.cust_name
  AND c2.cust_contact = 'Jim Jones';

/**
  自然联结：
  无论何时对表进行联结，应该至少有一列不止出现在一个表中（被联结的列）。标准的联结（上一章
  介绍的内联结）返回所有的数据，相同的列甚至多次出现。自然联结排除多次出现，使每一列只返回
  一次（重点！！！）。
  自然联结要求你只能选择那些唯一的列，一般通过对一个表使用通配符，而对其他表的列使用明确的
  子集来完成
 */

SELECT C.*, O.order_num, O.order_date, OI.prod_id, OI.quantity, OI.item_price
FROM Customers AS C,
     Orders AS O,
     OrderItems AS OI
WHERE C.cust_id = O.cust_id
  AND OI.order_num = O.order_num
  AND prod_id = 'RGAN01';

-- 自然联结
/**
  "自然联结"不需要使用 where 或者是 on 限定条件，它会自动根据字段的只加以匹配，这就是"自然"两个字的含义，即自发的匹配。
  但是，自然结合 这种自发的匹配并不是随意的 它必须有一个严格的限制条件，那就是两个表中必须要具有公共字段，而且这两个公共
  字段的名称必须一样，值得类型也必须一样，才能让其"自发"的匹配。
  小结：
  1、自然连接是特殊的内联结（等值联结），自然联结不能有 where 和 on 去限制筛选
  2、等值连接要求相等的分量，不一定是公共属性（即相同的列名）；而自然连接要求相等的公共属性（列名）。
 */
SELECT C.*, O.order_num, O.order_date, OI.prod_id, OI.quantity, OI.item_price
FROM Customers AS C
         NATURAL JOIN Orders O
         NATURAL JOIN OrderItems OI
WHERE prod_id = 'RGAN01';

/**
  外联结：
  联结包含了那些在相关表中没有关联行的行，这种联结乘为外联结
  下面例子中的 SELECT 语句中使用了关键字 OUTER JOIN 来指定
  联结类型（而不是在 WHERE 子句中指定），但是，与内联结关联两
  个表不同的是，外联结还包括没有关联行的行。
  在使用外联结的语法是，必须使用 RIGHT 或 LEFT 关键字指定包含
  其所有行的表（RIGHT 指出的是 OUTER JOIN 右边的表（即从右边的
  表选择所有行），LEFT 指出的是 OUTER JOIN 左边的表（即从左边的
  表选择所有行））

  注意：还存在另一种外联结，就是全外联结（full outer join），它检索
  两个表中的所有行并关联可以关联的行，即全外联结包含两个表的不关联的行

  MariaDB。MySQL、和 SQLite 不支持 FULL OUTER JOIN 语法
 */

SELECT Customers.cust_id, O.order_num
FROM Customers
         LEFT OUTER JOIN Orders O on Customers.cust_id = O.cust_id;

SELECT Customers.cust_id, O.order_num
FROM Customers
         RIGHT JOIN Orders O on Customers.cust_id = O.cust_id;

/**
  使用带聚集函数的联结：
  下面的两个例子是检索所有顾客以及每个顾客所下的订单数
 */
-- 内联结
SELECT Customers.cust_id, COUNT(order_num) AS num_order
FROM Customers
         INNER JOIN Orders O on Customers.cust_id = O.cust_id
GROUP BY Customers.cust_id;


-- 左外联结
SELECT Customers.cust_id, COUNT(order_num) AS num_order
FROM Customers
         LEFT OUTER JOIN Orders O on Customers.cust_id = O.cust_id
GROUP BY Customers.cust_id;

/**
  使用联结和联结条件的注意要点：
  1、注意所使用的联结类型。一般我们使用内联结，但使用外联结也有效
  2、关于确切的联结语法，应该查看具体的文档，看相应的 DBMS 支持何种语法
  3、保证使用正确的联结条件（不管采用哪种语法），否则会返回不正确的数据
  4、应该总是提供联结条件，否则会得出笛卡尔积
  5、在一个联结中可以包含多个表，甚至可以对每个联结采用不同的联结类型。虽然这样
  做是合法的，一般也很有用，但应该在一起测试它们前分别测试每个联结。这会是故障排
  除更为简单。
 */

/*挑战题*/
-- T1
SELECT cust_name, order_num
FROM Customers
         INNER JOIN Orders O on Customers.cust_id = O.cust_id;

-- T2
SELECT cust_name, order_num
FROM Customers
         LEFT OUTER JOIN Orders O on Customers.cust_id = O.cust_id;

-- T3
SELECT prod_name, order_num
FROM Products
         LEFT OUTER JOIN OrderItems OI on Products.prod_id = OI.prod_id
ORDER BY prod_name;

-- T4
SELECT prod_name, COUNT(order_num) AS num_order
FROM Products
         LEFT OUTER JOIN OrderItems OI on Products.prod_id = OI.prod_id
GROUP BY prod_name
ORDER BY prod_name;

-- T5
SELECT Vendors.vend_id, COUNT(prod_id) AS num_prod
FROM Vendors
         LEFT OUTER JOIN Products P on Vendors.vend_id = P.vend_id
GROUP BY Vendors.vend_id;

SELECT Vendors.vend_id, COUNT(prod_id) AS num_prod
FROM Vendors
         LEFT OUTER JOIN Products P on Vendors.vend_id = P.vend_id
GROUP BY Vendors.vend_id;