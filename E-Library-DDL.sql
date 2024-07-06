-- libraries
CREATE TABLE libraries (
	library_id serial PRIMARY KEY,
	library_name varchar(255) NOT NULL,
	library_address TEXT NOT NULL
);

-- book_details
CREATE TABLE book_details (
	book_id serial PRIMARY KEY,
	title varchar(255) NOT NULL,
	author varchar(255) NOT NULL,
	book_category_id int NOT NULL
		REFERENCES book_category(book_category_id)
);

-- book_library
CREATE TABLE book_library (
	book_library_id serial PRIMARY KEY,
	book_id int NOT NULL
		REFERENCES book_details(book_id),
	library_id int NOT NULL
		REFERENCES libraries(library_id),
	qty_avail int NOT NULL CHECK(qty_avail >= 0)
);

-- book_category
CREATE TABLE book_category (
	book_category_id serial PRIMARY KEY,
	category varchar(32) NOT NULL
);

-- users
CREATE TABLE users (
	user_id serial PRIMARY KEY,
	name varchar(255) NOT NULL,
	address TEXT NULL
);

-- borrow
CREATE TABLE borrow (
	borrow_id serial PRIMARY KEY,
	user_id int NOT NULL
		REFERENCES users(user_id),
	borrow_at timestamp NOT NULL,
	due_dates timestamp NOT NULL CHECK(due_dates = borrow_at + INTERVAL '14 Days')
);

-- borrow_details
CREATE TABLE borrow_details (
	borrow_details_id serial PRIMARY KEY,
	borrow_id int NOT NULL
		REFERENCES borrow(borrow_id),
	book_library_id int NOT NULL
		REFERENCES book_library(book_library_id),
	return_date timestamp NULL
);

-- Table Users
SELECT *
FROM users;

-- Table Libraries
SELECT *
FROM libraries l ;

-- TABLE Book_Details
SELECT *
FROM book_details bd ;

-- Table Book_Category
SELECT *
FROM book_category bc ;

-- Table Book_Library
SELECT *
FROM book_library bl ;

-- Table Borrow
SELECT *
FROM borrow b ;
		