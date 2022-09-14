--1) 
SELECT COUNT(*) FROM film WHERE length > (SELECT AVG(length) FROM film);

--2)
SELECT COUNT(*) FROM film WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

--3)
SELECT title, rental_rate, replacement_cost FROM film 
WHERE rental_rate = (SELECT MIN(rental_rate)FROM film) 
AND replacement_cost = (SELECT MIN(replacement_cost)FROM film) 
ORDER BY rental_rate, replacement_cost;

--4)
SELECT * FROM customer
WHERE customer_id = ANY 
(
    SELECT customer_id FROM payment
    GROUP BY customer_id
    ORDER BY COUNT(customer_id) DESC
)
LIMIT 5;