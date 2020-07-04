https://www.hackerrank.com/challenges/binary-search-tree-1/problem

```
SELECT n,
CASE
    WHEN p IS null THEN "Root"
    WHEN N IN (SELECT P FROM BST) THEN "Inner"
    ELSE "Leaf"
    END AS node
FROM BST
ORDER BY n;
```

https://www.hackerrank.com/challenges/weather-observation-station-20/problem

```
SET @row := -1;
SELECT ROUND(AVG(val), 4) FROM
(
SELECT @row := @row + 1 AS row, LAT_N AS val FROM STATION
ORDER BY LAT_N
) AS res
WHERE res.row = FLOOR(@row / 2) OR res.row = CEIL(@row / 2)
```

https://www.hackerrank.com/challenges/occupations/submissions/code/166421846

```
set @r1=0, @r2=0, @r3=0, @r4=0;
select min(Doctor), min(Professor), min(Singer), min(Actor)
from(
  select case when Occupation='Doctor' then (@r1:=@r1+1)
            when Occupation='Professor' then (@r2:=@r2+1)
            when Occupation='Singer' then (@r3:=@r3+1)
            when Occupation='Actor' then (@r4:=@r4+1) end as RowNumber,
    case when Occupation='Doctor' then Name end as Doctor,
    case when Occupation='Professor' then Name end as Professor,
    case when Occupation='Singer' then Name end as Singer,
    case when Occupation='Actor' then Name end as Actor
  from OCCUPATIONS
  order by Name
) Temp
group by RowNumber
```

https://www.hackerrank.com/challenges/full-score/submissions/code/165153512

```
SELECT Hackers.hacker_id, Hackers.name
FROM Hackers
JOIN Submissions ON Submissions.hacker_id = Hackers.hacker_id
JOIN Challenges ON Challenges.challenge_id = Submissions.challenge_id
JOIN Difficulty ON Difficulty.difficulty_level = Challenges.difficulty_level
WHERE Submissions.score = Difficulty.score
GROUP BY Hackers.hacker_id, Hackers.name
HAVING COUNT(Submissions.challenge_id) > 1
ORDER BY COUNT(Submissions.challenge_id) DESC, Hackers.hacker_id ASC;
```

https://www.hackerrank.com/challenges/the-report/submissions/code/165045045

```
GROUP BY Hackers.hacker_id, Hackers.nameSELECT IF(Grades.Grade < 8, NULL, Students.name), Grades.Grade, Students.marks FROM Students JOIN Grades
ON Students.marks BETWEEN Grades.min_mark AND Grades.max_mark
ORDER BY Grades.Grade DESC, Students.name ASC, Students.marks ASC;
```
