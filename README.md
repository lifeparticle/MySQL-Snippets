   * [SQL](#sql)
   * [MySQL](#mysql)
   * [Docker Setup](#docker-setup)
   * [MySQL Keywords](#mysql-keywords)
   * [MySQL Databases](#mysql-databases)
   * [MySQL Tables](#mysql-tables)
      * [Select students with first name Bob and postcode 23031.](#select-students-with-first-name-bob-and-postcode-23031)
      * [Select all city names and postcodes.](#select-all-city-names-and-postcodes)
      * [Select unique first names with even id.](#select-unique-first-names-with-even-id)
      * [Find duplicate postcodes.](#find-duplicate-postcodes)
      * [Find the shortest and longest first names ordered alphabetically.](#find-the-shortest-and-longest-first-names-ordered-alphabetically)
      * [Find unique first names starting with vowels.](#find-unique-first-names-starting-with-vowels)
      * [Find unique first names that ends with vowels.](#find-unique-first-names-that-ends-with-vowels)
      * [Find unique first names that starts or ends with vowels.](#find-unique-first-names-that-starts-or-ends-with-vowels)
      * [Find unique first names that does not starts with vowels.](#find-unique-first-names-that-does-not-starts-with-vowels)
      * [Find unique first names that does not ends with vowels.](#find-unique-first-names-that-does-not-ends-with-vowels)
      * [Find unique first names that does not starts or ends with vowels.](#find-unique-first-names-that-does-not-starts-or-ends-with-vowels)
      * [Find unique first names that does not starts and ends with vowels.](#find-unique-first-names-that-does-not-starts-and-ends-with-vowels)
      * [Use of LEFT and RIGHT](#use-of-left-and-right)
      * [Ascending order](#ascending-order)
      * [GROUP BY, GROUP_CONCAT, FLOOR, AVG with JOIN](#group-by-group_concat-floor-avg-with-join)
      * [IF with JOIN](#if-with-join)
      * [BETWEEN with JOIN](#between-with-join)
      * [TODO](#todo)
      * [TODO](#todo-1)
      * [TODO](#todo-2)
      * [TODO](#todo-3)
      * [TODO](#todo-4)
      * [TODO](#todo-5)
      * [TODO](#todo-6)
      * [TODO](#todo-7)
      * [TODO](#todo-8)
      * [TODO](#todo-9)
      * [TODO](#todo-10)
      * [TODO](#todo-11)
      * [TODO](#todo-12)
      * [TODO](#todo-13)
      * [TODO](#todo-14)
      * [TODO](#todo-15)
      * [TODO](#todo-16)
      * [TODO](#todo-17)
      * [TODO](#todo-18)
      * [TODO](#todo-19)
      * [TODO](#todo-20)
      * [TODO](#todo-21)
      * [TODO](#todo-22)
      * [TODO](#todo-23)
      * [TODO](#todo-24)
      * [TODO](#todo-25)
      * [TODO](#todo-26)
      * [TODO](#todo-27)
      * [TODO](#todo-28)
      * [TODO](#todo-29)
      * [TODO](#todo-30)
   * [Use of Like keyword](#use-of-like-keyword)
      * [Others](#others)
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

# MySQL Databases

Run the MySQl queries from this file [students.sql](students.sql) from the MySQL CLI.

```
mysql -uroot -proot
```

or import the sql file.

```
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

```
CREATE DATABASE test_db_1;
```

Delete a database. This will delete all the tables within the database.

```
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

Rename a table. Be aware that one or more application can be using the old table name.

```mysql
RENAME TABLE old_table_name TO new_table_name;
```

Copy a table.

```mysql
CREATE TABLE new_table_name TO old_table_name;
INSERT new_table_name SELECT * FROM old_table_name;
```



## Select students with first name Bob and postcode 23031.
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

## Select all city names and postcodes.
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

## Select unique first names with even id.
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

## Find duplicate postcodes.
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

## Use of LEFT and RIGHT

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

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

## TODO

```mysql

```

```mysql

```

# Use of Like keyword

% - any sequence of zero, one, or multiple characters
_ - matches a single character

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

## Others

```mysql
SELECT elt(locate(operation, "+-*/"), a+b, a-b, a*b, a/b) = c
```

# Resources
1. [SQL](https://en.wikipedia.org/wiki/SQL)
2.  [MySQL](https://en.wikipedia.org/wiki/MySQL)
3.  [filldb](http://filldb.info/)
4. [mockaroo](https://www.mockaroo.com/)
5. [fantasynamegenerators](https://www.fantasynamegenerators.com/school-subjects.php)