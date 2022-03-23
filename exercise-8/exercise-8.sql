-- rank of film category by times rented
-- include the name, count, and rank
SELECT
	name,
	COUNT(rental_date) AS count,
    RANK() OVER(ORDER BY COUNT(rental_date) DESC)
FROM
    rental
INNER JOIN
	inventory
ON
	inventory.inventory_id = rental.inventory_id
INNER JOIN
	film
ON
	film.film_id = inventory.film_id
INNER JOIN
	film_category
ON
	film_category.film_id = film.film_id
INNER JOIN
	category
ON
	category.category_id = film_category.category_id
GROUP BY
	name
LIMIT
	16;
    
    