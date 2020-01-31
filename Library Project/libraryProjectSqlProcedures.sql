/*Simply execute full query to create and call all procedures*/
USE db_UtahPublicLibrary

/* 1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */
GO
CREATE PROCEDURE task1
AS
	SELECT  a1.bookTitle  AS 'Book Title'
		   ,a2.copiesNo   AS 'Copies'
		   ,a3.branchName AS 'Branch Name'
		FROM tbl_book a1
		INNER JOIN tbl_copies a2 ON a2.bookID = a1.bookID
		INNER JOIN tbl_libraryBranch a3 ON a3.branchID = a2.branchID
			WHERE a1.bookTitle = 'the lost tribe' 
			AND a3.branchName= 'sharpstown'
GO
EXEC task1

/* 2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch? */
GO
CREATE PROCEDURE task2
AS
	SELECT   a1.branchName 
			,a2.copiesNo
			,a3.bookTitle
		FROM tbl_libraryBranch a1
		JOIN tbl_copies a2 ON a2.branchID = a1.branchID
		LEFT JOIN tbl_book a3 ON a3.bookID = a2.bookID
			WHERE a3.bookTitle= 'the lost tribe'
GO
EXEC task2

/* 3.) Retrieve the names of all borrowers who do not have any books checked out. */
	/*This query returns the name of those who have a null value in the bookID of the left joined table.*/
GO
CREATE PROCEDURE task3
AS
	SELECT a1.borrowerName AS 'Name'
		FROM tbl_borrower a1
		LEFT JOIN tbl_loans a2 ON a2.borrowerCardNo = a1.borrowerCardNo
			WHERE a2.bookID IS NULL
GO
EXEC task3
/*This procedure uses a sub query to get the names of all those whose Card Number is counted 0 times on the tbl_loans table.*/
GO
CREATE PROCEDURE task3b
AS
	SELECT borrowerName AS 'Borrower with no Loans' 
		FROM tbl_borrower a1
			WHERE 
				(SELECT COUNT(*) FROM tbl_loans a2 WHERE a2.borrowerCardNo = a1.borrowerCardNo) = 0
GO
EXEC task3b

/*4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.*/
GO
CREATE PROCEDURE task4
AS
	SELECT a2.bookTitle, a3.borrowerName, a3.borrowerAddress FROM tbl_loans a1
		INNER JOIN tbl_book a2 ON a2.bookID = a1.bookID
		INNER JOIN tbl_borrower a3 ON a3.borrowerCardNo = a1.borrowerCardNo
			WHERE branchID = 1
			AND loansDateDue = convert(varchar, getdate(), 23)
GO
EXEC task4

/*5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.*/
GO
CREATE PROC task5
AS
	SELECT branch.branchName, COUNT(*) AS TotalLoans 
		FROM tbl_loans as loans
		JOIN tbl_libraryBranch branch ON branch.branchID = loans.branchID
			GROUP BY branch.branchName
GO
EXEC task5

/*6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.*/
GO
CREATE PROC task6
AS
	SELECT a2.borrowerName, a2.borrowerAddress, COUNT(*) AS TotalLoans
		FROM tbl_loans a1  
		JOIN tbl_borrower a2 ON a2.borrowerCardNo = a1.borrowerCardNo
			GROUP BY a2.borrowerName, a2.borrowerAddress
				HAVING COUNT(*) > 5
GO
EXEC task6

/*7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".*/
GO
CREATE PROC task7
AS
	SELECT a1.bookTitle, a2.authorName, a3.copiesNo, a4.branchName
		FROM tbl_book a1
		JOIN tbl_author a2 ON a2.bookID = a1.bookID
		JOIN tbl_copies a3 ON a3.bookID = a1.bookID
		JOIN tbl_libraryBranch a4 ON a4.branchID = a3.branchID
			WHERE a4.branchName = 'central' and a2.authorName = 'stephen king'
GO
EXEC task7

/*
YOU MAY CHOOSE YOUR OWN DATA TO POPULATE YOUR TABLES AS LONG AS YOUR DATABASE ENSURES THAT THE FOLLOWING CONDITIONS ARE TRUE:
  * There is a book called 'The Lost Tribe' found in the 'Sharpstown' branch.
  * There is a library branch called 'Sharpstown' and one called 'Central'.
  * There are at least 20 books in the BOOK table.
  * There are at least 10 authors in the BOOK_AUTHORS table.
  * Each library branch has at least 10 book titles, and at least two copies of each of those titles.
  * There are at least 8 borrowers in the BORROWER table, and at least 2 of those borrowers have more than 5 books loaned to them.
  * There are at least 4 branches in the LIBRARY_BRANCH table.
  * There are at least 50 loans in the BOOK_LOANS table.
  * There must be at least two books written by 'Stephen King' located at the 'Central' branch.

	1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
    2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?
    3.) Retrieve the names of all borrowers who do not have any books checked out.
    4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.
    5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
    6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.
    7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
*/