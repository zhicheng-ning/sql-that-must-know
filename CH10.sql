/*第十章 分组数据*/
/*这一章介绍如何分组数据，以便汇总表内容的子集。涉及到 Group By 子句和 HAVING 子句*/

/**
  数据分组:
  使用分组可以将数据分为多个逻辑组，对每个组进行聚集计算
  GROUP BY 子句的规定:
  1、GROUP BY 子句可以包含任意数目的列，因而可以对分组进行嵌套，更细致地进行数据分组
  2、如果在 GROUP BY 子句中嵌套了分组，数据将在最后指定的分组上进行「行汇总」。换句话
  说，在建立分组时，指定的所有列都一起计算（所以不能从个别的列取回数据）
  3、GROUP BY 子句中列出的每一列都必须是检索列或有效的表达式（但不能是聚集函数）。如果
  在 SELECT 中使用表达式，则必须在 GROUP BY 子句中指定相同的表达式，不能使用别名
  4、大多数 SQL 实现不允许 GROUP BY 列带有长度可变的数据类型（如文本或备注型字段）
  5、除聚集计算语句外，SELECT 语句中的每一列都必须在 GROUP BY 子句中给出
  6、如果分组列中包含具有 NULL 值的行，则 NULL 将作为一个分组返回。如果一个列中有多行
  NULL 值，它们将分为一组。
  7、GROUP BY 子句必须出现在 WHERE 子句之后，ORDER BY 子句之前
 */

SELECT vend_id, COUNT(*) AS num_prods
FROM Products
GROUP BY vend_id;

/**
  过滤分组:
  HAVING 和 WHERE 的差别
  WHERE 在数据分组前进行过滤，HAVING 在数据分组后进行过滤。这是一个重要的区别，WHERE 排除的行不包括
  在分组中。这可能会改变计算值，从而影响 HAVING 子句中基于这些值过滤掉的分组。
 */

SELECT vend_id, COUNT(*) AS num_prods
FROM Products
WHERE prod_price >= 4
GROUP BY vend_id
HAVING COUNT(*) >= 2;

/**
  分组和排序
  GROUP BY 和 ORDER BY 经常完成相同的工作，但是它们非常不同
    ORDER BY                                      GROUP BY
  1、对产生的输出排序                          对行分组，但输出可能不是分组的顺序
  2、任意列都可以使用（甚至                     只可能使用选择列或表达式列，而且必须
  非选择的列也可以使用）                        使用每个选择列表达式
  3、不一定需要                               如果与聚集函数一起使用列（或表达式），则必须使用

  一般在使用 GROUP BY 子句时，应该也给出 ORDER BY 子句，这是保证数据正确排序
  的唯一方法。千万不要仅依赖 GROUP BY 排序数据
 */

SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >= 3;

SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >= 3
ORDER BY items, order_num;

/**
  SELECT 子句顺序，下面回顾一下 SELECT 语句中使用时必须遵守的次序
    子句                    说明                  是否必须使用
  SELECT                要返回的列或表达式               是
  FROM                  从中检索数据的表           仅在从表选择数据时使用
  WHERE                 行级过滤                       否
  GROUP BY              分组说明                  仅在按组计算聚集时使用
  HAVING                组级过滤                       否
  ORDER BY              输出排序顺序                    否
 */

/*挑战题*/
-- T1
SELECT order_num, COUNT(*) AS order_lines
FROM OrderItems
GROUP BY order_num
ORDER BY order_num;

-- T2
SELECT vend_id, MIN(prod_price) AS cheapest_item
FROM Products
GROUP BY vend_id
ORDER BY cheapest_item;

-- T3
SELECT order_num
FROM OrderItems
GROUP BY order_num
HAVING MAX(quantity) >= 100;

-- T4
SELECT order_num, SUM(quantity * item_price)
FROM OrderItems
GROUP BY order_num
HAVING SUM(quantity * item_price) >= 1000
ORDER BY order_num;

-- T5
/*有误，除聚集计算语句外，SELECT 语句中的每一列都必须在 GROUP BY 子句中给出*/

