# SQL
SQL, "sequel"; Structured Query Language) is a domain-specific language used in programming and designed for managing data held in a relational database management system (RDBMS), or for stream processing in a relational data stream management system (RDSMS). It is particularly useful in handling structured data, i.e. data incorporating relations among entities and variables.

# MySQL
MySQL is an open-source relational database management system (RDBMS).


# Example

[students.sql](students.sql)

Todo

# Dokcer Setup

Run the following command from the same directory, where the docker-compose.yml file is located.

```bash
docker-compose up
```

access the running container `mysql-snippets_db_1`

```bash
docker exec -it mysql-snippets_db_1 bash
mysql -uroot -proot
```

# MySQL

```mysql
show databases;
use test_db;
```
Run the MySQl queries from this file [students.sql](students.sql)

## Test
```mysql
SELECT * FROM students;
```

## 1
```mysql
SELECT * FROM students WHERE first_name='Bob' and postcode=23031;
```

```mysql
+----+------------+----------------+----------------+------------------+--------+-----------------------+---------------------------------------------------------+----------+---------------+
| id | first_name | last_name      | city           | phone            | gender | email                 | address                                                 | postcode | date_of_birth |
+----+------------+----------------+----------------+------------------+--------+-----------------------+---------------------------------------------------------+----------+---------------+
|  5 | Bob        | Schulistland   | Schulistland   | 895-877-0076x197 | Male   | scbob@opensource.org  | 39405 Nicolas Walk Apt. 041 Kozeychester, AL 20566-8063 |    23031 | 2019-07-15    |
| 16 | Bob        | Port Thoraland | Port Thoraland | 1-628-108-7615   | Male   | pobob@ycombinator.com | 9256 Price Summit Garrickland, KY 23867                 |    23031 | 2016-02-05    |
+----+------------+----------------+----------------+------------------+--------+-----------------------+---------------------------------------------------------+----------+---------------+
2 rows in set (0.00 sec)
```

## 2
```mysql
SELECT city, postcode FROM students;
```

```mysql
+---------------------+----------+
| city                | postcode |
+---------------------+----------+
| Rathmouth           |    23031 |
| Port Lolamouth      |    27108 |
| Lavernastad         |    76631 |
| Ethelville          |    37965 |
| Schulistland        |    23031 |
| Kennithside         |    23031 |
| Oberbrunnerchester  |    24772 |
| Marcoport           |       16 |
| New Adalineton      |    89650 |
| East Kayla          |    45934 |
| Kevinmouth          |     7820 |
| North Deondreland   |    32292 |
| Port Adrianaborough |    55848 |
| South Hunter        |    29257 |
| East Breanne        |    49701 |
| Port Thoraland      |    23031 |
| West Jedediahville  |    80323 |
| Franeckiland        |    39741 |
| Lake Clare          |    24982 |
| Beattyburgh         |     7864 |
| Oberbrunnerport     |    36356 |
| Ricofort            |    69978 |
| East Graycefurt     |    49614 |
| West Joeport        |    16353 |
| Oceanestad          |    70534 |
| Creolashire         |    58634 |
| North Ernestinaton  |    90902 |
| Jakaylaland         |    10160 |
| North Esta          |    40221 |
| West Breanabury     |    23031 |
+---------------------+----------+
30 rows in set (0.00 sec)
```

## 3
```mysql
SELECT DISTINCT first_name FROM students WHERE MOD(postcode, 2) = 0;
```

```mysql
+------------+
| first_name |
+------------+
| Hounson    |
| Blewmen    |
| Vanacci    |
| Marflitt   |
| Pietesch   |
| Henrique   |
| Tynan      |
| Pinkard    |
| Whale      |
| Ori        |
| Tagg       |
| Costerd    |
| Corrin     |
| Lumley     |
| Whiles     |
| Presdee    |
| Bedberry   |
+------------+
17 rows in set (0.00 sec)
```

## Find the duplicate postcodes
```mysql
SELECT (COUNT(postcode)-COUNT(DISTINCT(postcode))) FROM students;
```

```
+---------------------------------------------+
| (COUNT(postcode)-COUNT(DISTINCT(postcode))) |
+---------------------------------------------+
|                                           4 |
+---------------------------------------------+
1 row in set (0.00 sec)
```

## Find the shortest and longest first names ordered alphabetically.

```mysql
SELECT first_name, LENGTH(first_name) FROM students ORDER BY LENGTH(first_name) DESC, first_name ASC LIMIT 1;
```

```mysql
+-------------+--------------------+
| first_name  | LENGTH(first_name) |
+-------------+--------------------+
| Whaplington |                 11 |
+-------------+--------------------+
1 row in set (0.00 sec)
```

```mysql
SELECT first_name, LENGTH(first_name) FROM students ORDER BY LENGTH(first_name) ASC, first_name ASC LIMIT 1;
```

