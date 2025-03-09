-- SELECT within SELECT Tutorial

--1 
SELECT name
FROM world
WHERE population >
(
    SELECT population FROM world WHERE name = 'Russia'
);

-- 2
SELECT name
FROM world
WHERE continent = 'Europe'
      AND gdp / population >
      (
          SELECT gdp / population FROM world WHERE name = 'United KingDom'
      );

-- 3
SELECT name,
       continent
FROM world
WHERE continent IN (
                       SELECT continent FROM world WHERE name IN ( 'Argentina', 'Australia' )
                   )
order BY name;

-- 4
SELECT name,
       population
FROM world
WHERE population >
(
    SELECT population FROM world WHERE name = 'United Kingdom'
)
      AND population <
      (
          SELECT population FROM world WHERE name = 'Germany'
      );

-- 5
SELECT name,
       concat(round(   (population /
                        (
                            SELECT population FROM world WHERE name = 'Germany'
                        ) * 100
                       ),
                       0
                   ),
              '%'
             ) AS percentage
FROM world
WHERE continent = 'Europe';

-- 6
SELECT name
FROM world
WHERE gdp>ALL
(
    SELECT gdp FROM world WHERE continent = 'Europe' AND gdp > 0
);


-- 7
SELECT continent,
       name,
       area
FROM world x
WHERE area>=ALL
(
    SELECT area
    FROM world y
    WHERE y.continent = x.continent
          AND population > 0
);


-- 8
SELECT continent,
       name
FROM world AS x
WHERE name =
(
    SELECT name
    FROM world y
    WHERE x.continent = y.continent
    order BY name ASC LIMIT 1
);

-- 9
SELECT name,
       continent,
       population
FROM world
WHERE continent not IN (
                           SELECT continent FROM world WHERE population > 25000000
                       )

-- 10
SELECT name,
       continent
FROM world x
WHERE population>=ALL
(
    SELECT 3 * population
    FROM world y
    WHERE y.continent = x.continent
          AND y.name <> x.name
);
