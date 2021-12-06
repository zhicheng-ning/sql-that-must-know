/*第八章 使用函数处理数据*/
/*这一章介绍什么是函数，DBMS 支持何种函数，以及如何使用这些函数；还将讲解为什么 SQL 函数的使用可能会带来问题*/

/**
  函数带来的问题：
  与几乎所有的 DBMS 都等同地支持 SQL 语句不同，每一个 DBMS 都有特定的函数。实际上，只有少数几个函数被所有主要的
  DBMS 等同地支持。虽然所有类型的函数一般都可以在每个 DBMS 中使用，但各个函数的名称和语法可能极其不同，即：与 SQL
  语句不同，SQL 函数是不可移植的。这意味着为特定 SQL 实现编写的代码在其他实现中可能不可用。
  注：如果你决定使用函数，应该保证做好代码注释，以便以后你自己（或其他人）能确切地知道这些代码的含义。
 */
/**
  使用函数：大多数 SQL 支持以下函数
  1、用于处理文本字符串（如删除或填充值，转换值为大写或小写）的文本函数
  2、用于在数值数据上进行算术操作（如返回绝对值，进行代数运算）的数值函数
  3、用于处理日期和时间值并从这些值中提取特定成分（如返回两个日期之差，检查日期有效性）的日期和时间函数
  4、用于生成简单易懂的输出内容的格式化函数（如用语言形式表达出日期，用货币符号和千分位表示金额）
  5、返回 DBMS 正使用的特殊信息（如返回用户登录信息）的系统函数
 */

/**
  文本处理函数:
  TRIM(str:varchar): 去除字符串左右两边的空格
  UPPER(str:varchar): 将字符串转换为大写
  LOWER(str:varchar): 将字符串转换为小写
  LEFT(str:varchar,len:int): 返回字符串 str 最左边长度为 len 的子字符串
  RIGHT(str:varchar,len:int): 返回字符串 str 最右边长度为 len 的子字符串
  SUBSTRING(str:varchar,pos:int,len:int): 返回字符串从第 pos 个位置开始长度为 len 的子字符串
  SOUNDEX(str:varchar): 返回字符号串的 SOUNDEX 值

  注: SOUNDEX 是一个将任何文本串转换为描述其语音表示的字母数字模式的算法。SOUNDEX 考虑了类似的发音字符
  和音节，使得能够对字符串进行发音比较而不是字母比较，详细看下面的示例
 */
SELECT vend_name,
       TRIM(vend_name)  AS vend_name_trim,
       UPPER(vend_name) AS vend_name_upcase,
       LOWER(vend_name) AS vend_name_lower,
       LEFT(vend_name, 5),# 等价于 SUBSTRING(vend_name, 1, 5)
       RIGHT(vend_name, 5),# 等价于 SUBSTRING(vend_name, -5)
       SUBSTRING(vend_name, 1, 5),
       SUBSTRING(vend_name, -5)
FROM Vendors
ORDER BY vend_name;

/**
  SOUNDEX 例子
  WHERE 子句使用 SOUNDEX() 函数把 cust_contact 列值和搜索字符串转换为
  它们的 SOUNDEX 值。因为 Michael Green 和 Michelle Green 发音相似，
  所以它们的 SOUNDEX 值匹配，因此 WHERE 子句正确过滤出了所需的数据
 */
SELECT cust_name, cust_contact
FROM Customers
WHERE cust_contact = 'Michael Green';

SELECT cust_name, cust_contact
FROM Customers
WHERE SOUNDEX(cust_contact) = SOUNDEX('Michael Green');

/**
  日期和时间处理函数：
  日期和时间采用相应的数据类型存储在表中，每种 DBMS 都有自己的特殊形式。日期和时间值以特殊的格式存储，
  以便能快速和有效地排序或过滤，并且节省物理存储空间，日期和时间函数在 SQL 中具有重要的作用，遗憾的是，
  它们很不一致，可移植性最差。以下以 MySQL 为例。大多数 DBMS 具有比较日期、执行日期的运算、选择日期
  格式等的函数。
 */

SELECT order_num
FROM Orders
WHERE YEAR(order_date) = 2020;

/**
  数值处理函数：
  数值处理函数仅处理数值数据，这些函数一般主要用于代数、三角或几何运算，因此不像字符串或日期-时间处理函数使用那么
  频繁，但是具有讽刺意为的是，在主要 DBMS 的函数中，数值函数是最一致，最统一的函数。
  ABS(X:decimal): 返回 X 绝对值
  EXP(X:decimal): 返回 e 的 X 次幂
  PI(): 返回 π 的值
  SQRT(X:decimal): 返回 X 的平方根
  SIN(): 返回一个角度的正弦
  COS(): 返回一个角度的余弦
 */

SELECT ABS(-1), EXP(1), PI(), SQRT(100), sin(PI() / 2), COS(PI()), TAN();

/*挑战题*/
# T1
SELECT cust_id,
       cust_name,
       cust_contact,
       cust_city,
       UPPER(CONCAT(LEFT(cust_contact, 2), LEFT(cust_city, 3))) AS user_login
FROM Customers;

# T2
SELECT order_num, order_date
FROM Orders
WHERE YEAR(order_date) = 2020
  AND MONTH(order_date) = 1;

















