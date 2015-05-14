# 數據庫基本操作

## 創建

    CREATE DATABASE <database name>;

 範例
 
    mysql> create database databasetest;
    Query OK, 1 row affected (0.00 sec)

## 查詢

    SHOW DATABASES;

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

    USE <database name>;

範例

    mysql> use databasetest;
    Database changed

## 刪除

    DROP DATABASE <database name>;

範例

    mysql> drop database databasetest;
    Query OK, 0 rows affected (0.00 sec)

---

# 表的操作

## 創建

    CREATE TABLE <table name> (
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

    DESCRIBE <table name>;

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

    SHOW CREATE TABLE <table name>;

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

    DROP TABLE <table name>;

範例

    mysql> drop table t_dept;
    Query OK, 0 rows affected (0.01 sec)
    
    mysql> describe t_dept;
    ERROR 1146 (42S02): Table 'company.t_dept' doesn't exist

## 修改

### 修改表名

    ALERT TABLE <old table name> RENAME [TO] <new table name>;

範例

    mysql> use company;
    Database changed
    mysql> alter table t_dept rename tab_dept;
    Query OK, 0 rows affected (0.01 sec)
    
    mysql> desc t_dept;
    ERROR 1146 (42S02): Table 'company.t_dept' doesn't exist
    mysql> desc tab_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | int(11)     | YES  |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)

### 增加字段

#### 在表最後增加一個字段

    ALTER TABLE <table name> ADD <attr name> <data type>;
    
範例

    mysql> use company;
    Database changed
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | int(11)     | YES  |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)
    
    mysql> alter table t_dept add descri varchar(20);
    Query OK, 0 rows affected (0.02 sec)
    Records: 0  Duplicates: 0  Warnings: 0
    
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | int(11)     | YES  |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    | descri | varchar(20) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    4 rows in set (0.00 sec)

#### 在表第一個位置增加字段

    ALTER TABLE <table name> ADD <attr name> <data type> FIRST;

範例

    mysql> use company;
    Database changed
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | int(11)     | YES  |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)
    
    mysql> alter table t_dept add descri varchar(20) first;
    Query OK, 0 rows affected (0.01 sec)
    Records: 0  Duplicates: 0  Warnings: 0
    
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | descri | varchar(20) | YES  |     | NULL    |       |
    | deptno | int(11)     | YES  |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    4 rows in set (0.00 sec)


#### 在表指定的字段之後增加字段

    ALTER TABLE <table name> ADD <attr name> <data type> AFTER <attr name>;
    
範例

    mysql> use company;
    Database changed
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | int(11)     | YES  |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)
    
    mysql> alter table t_dept add descri varchar(20) after deptno;
    Query OK, 0 rows affected (0.01 sec)
    Records: 0  Duplicates: 0  Warnings: 0
    
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | int(11)     | YES  |     | NULL    |       |
    | descri | varchar(20) | YES  |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    4 rows in set (0.00 sec)

### 刪除字段

    ALTER TABLE <table name> DROP <attr name>;

範例

    mysql> use company;
    Database changed
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | int(11)     | YES  |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)
    
    mysql> alter table t_dept drop deptno;
    Query OK, 0 rows affected (0.01 sec)
    Records: 0  Duplicates: 0  Warnings: 0
    
    mysql> desc t_dept;
    +-------+-------------+------+-----+---------+-------+
    | Field | Type        | Null | Key | Default | Extra |
    +-------+-------------+------+-----+---------+-------+
    | dname | varchar(20) | YES  |     | NULL    |       |
    | loc   | varchar(40) | YES  |     | NULL    |       |
    +-------+-------------+------+-----+---------+-------+
    2 rows in set (0.00 sec)

### 修改字段

#### 修改字段的數據類型

    ALTER TABLE <table name> MODIFY <attr name> <data type>;
    
範例

    mysql> use company;
    Database changed
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | int(11)     | YES  |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)
    
    mysql> alter table t_dept modify deptno varchar(20);
    Query OK, 0 rows affected (0.01 sec)
    Records: 0  Duplicates: 0  Warnings: 0
    
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | varchar(20) | YES  |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)
    
#### 修改字段的名字

    ALTER TABLE <table name> CHANGE <old attr name> <new attr name> <old data type>;

