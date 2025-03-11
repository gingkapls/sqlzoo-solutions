-- NULL

-- 1
SELECT teacher.name
FROM teacher
WHERE dept IS null;


-- 2
SELECT teacher.name,
       dept.name
FROM teacher
    INNER JOIN dept
        ON (teacher.dept = dept.id);


-- 3
SELECT teacher.name,
       dept.name AS dept
FROM teacher
    LEFT JOIN dept
        ON (teacher.dept = dept.id);


-- 4
SELECT teacher.name,
       dept.name AS dept
FROM teacher
    RIGHT JOIN dept
        ON (teacher.dept = dept.id);

-- 5
SELECT name,
       COALESCE(mobile, '07986 444 2266')
FROM teacher;


-- 6
SELECT teacher.name,
       coalesce(dept.name, 'None') AS dept
FROM teacher
    LEFT JOIN dept
        ON (teacher.dept = dept.id);


-- 7
SELECT count(name),
       count(mobile)
FROM teacher;


-- 8
SELECT dept.name,
       count(teacher.dept)
FROM dept
    LEFT JOIN teacher
        ON (teacher.dept = dept.id)
group by dept.name;


-- 9
SELECT teacher.name,
       (CASE
            WHEN dept in ( 1, 2 ) THEN
                'Sci'
            ELSE
                'Art'
        end
       )
FROM teacher;


-- 10
SELECT name,
       (CASE
            WHEN dept in ( 1, 2 ) THEN
                'Sci'
            WHEN dept = 3 THEN
                'Art'
            ELSE
                'None'
        end
       )
FROM teacher;
