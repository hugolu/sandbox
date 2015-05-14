# 數據庫基本操作

## 創建

    mysql> CREATE DATABASE <database name>;

 範例
 
    mysql> create database databasetest;
    Query OK, 1 row affected (0.00 sec)

## 查詢

    mysql> SHOW DATABASES;

範例

    mysql> show databases;
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | databasetest       |
    | mysql              |
    | performance_schema |
    | phpmyadmin         |
    | test               |
    +--------------------+
    6 rows in set (0.00 sec)

## 選擇

    mysql> USE <database name>;

範例

    mysql> use databasetest;
    Database changed

## 刪除

    mysql> DROP DATABASE <database name>;

範例

    mysql> drop database databasetest;
    Query OK, 0 rows affected (0.00 sec)

---

# 表的操作

## 創建

    mysql> CREATE TABLE <table name> (
        <attr name> <data type>,
        ...
    );

範例

    mysql> create database company;
    Query OK, 1 row affected (0.00 sec)
    
    mysql> use company;
    Database changed

    mysql> create table t_dept (
        -> deptno INT,
        -> dname VARCHAR(20),
        -> loc VARCHAR(40),
        -> );
    Query OK, 0 rows affected (0.03 sec)
    
## 查看

### DESCRIBE 查看表定義

    mysql> DESCRIBE <table name>;

範例

    mysql> describe t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | int(11)     | YES  |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)

### SHOW CREATE TABLE 查看詳細定義

    mysql> SHOW CREATE TABLE <table name>;

範例

    mysql> show create table t_dept \G
    *************************** 1. row ***************************
           Table: t_dept
    Create Table: CREATE TABLE `t_dept` (
      `deptno` int(11) DEFAULT NULL,
      `dname` varchar(20) DEFAULT NULL,
      `loc` varchar(40) DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1
    1 row in set (0.00 sec)

## 刪除

    mysql> DROP TABLE <table name>;

範例

    mysql> drop table t_dept;
    Query OK, 0 rows affected (0.01 sec)
    
    mysql> describe t_dept;
    ERROR 1146 (42S02): Table 'company.t_dept' doesn't exist

## 修改

### 修改表名

    mysql> ALERT TABLE <old table name> RENAME [TO] <new table name>;

### 增加字段

    mysql> ALTER TABLE <table name> ADD <attr name> <data type>;
    mysql> ALTER TABLE <table name> ADD <attr name> <data type> FIRST;
    mysql> ALTER TABLE <table name> ADD <attr name> <data type> AFTER <attr name>;

### 刪除字段

    mysql> ALTER TABLE <table name> DROP <attr name>;

### 修改字段

#### 修改字段的數據類型

    mysql> ALTER TABLE <table name> MODIFY <attr name> <data type>;
    
#### 修改字段的名字

    mysql> ALTER TABLE <table name> CHANGE <old attr name> <new attr name> <old data type>;

#### 修改字段名字與屬性

    mysql> ALTER TABLE <table name> CHANGE <old attr name> <new attr name> <new data type>;

#### 修改字段的順序

    mysql> ALTER TABLE <table name> MODIFY <attr1 name> FIRST|AFTER <attr2 name>;

## 約束
