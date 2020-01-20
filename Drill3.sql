/*
DRILL 3:
Compose a SELECT statement that queries for the following information:

- Retrieve only the nutrition_type from the nutrition table that have a nutrition_cost of 600.00 or less.
*/

USE db_zooTes2

SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600