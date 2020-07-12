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
```
