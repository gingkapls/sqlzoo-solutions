-- The JOIN operation

-- 1
SELECT matchid,
       player
FROM goal
WHERE teamid = 'GER';

-- 2
SELECT id,
       stadium,
       team1,
       team2
FROM game
WHERE id = 1012;

-- 3
SELECT goal.player,
       goal.teamid,
       game.stadium,
       game.mdate
FROM game
    JOIN goal
        ON (id = matchid)
WHERE teamid = 'GER';


-- 4
SELECT game.team1,
       game.team2,
       goal.player
FROM game
    INNER JOIN goal
        ON (goal.matchid = game.id)
WHERE goal.player LIKE 'Mario%';


-- 5
SELECT goal.player,
       goal.teamid,
       eteam.coach,
       goal.gtime
FROM goal
    INNER JOIN eteam
        ON (eteam.id = goal.teamid)
WHERE gtime <= 10;


-- 6
SELECT game.mdate,
       eteam.teamname
FROM game
    INNER JOIN eteam
        ON (eteam.id = game.team1)
WHERE eteam.coach = 'Fernando Santos';


-- 7
SELECT goal.player
FROM goal
    INNER JOIN game
        ON (game.id = goal.matchid)
WHERE game.stadium = 'National Stadium, Warsaw';


-- 8 
SELECT distinct
    player
FROM goal
    INNER JOIN game
        ON (game.id = goal.matchid)
WHERE goal.teamid <> 'GER'
      AND (
              game.team1 = 'GER'
              OR game.team2 = 'GER'
          );

-- 9
SELECT eteam.teamname,
       count(goal.teamid)
FROM goal
    INNER JOIN eteam
        ON (eteam.id = goal.teamid)
GROUP BY eteam.teamname;


-- 10
SELECT game.stadium,
       count(game.stadium)
FROM game
    INNER JOIN goal
        ON (game.id = goal.matchid)
GROUP BY game.stadium;


-- 11
SELECT matchid,
       mdate,
       count(goal.matchid)
FROM game
    JOIN goal
        ON matchid = id
WHERE (
          team1 = 'POL'
          OR team2 = 'POL'
      )
GROUP BY goal.matchid;


-- 12
SELECT game.id,
       game.mdate,
       count(goal.matchid)
FROM game
    INNER JOIN goal
        ON (goal.matchid = game.id)
WHERE goal.teamid = 'GER'
GROUP BY goal.matchid;


-- 13
SELECT mdate,
       team1,
       sum(   CASE
                  WHEN teamid = team1 THEN
                      1
                  ELSE
                      0
              END
          ) score1,
       team2,
       sum(   CASE
                  WHEN teamid = team2 THEN
                      1
                  ELSE
                      0
              END
          ) score2
FROM game
    LEFT OUTER JOIN goal
        ON game.id = goal.matchid
GROUP BY id
ORDER BY mdate,
         matchid,
         team1,
         team2;