範例

    mysql> use company;
    Database changed
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | int(11)     | YES  |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)
    
    mysql> alter table t_dept change loc location varchar(40);
    Query OK, 0 rows affected (0.02 sec)
    Records: 0  Duplicates: 0  Warnings: 0
    
    mysql> desc t_dept;
    +----------+-------------+------+-----+---------+-------+
    | Field    | Type        | Null | Key | Default | Extra |
    +----------+-------------+------+-----+---------+-------+
    | deptno   | int(11)     | YES  |     | NULL    |       |
    | dname    | varchar(20) | YES  |     | NULL    |       |
    | location | varchar(40) | YES  |     | NULL    |       |
    +----------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)

#### 修改字段名字與屬性

    ALTER TABLE <table name> CHANGE <old attr name> <new attr name> <new data type>;

範例

    mysql> use company;
    Database changed
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | int(11)     | YES  |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)
    
    mysql> alter table t_dept change loc location varchar(20);
    Query OK, 0 rows affected (0.02 sec)
    Records: 0  Duplicates: 0  Warnings: 0
    
    mysql> desc t_dept;
    +----------+-------------+------+-----+---------+-------+
    | Field    | Type        | Null | Key | Default | Extra |
    +----------+-------------+------+-----+---------+-------+
    | deptno   | int(11)     | YES  |     | NULL    |       |
    | dname    | varchar(20) | YES  |     | NULL    |       |
    | location | varchar(20) | YES  |     | NULL    |       |
    +----------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)

#### 修改字段的順序

    ALTER TABLE <table name> MODIFY <attr1 name> FIRST|AFTER <attr2 name>;

範例

    mysql> use company;
    Database changed
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | int(11)     | YES  |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)
    
    mysql> alter table t_dept modify loc varchar(40) first;
    Query OK, 0 rows affected (0.02 sec)
    Records: 0  Duplicates: 0  Warnings: 0
    
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | loc    | varchar(40) | YES  |     | NULL    |       |
    | deptno | int(11)     | YES  |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)
    
    mysql> alter table t_dept modify deptno int(11) after dname;
    Query OK, 0 rows affected (0.04 sec)
    Records: 0  Duplicates: 0  Warnings: 0
    
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | loc    | varchar(40) | YES  |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    | deptno | int(11)     | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)

## 約束

| 完整性約束關鍵字 | 含義 |
|------------------|------|
| NOT NULL | 約束字段的值不能為空 |
| DEFAULT | 設置字段的默認值 |
| UNIQUE KEY (UK) | 約數字段的值是唯一 |
| PRIMARY KEY (PK) | 約束字段為表的主鍵，可以作為該表紀錄的為之標誌 |
| AUTO_INCREMENT | 約束字段的值為自動增加 |
| FOREIGN KEY (FK) | 約束字段為表的外鍵 |
### 設置非空約束

    CREATE TABLE <table name> (
        <attr name> <data type> NOT NULL,
        ...
    );

範例

    mysql> use company;
    Database changed
    mysql> create table t_dept (
        -> deptno INT NOT NULL,
        -> dname VARCHAR(20),
        -> loc VARCHAR(40)
        -> );
    Query OK, 0 rows affected (0.01 sec)
    
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | int(11)     | NO   |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)

### 設置字段的默認值

    CREATE TABLE <table name> (
        <attr name> <data type> DEFAULT <default value>,
        ...
    );
    
