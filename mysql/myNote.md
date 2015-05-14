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
