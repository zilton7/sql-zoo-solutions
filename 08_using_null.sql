--  https://sqlzoo.net/wiki/Using_Null
-- 1
SELECT name FROM teacher
WHERE dept is NULL
-- 2
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)
-- 3
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)
-- 4
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)
-- 5
SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher
-- 6
SELECT teacher.name, COALESCE(dept.name, 'None') FROM teacher 
LEFT JOIN dept ON (teacher.dept=dept.id)
-- 7
SELECT COUNT(name), COUNT(mobile) FROM teacher
-- 8
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id)
GROUP BY dept.name
-- 9
SELECT teacher.name, CASE WHEN dept.id=1 OR dept.id=2 THEN 'Sci' ELSE 'Art' END FROM teacher
LEFT JOIN dept ON (teacher.dept=dept.id)
-- 10
SELECT teacher.name, CASE WHEN dept.id=1 OR dept.id=2 THEN 'Sci'WHEN dept.id=3 THEN 'Art' ELSE 'None' END FROM teacher
LEFT JOIN dept ON (teacher.dept=dept.id)
