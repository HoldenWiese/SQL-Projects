/*Simply execute to create and populate db.*/
GO
CREATE DATABASE db_UtahPublicLibrary
GO

USE db_UtahPublicLibrary

CREATE TABLE tbl_libraryBranch (
	 branchID INT NOT NULL PRIMARY KEY IDENTITY (1,1)
	,branchName VARCHAR(50) NOT NULL
	,branchAddress VARCHAR(50) NOT NULL
)
	
CREATE TABLE tbl_publisher (
	 publName VARCHAR(50) NOT NULL PRIMARY KEY
	,publAddress VARCHAR(50) NOT NULL
	,publPhone VARCHAR (15) NOT NULL
)

CREATE TABLE tbl_borrower (
	 borrowerCardNo INT NOT NULL PRIMARY KEY IDENTITY (1,1)
	,borrowerName VARCHAR(50) NOT NULL
	,borrowerAddress VARCHAR(50) NOT NULL
	,borrowerPhone VARCHAR(15) NOT NULL
)

CREATE TABLE tbl_book (
	 bookID INT NOT NULL PRIMARY KEY IDENTITY (1,1)
	,bookTitle VARCHAR(50) NOT NULL 
	,bookPublName VARCHAR(50) NOT NULL
		CONSTRAINT fk_book_publName FOREIGN KEY REFERENCES tbl_publisher(publName) 
		ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE tbl_author (
	 bookID INT NOT NULL CONSTRAINT fk_author_bookID FOREIGN KEY REFERENCES tbl_book(bookID)
		ON UPDATE CASCADE ON DELETE CASCADE
	,authorName VARCHAR(50) NOT NULL
)

CREATE TABLE tbl_copies (
	 bookID INT NOT NULL CONSTRAINT fk_copies_bookID FOREIGN KEY REFERENCES tbl_book(bookID)
		ON UPDATE CASCADE ON DELETE CASCADE
	,branchID INT NULL CONSTRAINT fk_copies_branchID FOREIGN KEY REFERENCES tbl_libraryBranch
		ON UPDATE CASCADE ON DELETE CASCADE
	,copiesNo INT NULL
)

CREATE TABLE tbl_loans (
	 bookID INT NOT NULL CONSTRAINT fk_loans_bookID FOREIGN KEY REFERENCES tbl_book(bookID)
		ON UPDATE CASCADE ON DELETE CASCADE 
	,branchID INT NOT NULL CONSTRAINT fk_loans_branchID FOREIGN KEY REFERENCES tbl_libraryBranch(branchID)
		ON UPDATE CASCADE ON DELETE CASCADE
	,borrowerCardNo INT NOT NULL
	,loansDateOut DATE NOT NULL
	,loansDateDue DATE NOT NULL
)

INSERT INTO tbl_libraryBranch
	(branchName, branchAddress)
	VALUES
	 ('sharpstown', '100 sharp ave.')
	,('central', '200 central road')
	,('sandy', '300 roseboro rd.')
	,('salt lake city', '400 temple')
	,('millcreek', '500 highland')
	,('station', '600 station road')

INSERT INTO tbl_publisher
	(publName, publAddress, publPhone)
	VALUES
	 ('1 book publishing', '123 street', '123-456')
	,('2 book publishing', '234 main', '234-567')
	,('3 book publishing', '345 road', '345-678')
	,('4 book publishing', '456 blvd.', '456-789')
	,('5 book publishing', '567 hill', '567-890')
	,('6 book publishing', '678 street', '678-901')
	,('7 book publishing', '789 main', '789-012')
	,('8 book publishing', '890 road', '890-123')
	,('9 book publishing', '901 blvd.', '901-234')
	,('10 book publishing', '876 hill', '876-543')
	,('11 book publishing', '765 street', '765-432')
	,('12 book publishing', '654 main', '654-321')
	,('13 book publishing', '543 road', '543-210')
	,('14 book publishing', '432 blvd.', '432-109')
	,('15 book publishing', '321 hill', '321-098')

INSERT INTO tbl_book
	(bookTitle, bookPublName)
	VALUES
	 ('ulysses', '1 book publishing')
	,('the great gatsby', '2 book publishing')
	,('a portrait of the artist as a young man', '3 book publishing')
	,('lolita', '4 book publishing')
	,('brave new world', '5 book publishing')
	,('the sound and the fury', '6 book publishing')
	,('catch-22', '6 book publishing')
	,('darkness at moon', '8 book publishing')
	,('sons and lovers', '9 book publishing')
	,('the grapes of wrath', '10 book publishing')
	,('under the volcano', '11 book publishing')
	,('the way of all flesh', '12 book publishing')
	,('1984', '13 book publishing')
	,('i, claudius', '14 book publishing')
	,('to the lighthouse', '15 book publishing')
	,('an american tragedy', '5 book publishing')
	,('the heart is lonely hunter', '4 book publishing')
	,('slaughterhouse-five', '3 book publishing')
	,('invisible man', '2 book publishing')
	,('native son', '1 book publishing')
	,('the lost tribe', '3 book publishing')
	,('the shining', '2 book publishing')
	,('it', '2 book publishing')

INSERT INTO tbl_author
	(bookID, authorName)
	VALUES
	 (1, 'james joyce')
	,(2, 'f. scott fitzgerald')
	,(3, 'james joyce')
	,(4, 'vladimir nabokov')
	,(5, 'aldous huxley')
	,(6, 'william faulkner')
	,(7, 'joseph heller')
	,(8, 'arthur koestler')
	,(9, 'd.h. lawrence')
	,(10, 'john steinbeck')
	,(11, 'malcolm lowry')
	,(12, 'samuel butler')
	,(13, 'george orwell')
	,(14, 'robert graves')
	,(15, 'virginia woolf')
	,(16, 'theodore dreiser')
	,(17, 'carson mccullers')
	,(18, 'kurt vonnegut')
	,(19, 'ralph ellison')
	,(20, 'wright richard')
	,(21, 'lee mark')
	,(22, 'stephen king')
	,(23, 'stephen king')

INSERT INTO tbl_borrower
	(borrowerName, borrowerAddress, borrowerPhone)
	VALUES
	 ('alan adams', '123 hi st.', '111-2222')
	,('borris banan', '234 low rd.', '222-3333')
	,('conner coolin', '345 mid st.', '333-4444')
	,('daniel derrick', '456 brun rd.', '444-555')
	,('edmond elis', '567 lun rd.', '555-6789')
	,('franz ferd', '678 tall rd.', '666-7777')
	,('graham grow', '789 rude st,', '777-8888')
	,('holden wiese', '890 ball park', '888-9999')
	,('hadden wiese', '901 read', '777-8888')

INSERT INTO tbl_copies
	(bookID, branchID, copiesNo)
	VALUES
	 (1, 1, 3)
	,(2, 2, 2)
	,(3, 3, 5)
	,(4, 4, 1)
	,(5, 5, 3)
	,(6, 6, 4)
	,(7, 1, 8)
	,(8, 2, 5)
	,(9, 3, 2)
	,(10, 4, 3)
	,(11, 5, 0)
	,(12, 6, 3)
	,(13, 1, 2)
	,(14, 2, 5)
	,(15, 3, 3)
	,(16, 4, 1)
	,(17, 5, 1)
	,(18, 6, 2)
	,(19, 1, 4)
	,(20, 2, 1)
	,(21, 1, 1)
	,(22, 2, 3)
	,(23, 3, 10)
	,(23, 2, 5)
	,(10, 1, 3)
	,(11, 1, 3)
	,(12, 1, 4)
	,(14, 1, 5)
	,(15, 1, 8)
	,(16, 1, 9)
	,(17, 1, 3)
	,(18, 1, 5)
	,(19, 1, 7)
	,(20, 1, 8)
	,(1, 2, 2)
	,(2, 2, 3)
	,(3, 2, 4)
	,(4, 2, 2)
	,(5, 2, 7)
	,(6, 2, 8)
	,(7, 2, 9)
	,(9, 2, 3)
	,(10, 2, 4)
	,(1, 3, 5)
	,(2, 3, 3)
	,(4, 3, 5)
	,(5, 3, 4)
	,(6, 3, 8)
	,(7, 3, 3)
	,(9, 3 , 5)
	,(10, 3, 7)
	,(11, 4, 3)
	,(12, 4, 4)
	,(13, 4, 9)
	,(14, 4, 2)
	,(15, 4, 3)
	,(17, 4, 5)
	,(18, 4, 6)
	,(19, 4, 5)
	,(20, 4, 7)
	,(1, 5, 2)
	,(2, 5, 3)
	,(3, 5, 4)
	,(4, 5, 5)
	,(6, 5, 2)
	,(7, 5, 3)
	,(8, 5, 8)
	,(9, 5, 9)
	,(10, 5, 10)
	,(11, 6, 3)
	,(13, 6, 4)
	,(14, 6, 3)
	,(15, 6, 4)
	,(16, 6, 5)
	,(17, 6, 5)
	,(19, 6, 5)
	,(20, 6, 4)
	,(21, 6, 4)

INSERT INTO tbl_loans
	(bookID, branchID, borrowerCardNo, loansDateOut, loansDateDue)
	VALUES
	 (11, 1, 1, '2019-01-01', '2020-01-29')
	,(12, 1, 1, '2019-01-01', '2020-01-31')
	,(13, 1, 1, '2019-01-01', '2020-01-30')
	,(14, 1, 1, '2019-01-01', '2020-01-30')
	,(15, 1, 1, '2019-01-01', '2020-01-31')
	,(1, 2, 2, '2020-01-27', '2020-02-14')
	,(2, 2, 2, '2020-01-20', '2020-01-29')
	,(3, 2, 2, '2020-01-25', '2020-02-10')
	,(4, 2, 2, '2020-01-27', '2020-01-29')
	,(5, 2, 2, '2020-01-27', '2020-02-15')
	,(6, 3, 3, '2020-01-27', '2020-02-14')
	,(7, 3, 3, '2020-01-27', '2020-02-14')
	,(8, 3, 3, '2020-01-27', '2020-02-14')
	,(9, 3, 3, '2020-01-27', '2020-02-14')
	,(10, 3, 3, '2020-01-27', '2020-01-29')
	,(16, 1, 4, '2020-01-27', '2020-01-31')
	,(17, 1, 4, '2020-01-27', '2020-01-29')
	,(18, 1, 4, '2020-01-27', '2020-01-31')
	,(19, 1, 4, '2020-01-27', '2020-01-30')
	,(20, 1, 4, '2020-01-27', '2020-01-30')
	,(1, 5, 5, '2020-01-26', '2020-02-18')
	,(2, 5, 5, '2020-01-26', '2020-02-18')
	,(3, 5, 5, '2020-01-26', '2020-02-18')
	,(4, 5, 5, '2020-01-26', '2020-02-17')
	,(5, 5, 5, '2020-01-26', '2020-02-17')
	,(6, 5, 5, '2020-01-26', '2020-02-17')
	,(7, 5, 5, '2020-01-26', '2020-02-17')
	,(8, 5, 5, '2020-01-26', '2020-02-17')
	,(9, 5, 5, '2020-01-26', '2020-02-17')
	,(10, 5, 5, '2020-01-26', '2020-02-13')
	,(11, 4, 6, '2020-01-21', '2020-02-14')
	,(12, 4, 6, '2020-01-22', '2020-02-15')
	,(13, 4, 6, '2020-01-23', '2020-02-13')
	,(14, 4, 6, '2020-01-21', '2020-02-14')
	,(15, 4, 6, '2020-01-22', '2020-02-15')
	,(16, 4, 6, '2020-01-23', '2020-02-14')
	,(17, 4, 6, '2020-01-21', '2020-02-15')
	,(18, 4, 6, '2020-01-22', '2020-02-13')
	,(19, 4, 6, '2020-01-23', '2020-02-14')
	,(20, 4, 6, '2020-01-21', '2020-02-15')
	,(1, 2, 7, '2020-01-01', '2020-02-03')
	,(2, 2, 7, '2020-01-02', '2020-02-02')
	,(3, 2, 7, '2020-01-03', '2020-02-01')
	,(4, 2, 7, '2020-01-01', '2020-02-03')
	,(5, 2, 7, '2020-01-02', '2020-02-02')
	,(21, 6, 8, '2020-01-15', '2020-02-05')
	,(20, 6, 8, '2020-01-15', '2020-02-05')
	,(19, 6, 8, '2020-01-15', '2020-02-05')
	,(18, 6, 8, '2020-01-15', '2020-02-05')
	,(17, 6, 8, '2020-01-15', '2020-02-05')
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
	use db_UtahPublicLibrary
	select * from tbl_author
	select * from tbl_book
	select * from tbl_borrower
	select * from tbl_copies
	select * from tbl_libraryBranch
	select * from tbl_loans
	select * from tbl_publisher
