# 1
/*
List the films where the yr is 1962 [Show id, title]
*/
SELECT id, title
FROM movie
WHERE yr = 1962

# 2
/*
Give year of 'Citizen Kane'.
*/
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

# 3
/*
List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year
*/
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

# 4
/*
What id number does the actor 'Glenn Close' have?
*/
SELECT id
FROM actor
WHERE name = 'Glenn Close' 

# 5
/*
What is the id of the film 'Casablanca'
*/
SELECT id
FROM movie
WHERE title = 'Casablanca'

# 6
/*
Obtain the cast list for 'Casablanca'.
*/
SELECT name 
FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid
WHERE movieid = 27

# 7
/*
Obtain the cast list for the film 'Alien'
*/
SELECT name 
FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid
WHERE movie.title = 'Alien'

# 8
/*
List the films in which 'Harrison Ford' has appeared
*/
SELECT title
FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid
WHERE actor.name = 'Harrison Ford'

# 9
/*
List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
*/
SELECT title
FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid
WHERE actor.name = 'Harrison Ford'
AND casting.ord != 1

# 10
/*
List the films together with the leading star for all 1962 films.
*/
SELECT title, actor.name
FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid
WHERE casting.ord = 1 AND movie.yr = 1962

# 11
/*
Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
*/
SELECT yr, COUNT(title) as 'Movies Made'
FROM movie JOIN casting ON movie.id=movieid JOIN actor ON actorid=actor.id
WHERE actor.name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 1

# 12
/*
List the film title and the leading actor for all of the films 'Julie Andrews' played in.

Did you get "Little Miss Marker twice"?
Julie Andrews starred in the 1980 remake of Little Miss Marker and not the original(1934).

Title is not a unique field, create a table of IDs in your subquery
*/
SELECT title, name 
FROM movie JOIN casting x ON movie.id = movieid JOIN actor ON actor.id = actorid
WHERE ord = 1 AND 
 movieid IN (SELECT movieid FROM casting y JOIN actor ON actor.id = actorid WHERE name='Julie Andrews')

# 13
/*
Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
*/
SELECT name
FROM actor JOIN casting ON (id = actorid AND 
 (SELECT COUNT(ord) FROM casting WHERE actorid = actor.id AND ord=1)>=15)
GROUP BY name

# 14
/*
List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
*/
SELECT title, COUNT(actorid)
FROM casting,movie                
WHERE yr = 1978 AND movieid=movie.id
GROUP BY title
ORDER BY 2 DESC, 1 ASC

# 15
/*
List all the people who have worked with 'Art Garfunkel'.
*/
SELECT DISTINCT d.name
FROM actor d JOIN casting a ON (a.actorid=d.id)
   JOIN casting b on (a.movieid=b.movieid)
   JOIN actor c on (b.actorid=c.id 
                and c.name='Art Garfunkel')
WHERE d.id != c.id
