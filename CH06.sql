/*第六章 用通配符进行过滤*/
/*这一章介绍什么是通配符，以及怎么使用 LIKE 操作符进行通配搜索，以便对数据进行复杂过滤*/
/**
  操作符何时不是操作符？答案是，它作为谓词时。从技术上说，LIKE 是谓词而不是操作符。虽然
  最终的结果是相同的，但应该对此术语有所了解，以免在 SQL 文献和手册中遇到此术语时不知所云。
  - 通配符搜索只能用于文本字段（字符串），非文本数据类型字段不能使用通配符搜索。
 */
/*LIKE 操作符*/
/**
  百分号（%）通配符：
  % 表示任何字符出现任意次数。
  注意：
  1、根据 DBMS 的不同及其配置，搜索是可以区分大小写的，如果区分大小写，则
  '%fish' 与 Fish bean bag toy 就是不匹配的。
  2、需要注意后面所跟的空格：
  有些 DBMS 会使用空格来填补字段的内容。例如，如果某列有 50 个字符，而存储
  的文本为Fish bean bag toy（17个字符），则为填满该列需要 33 个空格。这
  样做一般对数据及其使用没有影响，但是可能对匹配的 SQL 语句有负面影响。子句
  WHERE prod_name LiKE 'F%y' 只匹配以 F 开头、以 y 结尾的 prod_name。
  如果值后面跟空格，则不是以 y 结尾，所以 Fish bean bag toy 就不会检索出来。
  简单的解决方法是给搜索模式再增加一个 % 号: 'F%y%' 还匹配 y 之后的字符（或空格）。
  更好的解决方法是用函数去掉空格。
 */
SELECT prod_name
FROM Products
WHERE prod_name LIKE 'F%y';

/**
  下划线（_）通配符，则只匹配单个字符，而不是多个字符。
 */
SELECT prod_id, prod_name
FROM Products
WHERE prod_name LIKE '__ inch teddy bear'
   OR prod_name LIKE '_ inch teddy bear';

/**
  方括号（[]）通配符用来指定一个字符集，它必须匹配指定位置
  SQL Server 支持这种方式，但是 MySQL、Oracle、DB2、SQLite 都不支持。
 */
#  MySQL 不支持 '[]'，因此查询结果为空
SELECT cust_contact
FROM Customers
WHERE cust_contact LIKE '[JM]%'
ORDER BY cust_contact;

/**
  使用通配符的技巧：
  - 不要过度使用通配符。如果其他操作符能达到相同的目的，应该使用其他操作符
  - 在确实需要使用通配符时，也尽量不要把它们用在搜索模式的开始处。把通配符置于开始处，搜索起来是最慢的
  - 仔细注意通配符的位置。如果放错地方，可能不会返回想要的数据
 */

/*挑战题*/
# T1
SELECT prod_name, prod_desc
FROM Products
WHERE prod_desc LIKE '%toy%';

# T2
SELECT prod_name, prod_desc
FROM Products
WHERE prod_desc NOT LIKE '%toy%'
ORDER BY prod_name;

# T3
SELECT prod_name, prod_desc
FROM Products
WHERE prod_desc LIKE '%toy%'
  AND prod_desc LIKE '%carrots%';

# T4
SELECT prod_name, prod_desc
FROM Products
WHERE prod_desc LIKE '%toy%carrots%';










