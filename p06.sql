-- More JOIN Operations

-- 1
SELECT id,
       title
FROM movie
WHERE yr = 1962;


-- 2
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

-- 3
SELECT id,
       title,
       yr
FROM movie
WHERE title LIKE '%star trek%'
ORDER BY yr;

-- 4
SELECT id fr
FROM actor
WHERE name = 'Glenn Close';

-- 5
SELECT id
FROM movie
WHERE title = 'Casablanca';


-- 6
SELECT name
FROM actor
WHERE id IN (
                SELECT casting.actorid
                FROM casting
                WHERE movieid =
                (
                    SELECT id FROM movie WHERE title = 'Casablanca'
                )
            );


-- 7
SELECT name
FROM actor
WHERE id IN (
                SELECT casting.actorid
                FROM casting
                WHERE movieid =
                (
                    SELECT id FROM movie WHERE title = 'Alien'
                )
            );


-- 8
SELECT movie.title
FROM movie
WHERE movie.id IN (
                      SELECT movieid
                      FROM casting
                      WHERE actorid =
                      (
                          SELECT id FROM actor WHERE name = 'Harrison Ford'
                      )
                  );


-- 9
SELECT movie.title
FROM movie
WHERE movie.id IN (
                      SELECT movieid
                      FROM casting
                      WHERE ord <> 1
                            AND actorid =
                            (
                                SELECT id FROM actor WHERE name = 'Harrison Ford'
                            )
                  );


-- 10
SELECT movie.title,
       actor.name
FROM movie
    INNER JOIN casting
        ON (movie.id = casting.movieid)
    INNER JOIN actor
        ON (casting.actorid = actor.id)
WHERE yr = 1962
      AND ord = 1;


-- 11
SELECT yr,
       COUNT(title)
FROM movie
    JOIN casting
        ON movie.id = movieid
    JOIN actor
        ON actorid = actor.id
WHERE actor.name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;


-- 12
SELECT movie.title,
       actor.name
FROM movie
    INNER JOIN casting
        ON (movie.id = casting.movieid)
    INNER JOIN actor
        ON (actor.id = casting.actorid)
WHERE ord = 1
      AND movie.id IN (
                          SELECT movieid
                          FROM casting
                          WHERE actorid =
                          (
                              SELECT id FROM actor WHERE name = 'Julie Andrews'
                          )
                      );


-- 13
SELECT actor.name
FROM actor
    INNER JOIN casting
        ON (casting.actorid = actor.id)
WHERE ord = 1
group BY actor.name
having COUNT(id) >= 15;


SELECT movie.title,
       COUNT(casting.movieid) AS 'number of actors'
FROM movie
    INNER JOIN casting
        ON (movie.id = casting.movieid)
WHERE movie.yr = 1978
group BY casting.movieid
ORDER BY COUNT(casting.movieid) DESC,
         movie.title;

SELECT actor.name
FROM actor
WHERE actor.name <> 'Art Garfunkel'
      AND actor.id IN (
                          SELECT casting.actorid
                          FROM casting
                          WHERE casting.movieid IN (
                                                       SELECT casting.movieid
                                                       FROM casting
                                                       WHERE casting.actorid =
                                                       (
                                                           SELECT actor.id FROM actor WHERE actor.name = 'Art Garfunkel'
                                                       )
                                                   )
                      );
