/* Step 55 Video */
USE db_zoo;

CREATE TABLE tbl_animalia (
animal_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
animal_type VARCHAR(50) NOT NULL
);

INSERT tbl_animalia 
	(animal_type) 
		VALUES 
			('vertabrate'), 
			('invertabrate')
			;

SELECT * FROM tbl_animalia;

CREATE TABLE tbl_class (
class_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
class_type VARCHAR(50) NOT NULL
);

INSERT INTO tbl_class
	(class_type)
		VALUES
			('bird'),
			('reptilian'),
			('mammal'),
			('arthropod'),
			('fish'),
			('worm'),
			('cnideria'),
			('echinoderm')
			;


UPDATE tbl_class SET class_type = 'bird' WHERE class_type = 'birds';

SELECT REPLACE(class_type, 'bird', 'birds') FROM tbl_class;

SELECT * FROM tbl_class;

SELECT class_type FROM tbl_class WHERE class_type = 'bird';

SELECT COUNT(class_type) FROM tbl_class WHERE class_type = 'bird';

/*End of Step 55*/



/*Step 56 Video*/
CREATE TABLE tbl_persons (
	persons_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	persons_fname VARCHAR(50) NOT NULL,
	persons_lname VARCHAR(50) NOT NULL,
	persons_contact VARCHAR(50) NOT NULL
);
/* Practicing adding new columns.
ALTER TABLE tbl_persons
ADD persons_lname VARCHAR(50) NOT NULL,
	persons_contact VARCHAR(50) NOT NULL;
*/

INSERT INTO tbl_persons
	(persons_fname, persons_lname, persons_contact)
		VALUES
			('bob', 'smith', '232-234-5678'),
			('sally', 'ann', '232-234-5678'),
			('jane', 'dow', '232-234-5678'),
			('hadden', 'wiese', '232-234-5678'),
			('holden', 'wiese', '232-234-5678')
			;


SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_id BETWEEN 2 AND 5;

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE 'wi%';

SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_fname LIKE 'h%n';


UPDATE tbl_persons SET persons_fname = 'meowman' WHERE persons_fname = 'bob';

SELECT persons_lname FROM tbl_persons ORDER BY persons_lname;

/*Using aliases*/
SELECT persons_id AS 'ID', persons_fname AS 'First Name', persons_lname AS 'Last Name', persons_contact AS 'Phone Number' FROM tbl_persons;

/*Using DELETE Statement (DML)*/
DELETE FROM tbl_persons WHERE persons_lname = 'smith';
SELECT * FROM tbl_persons;

/*Deleting a table with with DROP Statement*/
/*DROP TABLE tbl_persons;*/

/*End of Step 56*/