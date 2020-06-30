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
