USE sakila;
1. 
SELECT DISTINCT
title
FROM film;

2.
SELECT
title
FROM film
WHERE rating="PG-13";

3.
SELECT 
title,
description
FROM film
WHERE description REGEXP 'amazing';

4.
SELECT
title
FROM film
WHERE length>120
ORDER BY length;

5.
SELECT 
first_name,
last_name
FROM actor
ORDER BY first_name;

6.
SELECT
first_name,
last_name
FROM actor
WHERE last_name='Gibson';

7.
SELECT
actor_id, 
first_name
FROM actor
WHERE actor_id BETWEEN 10 AND 20;

8.
SELECT
title,
rating
FROM film
WHERE rating NOT LIKE "R" OR "PG-13";

9.
SELECT 
rating,
COUNT(film_id) AS total_peliculas
FROM 
film
GROUP BY rating
ORDER BY total_peliculas DESC;

10. 
SELECT
customer_id,
first_name,
last_name,
(SELECT COUNT(rental_id)
FROM rental
WHERE customer.customer_id=rental.customer_id) AS total_peliculas 
FROM customer;



11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría
 junto con el recuento de alquileres.
SELECT
category.name,
COUNT(film_category.film_id)
FROM category
INNER JOIN film_category
ON category.category_id=film_category.category_id
WHERE (
	SELECT
	COUNT(rental.rental_id)
	FROM rental
	INNER JOIN inventory
	ON rental.inventory_id=inventory.inventory_id)
GROUP BY category.name;

12.
 SELECT
 rating,
 AVG(length) AS media_duracion
 FROM
 film
 GROUP BY rating
 ORDER BY media_duracion DESC;
 
13.
  SELECT
  first_name,
  last_name
  FROM actor
  WHERE actor_id IN(
	SELECT
	actor_id
	FROM film_actor
	INNER JOIN film
	ON film_actor.film_id=film.film_id
	WHERE film.title='Indian Love');
    
14.
SELECT 
title
FROM film
WHERE title REGEXP '//bdogb//b' OR '//bcat//b';

15.
SELECT 
title,
release_year AS año_estreno
FROM
film
WHERE release_year BETWEEN 2005 AND 2010;

16.

SELECT
title
FROM
film
WHERE film_id IN (
SELECT 
film_id
FROM film_category
INNER JOIN category
ON film_category.category_id=category.category_id
WHERE name='Family');

17.
 SELECT
 title
 FROM
 film
 WHERE rating='R' AND length>120;
 
 18.
 SELECT
 first_name,
 last_name
 FROM actor
 WHERE actor_id IN (
	SELECT 
	COUNT(film_id) AS total_peliculas
	FROM film_actor
	GROUP BY actor_id
	HAVING total_peliculas>10);
    
19.
SELECT
actor_id
FROM film_actor
WHERE film_id IS NULL;
 




