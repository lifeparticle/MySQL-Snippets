<div align="center">
 
[How to Run MySQL Using Docker](https://towardsdatascience.com/how-to-run-mysql-using-docker-ed4cebcd90e4?source=friends_link&sk=2ec5b230e4c0bcffd485b9a3d924d64a)

[How to Run MySQL and phpMyAdmin Using Docker](https://towardsdatascience.com/how-to-run-mysql-and-phpmyadmin-using-docker-17dfe107eab7?source=friends_link&sk=f94fbd748334e2fab7351c7b4446911a)

</div>

![carbon](https://user-images.githubusercontent.com/1612112/87624121-508b7900-c76a-11ea-9a61-07755fb46b4f.png)

 
 * [SQL](#sql)
 * [MySQL](#mysql)
 * [Docker Setup](#docker-setup)
 * [MySQL Keywords](#mysql-keywords)
 * [MySQL Databases](#mysql-databases)
 * [MySQL Tables](#mysql-tables)
    * [SELECT with AND](#select-with-and)
    * [SELECT multiple fields](#select-multiple-fields)
    * [SELECT with DISTINCT and MOD](#select-with-distinct-and-mod)
    * [Count duplicates](#count-duplicates)
    * [Find the shortest and longest strings ordered alphabetically](#find-the-shortest-and-longest-strings-ordered-alphabetically)
    * [Find unique strings that starts with vowels](#find-unique-strings-that-starts-with-vowels)
    * [Find unique strings that ends with vowels](#find-unique-strings-that-ends-with-vowels)
    * [Find unique strings that starts or ends with vowels](#find-unique-strings-that-starts-or-ends-with-vowels)
    * [Find unique strings that does not starts with vowels](#find-unique-strings-that-does-not-starts-with-vowels)
    * [Find unique strings that does not ends with vowels](#find-unique-strings-that-does-not-ends-with-vowels)
    * [Find unique strings that does not starts or ends with vowels](#find-unique-strings-that-does-not-starts-or-ends-with-vowels)
    * [Find unique strings that does not starts and ends with vowels](#find-unique-strings-that-does-not-starts-and-ends-with-vowels)
    * [LEFT and RIGHT](#left-and-right)
    * [Ascending order](#ascending-order)
    * [GROUP BY, GROUP_CONCAT, FLOOR, AVG with JOIN](#group-by-group_concat-floor-avg-with-join)
    * [IF with JOIN](#if-with-join)
    * [BETWEEN with JOIN](#between-with-join)
    * [Joining tables](#joining-tables)
       * [INNER JOIN](#inner-join)
       * [OUTER JOIN](#outer-join)
          * [LEFT JOIN](#left-join)
          * [RIGHT JOIN](#right-join)
          * [FULL OUTER JOIN](#full-outer-join)
    * [CASE](#case)
    * [COUNT(*)](#count)
    * [ROUND](#round)
    * [MIN and MAX](#min-and-max)
    * [REPLACE](#replace)
    * [LIMIT](#limit)
    * [Find duplicates](#find-duplicates)
    * [IN](#in)
    * [Like](#like)
    * [Output query results to a file](#output-query-results-to-a-file)
 * [Miscellaneous](#miscellaneous)
 * [Resources](#resources)

# SQL
SQL, "sequel"; Structured Query Language) is a domain-specific language used in programming and designed for managing data held in a relational database management system (RDBMS), or for stream processing in a relational data stream management system (RDSMS). It is particularly useful in handling structured data, i.e. data incorporating relations among entities and variables.

# MySQL
MySQL is an open-source relational database management system (RDBMS).

# Docker Setup

Run the following command from the same directory, where the docker-compose.yml file is located.

```bash
docker-compose up
```

access the running container `mysql-snippets_db_1`

```bash
docker exec -it mysql-snippets_db_1 bash
```

# MySQL Keywords

[Keywords](https://dev.mysql.com/doc/refman/8.0/en/keywords.html)

# Data types

| No  | Name          | Example | Doc       |
| --- | ------------- | ------- | --------- |
| 1   | Numeric       |         | [link][1] |
| 2   | Date and Time |         | [link][2] |
| 3   | String        |         | [link][3] |
| 5   | Spatial       |         | [link][4] |
| 6   | JSON          |         | [link][5] |

<!-- doc_links starts -->

[1]: https://dev.mysql.com/doc/refman/8.0/en/numeric-types.html
[2]: https://dev.mysql.com/doc/refman/8.0/en/date-and-time-types.html
[3]: https://dev.mysql.com/doc/refman/8.0/en/string-types.html
[4]: https://dev.mysql.com/doc/refman/8.0/en/spatial-types.html
[5]: https://dev.mysql.com/doc/refman/8.0/en/json.html

<!-- doc_links ends -->

# MySQL Databases

Run the MySQl queries from this file [students.sql](students.sql) from the MySQL CLI.

```mysql
mysql -uroot -proot
```

or import the sql file.

```mysql
mysql -uroot -p test_db < school.sql
```

Type the password `root` and you're done.

```mysql
SHOW DATABASES;
USE test_db;
```

```mysql
SELECT * FROM students;
```

Create a new database.

```mysql
CREATE DATABASE test_db_1;
```

Delete a database. This will delete all the tables within the database.

```mysql
DROP DATABASE test_db_1;
```

# MySQL Tables

Show all tables in a database.

```mysql
SHOW TABLES;
```

```mysql
+-------------------+
| Tables_in_test_db |
+-------------------+
| marks             |
| students          |
+-------------------+
2 rows in set (0.00 sec)
```

Delete a table. If you don't have a storage issue, it's best practise that you rename the table and after few weeks later when you are sure that there are no issues, then you can delete the table.

```mysql
DROP TABLE table_name;
```

Rename a table. Be aware that one or more application can be using the old table name

```mysql
RENAME TABLE old_table_name TO new_table_name;
```

Copy a table.

```mysql
CREATE TABLE new_table_name TO old_table_name;
INSERT new_table_name SELECT * FROM old_table_name;
```


## SELECT with AND
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

## SELECT multiple fields
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

## SELECT with DISTINCT and MOD
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

## Count duplicates
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

## Find the shortest and longest strings ordered alphabetically

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

## Find unique strings that starts with vowels

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

## Find unique strings that ends with vowels

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

## Find unique strings that starts or ends with vowels

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

## Find unique strings that does not starts with vowels

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


## Find unique strings that does not ends with vowels

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

## Find unique strings that does not starts or ends with vowels

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

## Find unique strings that does not starts and ends with vowels

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

## LEFT and RIGHT

```mysql
SELECT first_name, LEFT(first_name, 3), RIGHT(first_name, 3) FROM  students;
```

```mysql
+-------------+---------------------+----------------------+
| first_name  | LEFT(first_name, 3) | RIGHT(first_name, 3) |
+-------------+---------------------+----------------------+
| Ailn        | Ail                 | iln                  |
| Hounson     | Hou                 | son                  |
| Tison       | Tis                 | son                  |
| Surmeyers   | Sur                 | ers                  |
| Bob         | Bob                 | Bob                  |
| Holdey      | Hol                 | dey                  |
| Blewmen     | Ble                 | men                  |
| Vanacci     | Van                 | cci                  |
| Marflitt    | Mar                 | itt                  |
| Pietesch    | Pie                 | sch                  |
| Henrique    | Hen                 | que                  |
| Tynan       | Tyn                 | nan                  |
| Pinkard     | Pin                 | ard                  |
| Haslock     | Has                 | ock                  |
| Rickell     | Ric                 | ell                  |
| Bob         | Bob                 | Bob                  |
| Boxhill     | Box                 | ill                  |
| Leeke       | Lee                 | eke                  |
| Whale       | Wha                 | ale                  |
| Ori         | Ori                 | Ori                  |
| Tagg        | Tag                 | agg                  |
| Costerd     | Cos                 | erd                  |
| Corrin      | Cor                 | rin                  |
| Bunford     | Bun                 | ord                  |
| Lumley      | Lum                 | ley                  |
| Whiles      | Whi                 | les                  |
| Presdee     | Pre                 | dee                  |
| Bedberry    | Bed                 | rry                  |
| Danilchev   | Dan                 | hev                  |
| Whaplington | Wha                 | ton                  |
+-------------+---------------------+----------------------+
30 rows in set (0.00 sec)
```

## Ascending order

```mysql
SELECT first_name from students ORDER BY first_name ASC;
```

```mysql
+-------------+
| first_name  |
+-------------+
| Ailn        |
| Bedberry    |
| Blewmen     |
| Bob         |
| Bob         |
| Boxhill     |
| Bunford     |
| Corrin      |
| Costerd     |
| Danilchev   |
| Haslock     |
| Henrique    |
| Holdey      |
| Hounson     |
| Leeke       |
| Lumley      |
| Marflitt    |
| Ori         |
| Pietesch    |
| Pinkard     |
| Presdee     |
| Rickell     |
| Surmeyers   |
| Tagg        |
| Tison       |
| Tynan       |
| Vanacci     |
| Whale       |
| Whaplington |
| Whiles      |
+-------------+
30 rows in set (0.00 sec)
```

## GROUP BY, GROUP_CONCAT, FLOOR, AVG with JOIN

```mysql
SELECT students.id, students.first_name, students.last_name, FLOOR(AVG(marks.mark)), GROUP_CONCAT(marks.subject) FROM students JOIN marks
ON students.id = marks.student_id
GROUP BY students.id;
```

```mysql
+----+------------+--------------------+------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| id | first_name | last_name          | FLOOR(AVG(marks.mark)) | GROUP_CONCAT(marks.subject)                                                                                                                                      |
+----+------------+--------------------+------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  1 | Ailn       | Rathmouth          |                     85 | Alien Ethics,Foreign Arts,Space Travel,Alien Dance History,Planetary Ecology                                                                                     |
|  2 | Hounson    | Port Lolamouth     |                     52 | Mathematics,Planetary History                                                                                                                                    |
|  3 | Tison      | Lavernastad        |                     63 | Magic Survival,Foreign Ethics,Foreign Statistics,Foreign Pathology,Galactic History                                                                              |
|  4 | Surmeyers  | Ethelville         |                     71 | Necromancy,Dimensional Manipulation,Nutrition Recognition,Transmutation,Planetary Geography,Alien Economics,Magic Music,Magic Rituals,Foreign Instrumental Music |
|  5 | Bob        | Schulistland       |                     76 | Alien Medicine                                                                                                                                                   |
|  6 | Holdey     | Kennithside        |                     57 | Alien Physiology,Alien Social Studies,Magic Music,Intergallactic Relations,Herbalism,Foreign Arts                                                                |
|  7 | Blewmen    | Oberbrunnerchester |                     75 | Foreign Political Sciences,Military Law,Alien Bioengineering,Foreign Social Skills,Foreign History                                                               |
|  8 | Vanacci    | Marcoport          |                     64 | Foreign Services,Alien Social Skills,Alien Genealogy,Terraforming                                                                                                |
|  9 | Marflitt   | New Adalineton     |                     48 | Grand Strategy,Magic Arts,Foreign Evolutionary Biology                                                                                                           |
+----+------------+--------------------+------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
9 rows in set (0.00 sec)
```

## IF with JOIN

```mysql
SELECT students.id, IF(marks.mark < 50, "Fail", "Pass"), marks.subject AS result FROM students JOIN marks
ON students.id = marks.student_id;
```

```mysql
+----+-------------------------------------+------------------------------+
| id | IF(marks.mark < 50, "Fail", "Pass") | result                       |
+----+-------------------------------------+------------------------------+
|  3 | Fail                                | Magic Survival               |
|  4 | Pass                                | Planetary Geography          |
|  9 | Pass                                | Foreign Evolutionary Biology |
|  6 | Pass                                | Intergallactic Relations     |
|  9 | Fail                                | Grand Strategy               |
|  7 | Pass                                | Foreign History              |
|  1 | Pass                                | Alien Dance History          |
|  7 | Pass                                | Foreign Social Skills        |
|  8 | Pass                                | Alien Social Skills          |
|  4 | Pass                                | Magic Music                  |
|  8 | Pass                                | Alien Genealogy              |
|  4 | Pass                                | Magic Rituals                |
|  1 | Pass                                | Planetary Ecology            |
|  7 | Pass                                | Military Law                 |
|  3 | Pass                                | Foreign Ethics               |
|  4 | Pass                                | Foreign Instrumental Music   |
|  8 | Pass                                | Foreign Services             |
|  4 | Pass                                | Alien Economics              |
|  1 | Pass                                | Alien Ethics                 |
|  9 | Fail                                | Magic Arts                   |
|  6 | Fail                                | Alien Social Studies         |
|  7 | Pass                                | Foreign Political Sciences   |
|  8 | Pass                                | Terraforming                 |
|  4 | Pass                                | Transmutation                |
|  1 | Pass                                | Space Travel                 |
|  5 | Pass                                | Alien Medicine               |
|  3 | Pass                                | Foreign Statistics           |
|  4 | Pass                                | Necromancy                   |
|  6 | Fail                                | Magic Music                  |
|  2 | Fail                                | Planetary History            |
|  6 | Pass                                | Herbalism                    |
|  4 | Fail                                | Dimensional Manipulation     |
|  4 | Pass                                | Nutrition Recognition        |
|  3 | Pass                                | Foreign Pathology            |
|  6 | Pass                                | Foreign Arts                 |
|  7 | Pass                                | Alien Bioengineering         |
|  6 | Pass                                | Alien Physiology             |
|  2 | Pass                                | Mathematics                  |
|  1 | Pass                                | Foreign Arts                 |
|  3 | Pass                                | Galactic History             |
+----+-------------------------------------+------------------------------+
40 rows in set (0.01 sec)
```

## BETWEEN with JOIN

```mysql
SELECT students.id, marks.mark, marks.subject FROM students JOIN marks
ON students.id = marks.student_id
WHERE marks.mark BETWEEN 90 AND 100;
```

```mysql
+----+------+---------------------+
| id | mark | subject             |
+----+------+---------------------+
|  1 | 98   | Alien Dance History |
|  4 | 91   | Alien Economics     |
|  1 | 91   | Alien Ethics        |
|  1 | 98   | Space Travel        |
|  3 | 98   | Foreign Statistics  |
|  4 | 100  | Necromancy          |
+----+------+---------------------+
6 rows in set (0.00 sec)
```

## Joining tables

### INNER JOIN
In MySQL, `JOIN`, `CROSS JOIN`, and `INNER JOIN` are syntactic equivalents (they can replace each other).

An inner join will give you all common rows in both A and B.

```mysql
SELECT s.first_name, s.last_name, m.mark
FROM students AS s JOIN marks AS m
ON m.student_id = s.id
ORDER BY m.mark;
```

```mysql
+------------+--------------------+------+
| first_name | last_name          | mark |
+------------+--------------------+------+
| Holdey     | Kennithside        |    0 |
| Tison      | Lavernastad        |   23 |
| Marflitt   | New Adalineton     |   23 |
| Surmeyers  | Ethelville         |   34 |
| Hounson    | Port Lolamouth     |   34 |
| Holdey     | Kennithside        |   34 |
| Marflitt   | New Adalineton     |   45 |
| Blewmen    | Oberbrunnerchester |   54 |
| Surmeyers  | Ethelville         |   56 |
| Tison      | Lavernastad        |   56 |
| Vanacci    | Marcoport          |   56 |
| Surmeyers  | Ethelville         |   56 |
| Tison      | Lavernastad        |   57 |
| Holdey     | Kennithside        |   58 |
| Vanacci    | Marcoport          |   59 |
| Vanacci    | Marcoport          |   65 |
| Surmeyers  | Ethelville         |   67 |
| Ailn       | Rathmouth          |   69 |
| Hounson    | Port Lolamouth     |   71 |
| Ailn       | Rathmouth          |   72 |
| Blewmen    | Oberbrunnerchester |   76 |
| Vanacci    | Marcoport          |   76 |
| Surmeyers  | Ethelville         |   76 |
| Surmeyers  | Ethelville         |   76 |
| Bob        | Schulistland       |   76 |
| Marflitt   | New Adalineton     |   77 |
| Blewmen    | Oberbrunnerchester |   79 |
| Blewmen    | Oberbrunnerchester |   80 |
| Holdey     | Kennithside        |   81 |
| Holdey     | Kennithside        |   83 |
| Tison      | Lavernastad        |   84 |
| Blewmen    | Oberbrunnerchester |   87 |
| Holdey     | Kennithside        |   88 |
| Surmeyers  | Ethelville         |   89 |
| Ailn       | Rathmouth          |   91 |
| Surmeyers  | Ethelville         |   91 |
| Ailn       | Rathmouth          |   98 |
| Tison      | Lavernastad        |   98 |
| Ailn       | Rathmouth          |   98 |
| Surmeyers  | Ethelville         |  100 |
+------------+--------------------+------+
40 rows in set (0.00 sec)
```

### OUTER JOIN

#### LEFT JOIN
A left outer join will give all rows in A, plus any common rows in B.

```mysql
SELECT s.first_name, s.last_name, m.mark FROM students AS s
    LEFT JOIN marks AS m ON m.student_id = s.id
ORDER BY m.mark;
```

```mysql
+-------------+---------------------+------+
| first_name  | last_name           | mark |
+-------------+---------------------+------+
| Whaplington | West Breanabury     | NULL |
| Boxhill     | West Jedediahville  | NULL |
| Bob         | Port Thoraland      | NULL |
| Rickell     | East Breanne        | NULL |
| Haslock     | South Hunter        | NULL |
| Pinkard     | Port Adrianaborough | NULL |
| Tynan       | North Deondreland   | NULL |
| Henrique    | Kevinmouth          | NULL |
| Pietesch    | East Kayla          | NULL |
| Leeke       | Franeckiland        | NULL |
| Whale       | Lake Clare          | NULL |
| Ori         | Beattyburgh         | NULL |
| Tagg        | Oberbrunnerport     | NULL |
| Costerd     | Ricofort            | NULL |
| Corrin      | East Graycefurt     | NULL |
| Bunford     | West Joeport        | NULL |
| Presdee     | North Ernestinaton  | NULL |
| Lumley      | Oceanestad          | NULL |
| Danilchev   | North Esta          | NULL |
| Bedberry    | Jakaylaland         | NULL |
| Whiles      | Creolashire         | NULL |
| Holdey      | Kennithside         |    0 |
| Marflitt    | New Adalineton      |   23 |
| Tison       | Lavernastad         |   23 |
| Hounson     | Port Lolamouth      |   34 |
| Surmeyers   | Ethelville          |   34 |
| Holdey      | Kennithside         |   34 |
| Marflitt    | New Adalineton      |   45 |
| Blewmen     | Oberbrunnerchester  |   54 |
| Vanacci     | Marcoport           |   56 |
| Surmeyers   | Ethelville          |   56 |
| Tison       | Lavernastad         |   56 |
| Surmeyers   | Ethelville          |   56 |
| Tison       | Lavernastad         |   57 |
| Holdey      | Kennithside         |   58 |
| Vanacci     | Marcoport           |   59 |
| Vanacci     | Marcoport           |   65 |
| Surmeyers   | Ethelville          |   67 |
| Ailn        | Rathmouth           |   69 |
| Hounson     | Port Lolamouth      |   71 |
| Ailn        | Rathmouth           |   72 |
| Blewmen     | Oberbrunnerchester  |   76 |
| Vanacci     | Marcoport           |   76 |
| Surmeyers   | Ethelville          |   76 |
| Bob         | Schulistland        |   76 |
| Surmeyers   | Ethelville          |   76 |
| Marflitt    | New Adalineton      |   77 |
| Blewmen     | Oberbrunnerchester  |   79 |
| Blewmen     | Oberbrunnerchester  |   80 |
| Holdey      | Kennithside         |   81 |
| Holdey      | Kennithside         |   83 |
| Tison       | Lavernastad         |   84 |
| Blewmen     | Oberbrunnerchester  |   87 |
| Holdey      | Kennithside         |   88 |
| Surmeyers   | Ethelville          |   89 |
| Surmeyers   | Ethelville          |   91 |
| Ailn        | Rathmouth           |   91 |
| Tison       | Lavernastad         |   98 |
| Ailn        | Rathmouth           |   98 |
| Ailn        | Rathmouth           |   98 |
| Surmeyers   | Ethelville          |  100 |
+-------------+---------------------+------+
61 rows in set (0.00 sec)
```

#### RIGHT JOIN
A right outer join will give all rows in B, plus any common rows in A.

```mysql
SELECT s.first_name, s.last_name, m.mark FROM students AS s
    RIGHT JOIN marks AS m ON m.student_id = s.id
ORDER BY m.mark;
```

```mysql
+------------+--------------------+------+
| first_name | last_name          | mark |
+------------+--------------------+------+
| Holdey     | Kennithside        |    0 |
| Tison      | Lavernastad        |   23 |
| Marflitt   | New Adalineton     |   23 |
| Surmeyers  | Ethelville         |   34 |
| Hounson    | Port Lolamouth     |   34 |
| Holdey     | Kennithside        |   34 |
| Marflitt   | New Adalineton     |   45 |
| Blewmen    | Oberbrunnerchester |   54 |
| Surmeyers  | Ethelville         |   56 |
| Tison      | Lavernastad        |   56 |
| Vanacci    | Marcoport          |   56 |
| Surmeyers  | Ethelville         |   56 |
| Tison      | Lavernastad        |   57 |
| Holdey     | Kennithside        |   58 |
| Vanacci    | Marcoport          |   59 |
| Vanacci    | Marcoport          |   65 |
| Surmeyers  | Ethelville         |   67 |
| Ailn       | Rathmouth          |   69 |
| Hounson    | Port Lolamouth     |   71 |
| Ailn       | Rathmouth          |   72 |
| Blewmen    | Oberbrunnerchester |   76 |
| Vanacci    | Marcoport          |   76 |
| Surmeyers  | Ethelville         |   76 |
| Surmeyers  | Ethelville         |   76 |
| Bob        | Schulistland       |   76 |
| Marflitt   | New Adalineton     |   77 |
| Blewmen    | Oberbrunnerchester |   79 |
| Blewmen    | Oberbrunnerchester |   80 |
| Holdey     | Kennithside        |   81 |
| Holdey     | Kennithside        |   83 |
| Tison      | Lavernastad        |   84 |
| NULL       | NULL               |   84 |
| Blewmen    | Oberbrunnerchester |   87 |
| Holdey     | Kennithside        |   88 |
| Surmeyers  | Ethelville         |   89 |
| Ailn       | Rathmouth          |   91 |
| Surmeyers  | Ethelville         |   91 |
| Ailn       | Rathmouth          |   98 |
| Tison      | Lavernastad        |   98 |
| Ailn       | Rathmouth          |   98 |
| Surmeyers  | Ethelville         |  100 |
+------------+--------------------+------+
41 rows in set (0.00 sec)
```
#### FULL OUTER JOIN
A full outer join will give you all the rows in A and all the rows in B. We can use the follwing code to emulate full outer joins.

```mysql
SELECT s.first_name, s.last_name, m.mark FROM students AS s
   LEFT JOIN marks AS m ON m.student_id = s.id
UNION ALL
SELECT s.first_name, s.last_name, m.mark FROM students AS s
   RIGHT JOIN marks AS m ON m.student_id = s.id
WHERE s.id is null;
```

```mysql
+-------------+---------------------+------+
| first_name  | last_name           | mark |
+-------------+---------------------+------+
| Ailn        | Rathmouth           |   72 |
| Ailn        | Rathmouth           |   98 |
| Ailn        | Rathmouth           |   91 |
| Ailn        | Rathmouth           |   69 |
| Ailn        | Rathmouth           |   98 |
| Hounson     | Port Lolamouth      |   71 |
| Hounson     | Port Lolamouth      |   34 |
| Tison       | Lavernastad         |   84 |
| Tison       | Lavernastad         |   56 |
| Tison       | Lavernastad         |   98 |
| Tison       | Lavernastad         |   57 |
| Tison       | Lavernastad         |   23 |
| Surmeyers   | Ethelville          |   67 |
| Surmeyers   | Ethelville          |   34 |
| Surmeyers   | Ethelville          |  100 |
| Surmeyers   | Ethelville          |   76 |
| Surmeyers   | Ethelville          |   91 |
| Surmeyers   | Ethelville          |   56 |
| Surmeyers   | Ethelville          |   89 |
| Surmeyers   | Ethelville          |   76 |
| Surmeyers   | Ethelville          |   56 |
| Bob         | Schulistland        |   76 |
| Holdey      | Kennithside         |   81 |
| Holdey      | Kennithside         |   88 |
| Holdey      | Kennithside         |   58 |
| Holdey      | Kennithside         |    0 |
| Holdey      | Kennithside         |   34 |
| Holdey      | Kennithside         |   83 |
| Blewmen     | Oberbrunnerchester  |   80 |
| Blewmen     | Oberbrunnerchester  |   54 |
| Blewmen     | Oberbrunnerchester  |   79 |
| Blewmen     | Oberbrunnerchester  |   87 |
| Blewmen     | Oberbrunnerchester  |   76 |
| Vanacci     | Marcoport           |   56 |
| Vanacci     | Marcoport           |   59 |
| Vanacci     | Marcoport           |   76 |
| Vanacci     | Marcoport           |   65 |
| Marflitt    | New Adalineton      |   23 |
| Marflitt    | New Adalineton      |   45 |
| Marflitt    | New Adalineton      |   77 |
| Pietesch    | East Kayla          | NULL |
| Henrique    | Kevinmouth          | NULL |
| Tynan       | North Deondreland   | NULL |
| Pinkard     | Port Adrianaborough | NULL |
| Haslock     | South Hunter        | NULL |
| Rickell     | East Breanne        | NULL |
| Bob         | Port Thoraland      | NULL |
| Boxhill     | West Jedediahville  | NULL |
| Leeke       | Franeckiland        | NULL |
| Whale       | Lake Clare          | NULL |
| Ori         | Beattyburgh         | NULL |
| Tagg        | Oberbrunnerport     | NULL |
| Costerd     | Ricofort            | NULL |
| Corrin      | East Graycefurt     | NULL |
| Bunford     | West Joeport        | NULL |
| Lumley      | Oceanestad          | NULL |
| Whiles      | Creolashire         | NULL |
| Presdee     | North Ernestinaton  | NULL |
| Bedberry    | Jakaylaland         | NULL |
| Danilchev   | North Esta          | NULL |
| Whaplington | West Breanabury     | NULL |
| NULL        | NULL                |   84 |
+-------------+---------------------+------+
62 rows in set (0.00 sec)
```

## CASE

```mysql
SELECT
    CASE
        WHEN marks.mark >= 90 AND marks.mark <= 100 THEN "A"
        WHEN marks.mark >= 80 AND marks.mark <= 89 THEN "B"
        WHEN marks.mark >= 70 AND marks.mark <= 79 THEN "C"
        WHEN marks.mark >= 60 AND marks.mark <= 69 THEN "D"
        WHEN marks.mark >= 50 AND marks.mark <= 59 THEN "E"
        ELSE "F"
    END AS grades
FROM marks
ORDER BY grades;
```

```mysql
+--------+
| grades |
+--------+
| A      |
| A      |
| A      |
| A      |
| A      |
| A      |
| B      |
| B      |
| B      |
| B      |
| B      |
| B      |
| B      |
| B      |
| C      |
| C      |
| C      |
| C      |
| C      |
| C      |
| C      |
| C      |
| C      |
| D      |
| D      |
| D      |
| E      |
| E      |
| E      |
| E      |
| E      |
| E      |
| E      |
| E      |
| F      |
| F      |
| F      |
| F      |
| F      |
| F      |
| F      |
+--------+
41 rows in set (0.00 sec)
```

```mysql
SELECT marks.mark,
    CASE
        WHEN marks.mark >= 90 AND marks.mark <= 100 THEN "A"
        WHEN marks.mark >= 80 AND marks.mark <= 89 THEN "B"
        WHEN marks.mark >= 70 AND marks.mark <= 79 THEN "C"
        WHEN marks.mark >= 60 AND marks.mark <= 69 THEN "D"
        WHEN marks.mark >= 50 AND marks.mark <= 59 THEN "E"
        ELSE "F"
    END AS grades
FROM marks
ORDER BY grades;
```

```mysql
+------+--------+
| mark | grades |
+------+--------+
|  100 | A      |
|   91 | A      |
|   91 | A      |
|   98 | A      |
|   98 | A      |
|   98 | A      |
|   84 | B      |
|   81 | B      |
|   80 | B      |
|   88 | B      |
|   89 | B      |
|   87 | B      |
|   84 | B      |
|   83 | B      |
|   76 | C      |
|   76 | C      |
|   72 | C      |
|   71 | C      |
|   79 | C      |
|   76 | C      |
|   76 | C      |
|   76 | C      |
|   77 | C      |
|   69 | D      |
|   67 | D      |
|   65 | D      |
|   56 | E      |
|   56 | E      |
|   58 | E      |
|   56 | E      |
|   54 | E      |
|   59 | E      |
|   56 | E      |
|   57 | E      |
|   34 | F      |
|    0 | F      |
|   34 | F      |
|   34 | F      |
|   23 | F      |
|   45 | F      |
|   23 | F      |
+------+--------+
41 rows in set (0.00 sec)
```

```mysql
SELECT students.id, marks.mark, marks.subject,
    CASE
        WHEN marks.mark >= 90 AND marks.mark <= 100 THEN "A"
        WHEN marks.mark >= 80 AND marks.mark <= 89 THEN "B"
        WHEN marks.mark >= 70 AND marks.mark <= 79 THEN "C"
        WHEN marks.mark >= 60 AND marks.mark <= 69 THEN "D"
        WHEN marks.mark >= 50 AND marks.mark <= 59 THEN "E"
        ELSE "F"
     END AS grades
FROM students
    JOIN marks ON students.id = marks.student_id
ORDER BY grades;
```

```mysql
+----+------+------------------------------+--------+
| id | mark | subject                      | grades |
+----+------+------------------------------+--------+
|  4 |  100 | Necromancy                   | A      |
|  4 |   91 | Alien Economics              | A      |
|  1 |   91 | Alien Ethics                 | A      |
|  3 |   98 | Foreign Statistics           | A      |
|  1 |   98 | Alien Dance History          | A      |
|  1 |   98 | Space Travel                 | A      |
|  6 |   81 | Alien Physiology             | B      |
|  7 |   80 | Alien Bioengineering         | B      |
|  6 |   88 | Foreign Arts                 | B      |
|  4 |   89 | Magic Rituals                | B      |
|  7 |   87 | Foreign Social Skills        | B      |
|  3 |   84 | Galactic History             | B      |
|  6 |   83 | Intergallactic Relations     | B      |
|  4 |   76 | Transmutation                | C      |
|  5 |   76 | Alien Medicine               | C      |
|  1 |   72 | Foreign Arts                 | C      |
|  2 |   71 | Mathematics                  | C      |
|  7 |   79 | Military Law                 | C      |
|  8 |   76 | Alien Genealogy              | C      |
|  4 |   76 | Magic Music                  | C      |
|  7 |   76 | Foreign History              | C      |
|  9 |   77 | Foreign Evolutionary Biology | C      |
|  1 |   69 | Planetary Ecology            | D      |
|  4 |   67 | Nutrition Recognition        | D      |
|  8 |   65 | Alien Social Skills          | D      |
|  4 |   56 | Planetary Geography          | E      |
|  3 |   56 | Foreign Pathology            | E      |
|  6 |   58 | Herbalism                    | E      |
|  8 |   56 | Terraforming                 | E      |
|  7 |   54 | Foreign Political Sciences   | E      |
|  8 |   59 | Foreign Services             | E      |
|  4 |   56 | Foreign Instrumental Music   | E      |
|  3 |   57 | Foreign Ethics               | E      |
|  2 |   34 | Planetary History            | F      |
|  6 |    0 | Magic Music                  | F      |
|  4 |   34 | Dimensional Manipulation     | F      |
|  6 |   34 | Alien Social Studies         | F      |
|  9 |   23 | Magic Arts                   | F      |
|  9 |   45 | Grand Strategy               | F      |
|  3 |   23 | Magic Survival               | F      |
+----+------+------------------------------+--------+
40 rows in set (0.00 sec)
```

## `COUNT(*)`


The `COUNT(*)` function returns the number of rows in a result set returned by a SELECT statement. It returns the number of rows including duplicate, non-NULL and NULL rows.

```mysql
SELECT
    CASE
        WHEN marks.mark >= 90 AND marks.mark <= 100 THEN "A"
        WHEN marks.mark >= 80 AND marks.mark <= 89 THEN "B"
        WHEN marks.mark >= 70 AND marks.mark <= 79 THEN "C"
        WHEN marks.mark >= 60 AND marks.mark <= 69 THEN "D"
        WHEN marks.mark >= 50 AND marks.mark <= 59 THEN "E"
        ELSE "F"
     END AS grades,
COUNT(*) AS count
FROM students
    JOIN marks ON students.id = marks.student_id
GROUP BY grades
ORDER BY grades;
```

```mysql
+--------+-------+
| grades | count |
+--------+-------+
| A      |     6 |
| B      |     7 |
| C      |     9 |
| D      |     3 |
| E      |     8 |
| F      |     7 |
+--------+-------+
6 rows in set (0.00 sec)
```

## ROUND

```mysql
SELECT ROUND(SUM(mark), 2) FROM marks;
```

```mysql
+---------------------+
| ROUND(SUM(mark), 2) |
+---------------------+
|             2777.00 |
+---------------------+
1 row in set (0.00 sec)
```

## MIN and MAX

```mysql
SELECT MAX(mark), MIN(mark) FROM marks;
```

```mysql
+-----------+-----------+
| MAX(mark) | MIN(mark) |
+-----------+-----------+
|       100 |         0 |
+-----------+-----------+
1 row in set (0.00 sec)
```

## REPLACE

```mysql
SELECT subject, REPLACE(subject, 'Magic', 'Sorcery') FROM marks;
```

```mysql
+------------------------------+--------------------------------------+
| subject                      | REPLACE(subject, 'Magic', 'Sorcery') |
+------------------------------+--------------------------------------+
| Magic Survival               | Sorcery Survival                     |
| Planetary Geography          | Planetary Geography                  |
| Foreign Evolutionary Biology | Foreign Evolutionary Biology         |
| Intergallactic Relations     | Intergallactic Relations             |
| Grand Strategy               | Grand Strategy                       |
| Foreign History              | Foreign History                      |
| Alien Dance History          | Alien Dance History                  |
| Foreign Social Skills        | Foreign Social Skills                |
| Alien Social Skills          | Alien Social Skills                  |
| Magic Music                  | Sorcery Music                        |
| Alien Genealogy              | Alien Genealogy                      |
| Magic Rituals                | Sorcery Rituals                      |
| Planetary Ecology            | Planetary Ecology                    |
| Military Law                 | Military Law                         |
| Foreign Ethics               | Foreign Ethics                       |
| Foreign Instrumental Music   | Foreign Instrumental Music           |
| Foreign Services             | Foreign Services                     |
| Alien Economics              | Alien Economics                      |
| Alien Ethics                 | Alien Ethics                         |
| Magic Arts                   | Sorcery Arts                         |
| Alien Social Studies         | Alien Social Studies                 |
| Foreign Political Sciences   | Foreign Political Sciences           |
| Terraforming                 | Terraforming                         |
| Transmutation                | Transmutation                        |
| Space Travel                 | Space Travel                         |
| Alien Medicine               | Alien Medicine                       |
| Foreign Statistics           | Foreign Statistics                   |
| Necromancy                   | Necromancy                           |
| Magic Music                  | Sorcery Music                        |
| Planetary History            | Planetary History                    |
| Herbalism                    | Herbalism                            |
| Dimensional Manipulation     | Dimensional Manipulation             |
| Nutrition Recognition        | Nutrition Recognition                |
| Foreign Pathology            | Foreign Pathology                    |
| Foreign Arts                 | Foreign Arts                         |
| Alien Bioengineering         | Alien Bioengineering                 |
| Alien Physiology             | Alien Physiology                     |
| Mathematics                  | Mathematics                          |
| Foreign Arts                 | Foreign Arts                         |
| Galactic History             | Galactic History                     |
| Galactic History             | Galactic History                     |
+------------------------------+--------------------------------------+
41 rows in set (0.00 sec)
```

## LIMIT

```mysql
SELECT * FROM marks
LIMIT 1;
```

```mysql
+----+------------+------+----------------+
| id | student_id | mark | subject        |
+----+------------+------+----------------+
|  1 |          3 |   23 | Magic Survival |
+----+------------+------+----------------+
1 row in set (0.00 sec)
```

LIMIT x, y means return y rows, starting from xth row.

```mysql
SELECT * FROM marks
LIMIT 0, 5;
```

```mysql
+----+------------+------+------------------------------+
| id | student_id | mark | subject                      |
+----+------------+------+------------------------------+
|  1 |          3 |   23 | Magic Survival               |
|  2 |          4 |   56 | Planetary Geography          |
|  3 |          9 |   77 | Foreign Evolutionary Biology |
|  4 |          6 |   83 | Intergallactic Relations     |
|  5 |          9 |   45 | Grand Strategy               |
+----+------------+------+------------------------------+
5 rows in set (0.01 sec)
```

## Find duplicates

```mysql
SELECT subject, count(*) FROM marks
GROUP BY subject
HAVING count(*) > 1;
```

```mysql
+------------------+----------+
| subject          | count(*) |
+------------------+----------+
| Magic Music      |        2 |
| Foreign Arts     |        2 |
| Galactic History |        2 |
+------------------+----------+
3 rows in set (0.00 sec)
```

## IN

```mysql
SELECT * FROM marks
WHERE subject IN ('Magic Music');
```

```mysql
+----+------------+------+-------------+
| id | student_id | mark | subject     |
+----+------------+------+-------------+
| 10 |          4 |   76 | Magic Music |
| 29 |          6 |    0 | Magic Music |
+----+------------+------+-------------+
2 rows in set (0.01 sec)

```

## Like

* % - any sequence of zero, one, or multiple characters
* _ - matches a single character

To match `%` or `_` use a backslash as a prefix.

```mysql
SHOW DATABASES LIKE 'test%';
```

```mysql
+------------------+
| Database (test%) |
+------------------+
| test_db          |
+------------------+
1 row in set (0.00 sec)
```

```mysql
SHOW DATABASES LIKE 'test\_d_';
```

```mysql
+---------------------+
| Database (test\_d_) |
+---------------------+
| test_db             |
+---------------------+
1 row in set (0.00 sec)
```

## Output query results to a file

```mysql

```

```mysql

```

# Miscellaneous

```mysql
SELECT REPEAT('* ', 1);
SELECT REPEAT('* ', 2);
SELECT REPEAT('* ', 3);
SELECT REPEAT('* ', 4);
SELECT REPEAT('* ', 5);
SELECT REPEAT('* ', 6);
SELECT REPEAT('* ', 7);
SELECT REPEAT('* ', 8);
SELECT REPEAT('* ', 9);
SELECT REPEAT('* ', 10);
SELECT REPEAT('* ', 11);
SELECT REPEAT('* ', 12);
SELECT REPEAT('* ', 13);
SELECT REPEAT('* ', 14);
SELECT REPEAT('* ', 15);
SELECT REPEAT('* ', 16);
SELECT REPEAT('* ', 17);
SELECT REPEAT('* ', 18);
SELECT REPEAT('* ', 19);
SELECT REPEAT('* ', 20);
```

```mysql
SELECT elt(locate(operation, "+-*/"), a+b, a-b, a*b, a/b) = c
```

# Resources
1. [SQL](https://en.wikipedia.org/wiki/SQL)
2.  [MySQL](https://en.wikipedia.org/wiki/MySQL)
3.  [filldb](http://filldb.info/)
4. [mockaroo](https://www.mockaroo.com/)
5. [fantasynamegenerators](https://www.fantasynamegenerators.com/school-subjects.php)
6. [join](https://dev.mysql.com/doc/refman/8.0/en/join.html)
7. [what-is-the-difference-between-inner-join-and-outer-join](https://stackoverflow.com/questions/38549/what-is-the-difference-between-inner-join-and-outer-join)
8. [how-to-write-full-outer-join-in-mysql](https://www.xaprb.com/blog/2006/05/26/how-to-write-full-outer-join-in-mysql)
9. [MySQL Tutorial for Beginners](https://www.youtube.com/watch?v=7S_tz1z_5bA)
10. [COUNT(*)](https://www.mysqltutorial.org/mysql-count/#:~:text=The%20COUNT(*)%20function%20returns,non%2DNULL%20and%20NULL%20rows.)
11. [sql](https://www.hackerrank.com/domains/sql)
12. [Planetscale courses](https://planetscale.com/learn/courses/database-scaling/introduction/course-introduction)
