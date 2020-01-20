/*
DRILL 4:
Compose a SELECT statement that queries for the following information:

- Retrieve all species_names with the nutrition_id between 2202 and 2206 from the nutrition table.
*/

USE db_zooTes2

SELECT species_name FROM tbl_species WHERE species_nutrition > 2202 AND species_nutrition < 2206
