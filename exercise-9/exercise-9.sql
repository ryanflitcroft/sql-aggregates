-- ROLLUP of amount made per year, month, day
-- use ROLLUP and EXTRACT YEAR, MONTH, DAY from payment_date
SELECT
	SUM(amount),
	EXTRACT(YEAR FROM payment_date) AS Y,
  EXTRACT(MONTH FROM payment_date) AS M,
  EXTRACT(DAY FROM payment_date) AS D
FROM
	payment
GROUP BY
	ROLLUP(Y, M, D);