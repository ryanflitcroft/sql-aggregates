-- find the title and count of the top 10 most rented films
-- use COUNT to count each row
-- GROUP BY the film_id
-- ORDER in descending order
-- LIMIT 10
SELECT
	title,
    COUNT(*)
FROM
	rental
LEFT JOIN
	inventory
ON
	inventory.inventory_id = rental.inventory_id
LEFT JOIN
	film
ON
	film.film_id = inventory.film_id
GROUP BY
	film.film_id
ORDER BY
	count DESC
LIMIT
	10;
