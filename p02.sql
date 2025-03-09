-- SELECT FROM Nobel Tutorial

-- 1
SELECT yr,
       subject,
       winner
FROM nobel
WHERE yr = 1950;


-- 2
SELECT winner
FROM nobel
WHERE yr = 1962
      AND subject = 'literature';


-- 3
SELECT yr,
       subject
FROM nobel
WHERE winner = 'Albert Einstein';


-- 4
SELECT winner
FROM nobel
WHERE subject = 'peace'
      AND yr >= 2000;

-- 5
SELECT *
FROM nobel
WHERE yr
      between 1980 AND 1989
      AND subject = 'literature';

-- 6
SELECT *
FROM nobel
WHERE winner IN ( 'Theodore Roosevelt', 'Thomas Woodrow Wilson', 'Jimmy Carter', 'Barack Obama' );


-- 7
SELECT winner
FROM nobel
WHERE winner LIKE 'John%';


-- 8 
SELECT *
FROM nobel
WHERE subject = 'physics'
      AND yr = 1980
      OR subject = 'chemistry'
         AND yr = 1984;

-- 9
SELECT *
FROM nobel
WHERE yr = 1980
      AND subject not IN ( 'chemistry', 'medicine' );

-- 10
SELECT *
FROM nobel
WHERE subject = 'medicine'
      AND yr < 1910
      OR subject = 'literature'
         AND yr >= 2004;

-- 11
SELECT *
FROM nobel
WHERE winner LIKE 'PETER GR_NBERG';


-- 12
SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL';


-- 13
SELECT winner,
       yr,
       subject
FROM nobel
WHERE winner like 'Sir%'
ORDER BY yr DESC,
         winner;

-- 14
SELECT winner,
       subject
FROM nobel
WHERE yr = 1984
ORDER BY (subject IN ('physics','chemistry')),
         subject,
         winner;
