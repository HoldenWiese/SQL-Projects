/*
DRILL 6:
Compose a SELECT statement that queries for the following information:

- From the specialist table, retrieve the first and last name and contact number of those that provide care for the penguins from the species table.
*/

USE db_zooTes2

SELECT 
	a1.species_name AS 'Species Name',
	a2.care_specialist AS 'Care Specialist',
	a3.specialist_fname AS 'First Name', a3.specialist_lname AS 'Last Name', a3.specialist_contact AS 'Phone Number'
	FROM tbl_species a1
	INNER JOIN tbl_care a2 ON a2.care_id = a1.species_care
	INNER JOIN tbl_specialist a3 ON a3.specialist_id = a2.care_specialist
	WHERE species_name = 'penguin'
