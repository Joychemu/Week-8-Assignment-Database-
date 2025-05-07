-- Week 8 Assignment Database: LibraryManagement

-- CREATE DATABASE LibraryManagement
CREATE DATABASE LibraryManagement;
USE LibraryManagement;

-- Create Authors Table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE
);

-- Create Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    ISBN VARCHAR(13) UNIQUE NOT NULL,
    YearOfPublication INT,
    Genre VARCHAR(50),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create Members Table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Address VARCHAR(255),
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Create BooksAuthors Table
CREATE TABLE BooksAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create Loans Table
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    CheckoutDate DATE NOT NULL,
    DueBack DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);




-- INSERT INTO Authors Table
INSERT INTO Authors (AuthorID, FirstName, LastName, DateOfBirth)
VALUES (1, 'J.K. George', 'Chege', '1965-07-31');
INSERT INTO Authors (AuthorID, FirstName, LastName, DateOfBirth) 
VALUES (2, 'George R. R. Martin', 'Martin', '1948-09-20');

-- INSERT INTO Books Table
INSERT INTO Books (BookID, Title, ISBN, YearOfPublication, Genre, AuthorID) 
VALUES (1, 'Harry Potter and the Philosopher\'s Stone', '978- Bloomsbury-ISBN', 1997, 'Fantasy', 1);
INSERT INTO Books (BookID, Title, ISBN, YearOfPublication, Genre, AuthorID) 
VALUES (2, 'A Game of Thrones', '979- Bloomsbury-ISBN', 1999, 'Gaming', 2);

-- INSERT INTO Members Table
INSERT INTO Members (MemberID, FirstName, LastName, DateOfBirth, Address, Email) VALUES (1, 'Hermione', 'Granger', '2001-09-19', 'Hogwarts School', 'hermione.granger@hogwarts.edu'); 
INSERT INTO Members (MemberID, FirstName, LastName, DateOfBirth, Address, Email) VALUES (2, 'John', 'Doe', '1990-01-01', '123 Anywhere St', 'johndoe@example.com');

-- INSERT INTO BookAuthors Table ( Many to Many Relationships) Book 1 (Harry Potter) is by Author 1 (J.K. George) and Author 2 (George R. R. Martin for diversity) 
INSERT INTO BooksAuthors (BookID, AuthorID) 
VALUES (1, 1); 
INSERT INTO BooksAuthors (BookID, AuthorID) 
VALUES (1, 2);
    
-- INSERT INTO Loans Table (tracking book borrowings by members)
INSERT INTO Loans (LoanID, MemberID, BookID, CheckoutDate, DueBack) 
VALUES (1, 1, 1, '2023-01-01', '2023-01-15'); -- Member 1 borrows Book 1 
INSERT INTO Loans (LoanID, MemberID, BookID, CheckoutDate, DueBack) 
VALUES (2, 2, 2, '2023-01-02', '2023-01-16'); -- Member 2 borrows Book 2

