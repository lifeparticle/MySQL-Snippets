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