```mysql
+------------+--------------------+
| first_name | LENGTH(first_name) |
+------------+--------------------+
| Bob        |                  3 |
+------------+--------------------+
1 row in set (0.00 sec)
```

## Find unique first names starting with vowels.

```mysql
SELECT DISTINCT first_name FROM students WHERE first_name REGEXP '^[aeiou]';
```

```mysql
+------------+
| first_name |
+------------+
| Ailn       |
| Ori        |
+------------+
2 rows in set (0.01 sec)
```

## Find unique first names that ends with vowels.

```mysql
SELECT DISTINCT first_name FROM students WHERE first_name REGEXP '[aeiou]$';
```

```mysql
+------------+
| first_name |
+------------+
| Vanacci    |
| Henrique   |
| Leeke      |
| Whale      |
| Ori        |
| Presdee    |
+------------+
6 rows in set (0.00 sec)
```

## Find unique first names that starts or ends with vowels.

```mysql
SELECT DISTINCT first_name FROM students WHERE first_name REGEXP '^[aeiou].*[aeiou]$';
```

```mysql
+------------+
| first_name |
+------------+
| Ori        |
+------------+
1 row in set (0.00 sec)
```

## Find unique first names that does not starts with vowels.

```mysql
SELECT DISTINCT first_name FROM students WHERE first_name NOT REGEXP '^[aeiou]';
```

```mysql
+-------------+
| first_name  |
+-------------+
| Hounson     |
| Tison       |
| Surmeyers   |
| Bob         |
| Holdey      |
| Blewmen     |
| Vanacci     |
| Marflitt    |
| Pietesch    |
| Henrique    |
| Tynan       |
| Pinkard     |
| Haslock     |
| Rickell     |
| Boxhill     |
| Leeke       |
| Whale       |
| Tagg        |
| Costerd     |
| Corrin      |
| Bunford     |
| Lumley      |
| Whiles      |
| Presdee     |
| Bedberry    |
| Danilchev   |
| Whaplington |
+-------------+
27 rows in set (0.00 sec)
```


## Find unique first names that does not ends with vowels.

```mysql
SELECT DISTINCT first_name FROM students WHERE first_name NOT REGEXP '[aeiou]$';
```

```mysql
+-------------+
| first_name  |
+-------------+
| Ailn        |
| Hounson     |
| Tison       |
| Surmeyers   |
| Bob         |
| Holdey      |
| Blewmen     |
| Marflitt    |
| Pietesch    |
| Tynan       |
| Pinkard     |
| Haslock     |
| Rickell     |
| Boxhill     |
| Tagg        |
| Costerd     |
| Corrin      |
| Bunford     |
| Lumley      |
| Whiles      |
| Bedberry    |
| Danilchev   |
| Whaplington |
+-------------+
23 rows in set (0.01 sec)
```

## Find unique first names that does not starts or ends with vowels.

```mysql
SELECT DISTINCT first_name FROM students WHERE first_name NOT REGEXP '^[aeiou].*[aeiou]$';
```

```mysql
+-------------+
| first_name  |
+-------------+
| Ailn        |
| Hounson     |
| Tison       |
| Surmeyers   |
| Bob         |
| Holdey      |
| Blewmen     |
| Vanacci     |
| Marflitt    |
| Pietesch    |
| Henrique    |
| Tynan       |
| Pinkard     |
| Haslock     |
| Rickell     |
| Boxhill     |
| Leeke       |
| Whale       |
| Tagg        |
| Costerd     |
| Corrin      |
| Bunford     |
| Lumley      |
| Whiles      |
| Presdee     |
| Bedberry    |
| Danilchev   |
| Whaplington |
+-------------+
28 rows in set (0.00 sec)
```

## Find unique first names that does not starts and ends with vowels.

```mysql
SELECT DISTINCT first_name FROM students WHERE first_name NOT REGEXP '^[aeiou]' AND first_name NOT REGEXP '[aeiou]$';
```

```mysql
+-------------+
| first_name  |
+-------------+
| Hounson     |
| Tison       |
| Surmeyers   |
| Bob         |
| Holdey      |
| Blewmen     |
| Marflitt    |
| Pietesch    |
| Tynan       |
| Pinkard     |
| Haslock     |
| Rickell     |
| Boxhill     |
| Tagg        |
| Costerd     |
| Corrin      |
| Bunford     |
| Lumley      |
| Whiles      |
| Bedberry    |
| Danilchev   |
| Whaplington |
+-------------+
22 rows in set (0.00 sec)
```

##

##

##

##

##

##

##

##

##

##

##

##

##

##

##

##

##

##

```mysql
SELECT elt(locate(operation, "+-*/"), a+b, a-b, a*b, a/b) = c
```


# Resources
1. [SQL](https://en.wikipedia.org/wiki/SQL)
2.  [MySQL](https://en.wikipedia.org/wiki/MySQL)
3.  [filldb](http://filldb.info/)
4. [mockaroo](https://www.mockaroo.com/)