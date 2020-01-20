/*
Assignment Requirements

1. Create a database with two tables. 
2. Assign a foreign key constraint on one table that shares related data with the primary key on the second table. 
3. Finally, create a statement that queries data from both tables.

If you need advice...
How about a table with a first and last name column and a second table that has a phone number and address column?

When submitting DRILL 7 be sure to include the table creation code along with your INSERT statements and query.
*/

/*Step 1: Run the line below exclusively to create the database.*/
CREATE DATABASE db_drill7

/*Step 2: Run the rest of the code. (Delete line 15 and execute)*/
USE db_drill7

CREATE TABLE tbl_contact (
	id_contact INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	phone_contact VARCHAR(12) NOT NULL,
	street_contact VARCHAR(75) NOT NULL
)
/*Putting this table second to avoid compilation error where foreign key reference does not exist yet.*/
CREATE TABLE tbl_names (
	id_name INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	fname_name VARCHAR(60) NOT NULL,
	lname_name VARCHAR(30) NOT NULL,
	/*Assigning foreign key constraint to contact table.*/
	contact_id_name INT NOT NULL CONSTRAINT fk_id_contact FOREIGN KEY REFERENCES tbl_contact(id_contact) ON UPDATE CASCADE ON DELETE CASCADE,
)
/*Populating tables*/
INSERT INTO tbl_contact
	(phone_contact, street_contact)
		VALUES
			('123-456-7890', '100 N Temple'),
			('234-567-8901', '200 S State'),
			('345-678-9012', '300 W Main'),
			('456-789-0123', '400 E Road'),
			('567-890-1234', '500 N Timp')

INSERT INTO tbl_names
	(fname_name, lname_name, contact_id_name)
		VALUES
			('holden', 'wiese', 100),
			('bob', 'banjo', 101),
			('kate', 'roberts', 102),
			('john', 'cash', 103),
			('hadden', 'wiese', 104)

/*Including these tables for reference*/
SELECT * FROM tbl_names
SELECT * FROM tbl_contact

/*Step 3. Querying data from both tables*/
SELECT a1.fname_name, a1.lname_name, a2.phone_contact, a2.street_contact 
	FROM tbl_names a1
		INNER JOIN tbl_contact a2 ON a2.id_contact = a1.contact_id_name
			WHERE fname_name = 'holden'

