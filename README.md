# SQL
SQL, "sequel"; Structured Query Language) is a domain-specific language used in programming and designed for managing data held in a relational database management system (RDBMS), or for stream processing in a relational data stream management system (RDSMS). It is particularly useful in handling structured data, i.e. data incorporating relations among entities and variables.

# MySQL
MySQL is an open-source relational database management system (RDBMS).





```
select * from STUDENTS where name='bob' and age > 30

select name, age from STUDENTS

select DISTINCT name from STUDENTS WHERE MOD(ID, 2) = 0;

select (count(age)-count(distinct(age))) from STUDENTS;
```

```
SELECT elt(locate(operation, "+-*/"), a+b, a-b, a*b, a/b) = c
```


# Resource
1. [SQL](https://en.wikipedia.org/wiki/SQL)
2.  [MySQL](https://en.wikipedia.org/wiki/MySQL)