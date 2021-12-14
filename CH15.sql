/*第十五章 插入数据*/
/*这一章介绍如何使用 SQL 的 INSERT 语句将数据插入到表*/

/**
  INSERT 用来将行插入（或添加）到数据库表，插入的方式有如下几种：
  1、插入完整的行
  2、插入行的一部分
  3、插入某些查询的结果
 */

/**
  插入完整的行：
  必须给每一列提供一个值，如果某列没有值，则应该使用 NULL 值（假定表允许对该列指定空值）
  各列必须以它们在表定义中出现的次序填充。
  虽然这种语法简单，但并不安全，应该尽量避免使用。下面的 SQL 语句高度依赖于表中列的定义次序。
  即使可以得到这种次序信息，也不能保证各列在下一次表结构变动后保持完全相同的次序，因此，编写
  依赖于特定列次序的 SQL 语句是很不安全的，这样做迟早会出问题。
 */

INSERT INTO Customers
VALUES (1000000006, 'Toy Land', '123 Any Street', 'New York', 'NY', '11111', 'USA', NULL, NULL);

/**
  这个例子因为提供了列名，VALUES 必须以其指定的次序匹配指定的列名，不一定按各列出现在表中的
  实际次序，其优点是，即使表的结构改变，这条 INSERT 语句依然能正确工作。
 */
INSERT INTO Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact,
                      cust_email)
VALUES (1000000006, 'Toy Land', '123 Any Street', 'New York', 'NY', '11111', 'USA', NULL, NULL);

/**
  注意：
  1、不要使用没有明确给出列的 INSERT 语句，给出列能使 SQL 代码继续发挥作用，即使表结构发生了改变
  2、不管使用哪种 INSERT 语法，VALUES 的数目都必须正确。如果不提供列名，则必须给每个表列提供一个
  值；如果提供列名，则必须给列出的每个列一个值。否则相应的行不能被成功插入。
 */

/**
  插入行的一部分：
  正如前面所述，使用 INSERT 的推荐方法是明确给出表的列名。使用这种语法，还可以省略列。
  如果表的定义允许，则可以在 INSERT 操作中省略某些列，省略的列必须满足以下某个条件：
  1、该列定义为允许 NULL 值（无值或空值）
  2、在表的定义中给出默认值。这表示如果不给出值，将使用默认值。
 */

INSERT INTO Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country)
VALUES (1000000006, 'Toy Land', '123 Any Street', 'New York', 'NY', '11111', 'USA');

/**
  插入检索出的数据：
  下面的例子从一个名叫 CustNew 的表中读出数据并插入到 Customers 表，为了试验这个例子，首先应该创建和填充
  CustNew 表，CustNew 表的结构和 Customers 表结构相同。SELECT 中列出的没一列对应于 Customers 表名
  后所跟的每一列。
  为了简单起见，这个例子在 INSERT 和 SELECT 语句中使用了相同的列名，但是，不一定要求列名匹配。实际上，DBMS
  并不关心 SELECT 返回的列名。因为它使用的是列的位置，即 SELECT 中的第一列（不管其列名）将用来填充表列中指定
  的第一列。
 */

create table CustNew
(
    cust_id      char(10)  not null
        primary key,
    cust_name    char(50)  not null,
    cust_address char(50)  null,
    cust_city    char(50)  null,
    cust_state   char(5)   null,
    cust_zip     char(10)  null,
    cust_country char(50)  null,
    cust_contact char(50)  null,
    cust_email   char(255) null
);


INSERT INTO Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country)
SELECT cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country
FROM CustNew;

/**
  插入多行：
  INSERT 通常只插入一行，要插入多行，必须执行多个 INSERT 语句，INSERT SELECT 是个例外，它可以用一条 INSERT
  语句插入多行，不管 SELECT 语句返回多少行，都将被 INSERT 插入。
 */

/**
  从一个表复制到另一个表：
  有一种数据插入不使用 INSERT 语句。要将一个表的内容复制到一个全新的表（运行中创建的表），可以使用 CREATE SELECT 语句
  与 INSERT SELECT 将数据添加到一个已经存在的表不同，CREATE SELECT 将数据复制到一个新表（有的 DBMS 可以覆盖已经存在
  的表，这依赖于所使用的具体 DBMS）
 */
CREATE TABLE CustCopy AS
SELECT *
FROM Customers;

/*挑战题*/
-- T1
INSERT INTO Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country)
VALUES (1000000006, 'Ning Zhicheng', '123 Any Street', 'SHANG HAI', 'NY', '11111', 'CHINA');

-- T2
CREATE TABLE OrdersCopy AS
SELECT *
FROM Orders;

CREATE TABLE OrderItemsCopy AS
SELECT *
FROM OrderItems;
