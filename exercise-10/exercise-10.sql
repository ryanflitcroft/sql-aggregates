-- CUBE of amount made per year, month, day, and film rating
-- similar to exercise 9 but include the rating with joins
-- replace ROLLUP with CUBE
SELECT
	EXTRACT(YEAR FROM payment_date) AS Y,
    EXTRACT(MONTH FROM payment_date) AS M,
    EXTRACT(DAY FROM payment_date) AS D,
   	rating,
	SUM(amount)
FROM
	payment
INNER JOIN
	rental
ON
	payment.rental_id = rental.rental_id
INNER JOIN
	inventory
ON
	inventory.inventory_id = rental.inventory_id
INNER JOIN
	film
ON
	film.film_id = inventory.film_id
GROUP BY
    CUBE(Y, M, D, rating)
ORDER BY
	rating,
  y,
  m,
  d;