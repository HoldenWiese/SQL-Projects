/*
DRILL 2:
Compose a SELECT statement that queries for the following information:

- Retrieve all names from the species_name column that have a species_order value of 3.
*/

USE db_zooTes2

SELECT species_order FROM tbl_species WHERE species_order=3;