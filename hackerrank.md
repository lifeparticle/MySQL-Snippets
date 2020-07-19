1. https://www.hackerrank.com/challenges/binary-search-tree-1/problem

```mysql
SELECT n,
CASE
    WHEN p IS null THEN "Root"
    WHEN N IN (SELECT P FROM BST) THEN "Inner"
    ELSE "Leaf"
    END AS node
FROM BST
ORDER BY n;
```

2. https://www.hackerrank.com/challenges/weather-observation-station-20/problem

```mysql
SET @row := -1;
    SELECT ROUND(AVG(val), 4)
FROM
(
    SELECT @row := @row + 1 AS row,
    LAT_N AS val FROM STATION
    ORDER BY LAT_N
) AS res
WHERE res.row = FLOOR(@row / 2) OR res.row = CEIL(@row / 2)
```

3. https://www.hackerrank.com/challenges/occupations/submissions/code/166421846

```mysql
set @r1=0, @r2=0, @r3=0, @r4=0;
SELECT MIN(Doctor),
    MIN(Professor),
    MIN(Singer), min(Actor)
FROM
(
    SELECT CASE
        WHEN Occupation='Doctor' THEN (@r1:=@r1+1)
        WHEN Occupation='Professor' THEN (@r2:=@r2+1)
        WHEN Occupation='Singer' THEN (@r3:=@r3+1)
        WHEN Occupation='Actor' THEN (@r4:=@r4+1) end as RowNumber,
    CASE WHEN Occupation='Doctor' THEN Name end as Doctor,
    CASE WHEN Occupation='Professor' THEN Name end as Professor,
    CASE WHEN Occupation='Singer' THEN Name end as Singer,
    CASE WHEN Occupation='Actor' THEN Name end as Actor
  FROM OCCUPATIONS
  ORDER BY Name
) AS temp
GROUP BY RowNumber
```

4. https://www.hackerrank.com/challenges/full-score/submissions/code/165153512

```mysql
SELECT Hackers.hacker_id,
    Hackers.name
FROM Hackers
JOIN Submissions ON
    Submissions.hacker_id = Hackers.hacker_id
JOIN Challenges ON
    Challenges.challenge_id = Submissions.challenge_id
JOIN Difficulty ON
    Difficulty.difficulty_level = Challenges.difficulty_level
WHERE Submissions.score = Difficulty.score
GROUP BY Hackers.hacker_id, Hackers.name
HAVING COUNT(Submissions.challenge_id) > 1
ORDER BY COUNT(Submissions.challenge_id) DESC, Hackers.hacker_id ASC;
```

5. https://www.hackerrank.com/challenges/the-report/submissions/code/165045045

```mysql
SELECT IF(Grades.Grade < 8, NULL, Students.name),
Grades.Grade,
Students.marks
FROM Students
JOIN Grades ON
    Students.marks BETWEEN Grades.min_mark AND Grades.max_mark
ORDER BY Grades.Grade DESC, Students.name ASC, Students.marks ASC;
```
6. https://www.hackerrank.com/challenges/placements/problem

```mysql
SELECT s.name FROM students AS s
JOIN packages AS p ON s.id = p.id
JOIN friends AS f ON s.id = f.id
JOIN packages AS fp ON f.friend_id = fp.id
WHERE fp.salary > p.salary
ORDER BY fp.salary ASC;
```

7. https://www.hackerrank.com/challenges/sql-projects/problem

```mysql
SELECT start_date, MIN(end_date) FROM
(SELECT start_date FROM projects WHERE start_date NOT IN (SELECT end_date FROM projects)) s,
(SELECT end_date FROM projects WHERE end_date NOT IN (SELECT start_date FROM projects)) e
WHERE start_date < end_date
GROUP BY start_date
ORDER BY DATEDIFF(MIN(end_date), start_date), start_date;
```

8. https://www.hackerrank.com/challenges/harry-potter-and-wands/problem

```mysql

```

9. https://www.hackerrank.com/challenges/the-company/problem

```mysql

```

10. https://www.hackerrank.com/challenges/challenges/problem

```mysql
SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS challenges_created FROM hackers AS h
JOIN challenges AS c ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING challenges_created = (SELECT COUNT(c1.challenge_id) FROM challenges AS c1 GROUP BY c1.hacker_id ORDER BY COUNT(c.challenge_id) DESC LIMIT 1)
OR
challenges_created IN (SELECT c3.z FROM (SELECT COUNT(c2.challenge_id) AS z FROM challenges AS c2 GROUP BY c2.hacker_id) AS c3 GROUP BY c3.z HAVING COUNT(c3.z) = 1)
ORDER BY challenges_created DESC, h.hacker_id
```

11. https://www.hackerrank.com/challenges/contest-leaderboard/problem

```mysql

```

12. https://www.hackerrank.com/challenges/symmetric-pairs/problem

```mysql

```

13. https://www.hackerrank.com/challenges/print-prime-numbers/problem

```mysql

```
