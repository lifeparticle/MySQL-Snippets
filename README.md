# MySQL-Code-Snippet



```
select * from STUDENTS where name='bob' and age > 30

select name, age from STUDENTS

select DISTINCT name from STUDENTS WHERE MOD(ID, 2) = 0;

select (count(age)-count(distinct(age))) from STUDENTS;
```

```
SELECT elt(locate(operation, "+-*/"), a+b, a-b, a*b, a/b) = c
```
