SELECT film.film_id as film_id, film.title AS title, category.name AS category, film.rating AS rating
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
RIGHT JOIN film ON inventory.film_id = film.film_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON category.name = 'Horror' OR category.name = 'Sci-Fi'
WHERE inventory.film_id is null AND (film.rating = 'PG-13' OR film.rating = 'R');
