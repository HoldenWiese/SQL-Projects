/*
DRILL 5:
Compose a SELECT statement that queries for the following information:

- Retrieve all names within the species_name column using the alias "Species Name:" from the species table and their corresponding nutrition_type under the alias "Nutrition Type:" from the nutrition table.
*/

USE db_zooTes2

SELECT 
	a1.species_name AS 'Species Name', 
	a2.nutrition_type AS 'Nutrition Type'
	FROM tbl_species a1
	INNER JOIN tbl_nutrition a2 ON a2.nutrition_id = a1.species_nutrition
 


