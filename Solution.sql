-- 1. Select all the actors with the first name ‘Scarlett’.

USE sakila;

SELECT * FROM actor
WHERE first_name = "Scarlett";

-- 2. How many films (movies) are available for rent and how many films have been rented?

-- Different movies available for rent
SELECT COUNT(DISTINCT(film_id)) FROM inventory;

-- All time rentals
SELECT COUNT(*) FROM rental;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.

SELECT MIN(length) AS min_duration, MAX(length) AS max_duration FROM film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?

SELECT TIME_FORMAT(SEC_TO_TIME(AVG(length*60)),"%H:%i") AS average_length FROM film;

-- 5. How many distinct (different) actors' last names are there?

SELECT COUNT(DISTINCT(last_name)) FROM actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?

SELECT DATEDIFF(max(last_update), min(rental_date)) AS Days_operating FROM rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.

SELECT *, MONTH(rental_date) AS rental_month, DATE_FORMAT(rental_date, "%W") AS rental_weekday,
MONTH(return_date) AS return_month, DATE_FORMAT(return_date, "%W") AS return_weekday,
MONTH(last_update) AS last_update_month, DATE_FORMAT(last_update, "%W") AS last_update_weekday
FROM rental;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *,
CASE
WHEN DATE_FORMAT(rental_date, "%w") IN (0, 7) then "Weekend"
ELSE "Weekday"
END AS "day_type"
FROM rental;

-- 9. Get release years.

SELECT title, release_year FROM film;

-- 10. Get all films with ARMAGEDDON in the title.

SELECT title FROM film
WHERE title LIKE "%ARMAGEDDON%";

-- 11. Get all films which title ends with APOLLO.

SELECT title FROM film
WHERE title REGEXP("APOLLO$");

-- 12. Get 10 the longest films.

SELECT title, length FROM film
ORDER BY length DESC
LIMIT 10;

-- 13. How many films include Behind the Scenes content?

SELECT COUNT(special_features) FROM film
WHERE special_features LIKE ("%Behind the Scenes%");