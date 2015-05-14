# 數據庫基本操作

## 創建

    mysql> CREATE DATABASE <database name>;

## 查詢

    mysql> SHOW DATABASES;

## 選擇

    mysql> USE <database name>;

## 刪除

    mysql> DROP DATABASE <database name>;

---

# 表的操作

## 創建

    mysql> CREATE TABLE <table name> (
        <attr name> <data type>,
        ...
    );

## 查看

    mysql> DESCRIBE <table name>;

## 刪除

    mysql> DROP TABLE <table name>;

## 修改

修改表名

    mysql> ALERT TABLE <old table name> RENAME [TO] <new table name>;


## 約束
