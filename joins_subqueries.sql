-- Question 1
SELECT *
FROM customer 
JOIN address 
ON customer.address_id = address.address_id 
WHERE district = 'Texas';
-- Answer: 5 customers who live in TX, see query

-- Question 2
SELECT first_name, last_name, amount
FROM customer 
JOIN payment 
ON customer.customer_id = payment.customer_id 
WHERE amount > 6.99;
-- Answer: see query

-- Question 3
SELECT first_name, last_name 
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);
-- Answer: 6 customers, see query

-- Question 4
SELECT first_name, last_name
FROM customer 
JOIN address
ON customer.address_id = address.address_id
WHERE city_id IN (
	SELECT city_id
	FROM country 
	JOIN city 
	ON country.country_id = city.country_id 
	WHERE country = 'Argentina'
);
-- Answer: 13 people live in Argentina, see query

-- Question 5
SELECT *
FROM category
WHERE category_id IN (
	SELECT category_id
	FROM film_category
	GROUP BY category_id
	ORDER BY count(*)
	LIMIT 1
);
-- Answer: The music category has the least amount of movies.

-- Question 6
SELECT *
FROM film_actor
JOIN film 
ON film_actor.film_id = film.film_id
WHERE film.film_id IN (
	SELECT film_id
	FROM film_actor 
	GROUP BY film_id 
	ORDER BY count(*) DESC 
	LIMIT 1
)LIMIT 1;
-- Answer: Film 508 had the most actors (15)

-- Question 7
SELECT first_name, last_name
FROM actor
JOIN film_actor 
ON actor.actor_id = film_actor.actor_id
WHERE actor.actor_id IN (
	SELECT actor_id
	FROM film_actor 
	GROUP BY actor_id 
	ORDER BY count(*)
	LIMIT 1
)LIMIT 1;
-- Answer: Emily Dee has been in the least movies. 

-- Question 8
SELECT country
FROM country
WHERE country_id IN (
	SELECT country_id
	FROM city 
	GROUP BY country_id 
	ORDER BY COUNT(*) DESC
	LIMIT 1
);
-- Answer: India has 60 cities

-- Question 9
SELECT actor_id, count(*)
FROM film_actor
GROUP BY actor_id 
ORDER BY count(*);
-- minimum number of movies an actor appears in is 14; no actors appear in between 3 and 6 movies
