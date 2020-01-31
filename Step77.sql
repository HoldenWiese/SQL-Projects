/*Design a stored procedure that has at least two joins and two parameters.*/

USE AdventureWorks2014
GO
CREATE PROCEDURE step77 @firstName VARCHAR(50) = '', @lastName VARCHAR(50) = ''
AS
	SELECT a1.FirstName AS 'First Name'
		, a1.LastName AS 'Last Name'
		, a2.PhoneNumber AS 'Phone Number'
		, a3.EmailAddress AS 'Email Address'
			FROM Person.Person a1
			JOIN Person.PersonPhone a2 ON a2.BusinessEntityID = a1.BusinessEntityID
			JOIN Person.EmailAddress a3 ON a3.BusinessEntityID = a1.BusinessEntityID
				WHERE a1.FirstName LIKE ISNULL(@firstName, a1.FirstName) + '%'
				AND a1.LastName LIKE ISNULL(@lastName, a1.LastName) + '%'
GO
EXEC step77 'matt', 'W'