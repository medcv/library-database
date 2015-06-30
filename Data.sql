INSERT INTO library.tbl_author (authorName) values ('Jon');
INSERT INTO library.tbl_author (authorName) values ('ALi');
INSERT INTO library.tbl_author (authorName) values ('Micheal');
INSERT INTO library.tbl_author (authorName) values ('Alex');

INSERT INTO library.tbl_publisher (publisherName, publisherAddress, publisherPhone) values ('CNN', 'USA', 5555551111);
INSERT INTO library.tbl_publisher (publisherName, publisherAddress, publisherPhone) values ('BBC', 'UK', 123123123);
INSERT INTO library.tbl_publisher (publisherName, publisherAddress, publisherPhone) values ('Gotaland', 'Sweden', 4664644646);
INSERT INTO library.tbl_publisher (publisherName, publisherAddress, publisherPhone) values ('GP', 'Sweden', 4544544545);

INSERT INTO library.tbl_book (title, authId, pubId) values ('Java', 1, 1);
INSERT INTO library.tbl_book (title, authId, pubId) values ('C++', 2, 2);
INSERT INTO library.tbl_book (title, authId, pubId) values ('NodeJS', 3, 3);
INSERT INTO library.tbl_book (title, authId, pubId) values ('MySQL', 1, 2);
INSERT INTO library.tbl_book (title, authId, pubId) values ('C#', 2, 4);

INSERT INTO library.tbl_library_branch (branchName, branchAddress) values ('Burke', 'USA');
INSERT INTO library.tbl_library_branch (branchName, branchAddress) values ('Chalmers', 'Sweden');
INSERT INTO library.tbl_library_branch (branchName, branchAddress) values ('KTH', 'Sweden');
INSERT INTO library.tbl_library_branch (branchName, branchAddress) values ('FairFax', 'USA');

INSERT INTO library.tbl_borrower (cardNo, name, address, phone) values (1234, 'Daniel', 'Sweden', 1112223333);
INSERT INTO library.tbl_borrower (cardNo, name, address, phone) values (1235, 'Mahdieh', 'Sweden', 111222444);
INSERT INTO library.tbl_borrower (cardNo, name, address, phone) values (1236, 'Amir', 'UK', 2223335555);

INSERT INTO library.tbl_book_copies (bookId, branchId, noOfCopies) values (1, 1, 10);
INSERT INTO library.tbl_book_copies (bookId, branchId, noOfCopies) values (1, 2, 10);
INSERT INTO library.tbl_book_copies (bookId, branchId, noOfCopies) values (1, 3, 10);
INSERT INTO library.tbl_book_copies (bookId, branchId, noOfCopies) values (1, 4, 10);
INSERT INTO library.tbl_book_copies (bookId, branchId, noOfCopies) values (2, 1, 20);
INSERT INTO library.tbl_book_copies (bookId, branchId, noOfCopies) values (3, 2, 20);
INSERT INTO library.tbl_book_copies (bookId, branchId, noOfCopies) values (4, 3, 20);

INSERT INTO library.tbl_book_loans (bookId, branchId, cardNo, dateOut, dueDate) values (1, 3, 1234, '2015-06-30', '2015-07-30' );