範例

    mysql> use company;
    Database changed
    mysql> create table t_dept (
        -> deptno INT NOT NULL,
        -> dname VARCHAR(20) DEFAULT 'company',
        -> loc VARCHAR(40)
        -> );
    Query OK, 0 rows affected (0.01 sec)
    
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | int(11)     | NO   |     | NULL    |       |
    | dname  | varchar(20) | YES  |     | company |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)

 ### 設置唯一約束
 
    CREATE TABLE <table name> (
        <attr name> <data type> UNIQUE,
        ...
    );

 範例

    mysql> drop table t_dept;
    Query OK, 0 rows affected (0.01 sec)
    
    mysql> create table t_dept (
        -> deptno INT,
        -> dname VARCHAR(20) UNIQUE,
        -> loc VARCHAR(40)
        -> );
    Query OK, 0 rows affected (0.01 sec)
    
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | int(11)     | YES  |     | NULL    |       |
    | dname  | varchar(20) | YES  | UNI | NULL    |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)

 ### 設置主鍵約束

 #### 單字段主鍵
 
    CREATE TABLE <table name> (
        <attr name> <data type> PRIMARY KEY,
        ...
    );

 範例

    mysql> create table t_dept (
        -> deptno INT PRIMARY KEY,
        -> dname VARCHAR(20),
        -> loc VARCHAR(40)
        -> );
    Query OK, 0 rows affected (0.01 sec)
    
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | int(11)     | NO   | PRI | NULL    |       |
    | dname  | varchar(20) | YES  |     | NULL    |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)
 
 #### 多字段主鍵
 
    CREATE TABLE <table name> (
        <attr1 name> <data type>,
        <attr2 name> <data type>,
        ...
        CONSTRAINT <constraint name> PRIMARY KEY <attr1 name>, <arrt2 name>, ...
    );
        
 範例
 
    mysql> create table t_dept (
        -> deptno INT,
        -> dname VARCHAR(20),
        -> loc VARCHAR(40),
        -> CONSTRAINT pk_dname_deptno PRIMARY KEY (deptno, dname)
        -> );
    Query OK, 0 rows affected (0.02 sec)
    
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | deptno | int(11)     | NO   | PRI | 0       |       |
    | dname  | varchar(20) | NO   | PRI |         |       |
    | loc    | varchar(40) | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)

 ### 設置字段值自動增加
 
    CREATE TABLE <table name> (
        <attr name> <data type> AUTO_INCREMENT,
        ...
    );
 
 範例
 
     mysql> create table t_dept (
        -> deptno INT PRIMARY KEY AUTO_INCREMENT,
        -> dname VARCHAR(20),
        -> loc VARCHAR(40)
        -> );
    Query OK, 0 rows affected (0.01 sec)
    
    mysql> desc t_dept;
    +--------+-------------+------+-----+---------+----------------+
    | Field  | Type        | Null | Key | Default | Extra          |
    +--------+-------------+------+-----+---------+----------------+
    | deptno | int(11)     | NO   | PRI | NULL    | auto_increment |
    | dname  | varchar(20) | YES  |     | NULL    |                |
    | loc    | varchar(40) | YES  |     | NULL    |                |
    +--------+-------------+------+-----+---------+----------------+
    3 rows in set (0.00 sec)
 
 ### 設置外鍵約束
 
    CREATE TABLE <table name> (
        <attr1 name> <data type>,
        <attr2 name> <data type>,
        ...
        CONSTRAINT <constraint name> FOREIGN KEY (<attr name>) REFERENCES <table name> (<attr name>)
    );

 範例
 
     mysql> create table t_dept (
        -> deptno INT PRIMARY KEY,
        -> dname VARCHAR(20),
        -> loc VARCHAR(40)
        -> );
    Query OK, 0 rows affected (0.01 sec)
    
    mysql> create table t_employee (
        -> empno INT PRIMARY KEY,
        -> ename VARCHAR(20),
        -> job VARCHAR(40),
        -> MRG INT,
        -> HireDate DATE,
        -> sal DOUBLE(10, 2),
        -> comm DOUBLE(10, 2),
        -> deptno INT,
        -> CONSTRAINT fk_deptno FOREIGN KEY (deptno) REFERENCES t_dept (deptno)
        -> );
    Query OK, 0 rows affected (0.02 sec)
    
    mysql> desc t_employee;
    +----------+--------------+------+-----+---------+-------+
    | Field    | Type         | Null | Key | Default | Extra |
    +----------+--------------+------+-----+---------+-------+
    | empno    | int(11)      | NO   | PRI | NULL    |       |
    | ename    | varchar(20)  | YES  |     | NULL    |       |
    | job      | varchar(40)  | YES  |     | NULL    |       |
    | MRG      | int(11)      | YES  |     | NULL    |       |
    | HireDate | date         | YES  |     | NULL    |       |
    | sal      | double(10,2) | YES  |     | NULL    |       |
    | comm     | double(10,2) | YES  |     | NULL    |       |
    | deptno   | int(11)      | YES  | MUL | NULL    |       |
    +----------+--------------+------+-----+---------+-------+
    8 rows in set (0.00 sec)
