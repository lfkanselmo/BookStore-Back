
CREATE DATABASE bookstore_api;

USE bookstore_api;

CREATE TABLE bookcategory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE author (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(100),
    biography TEXT
);

CREATE TABLE editorial (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    country VARCHAR(100)
);

CREATE TABLE book (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    isbn VARCHAR(20),
    price DECIMAL(10, 2) NOT NULL,
    available_quantity INT NOT NULL,
    category_id INT,
    editorial_id INT,
    FOREIGN KEY (author_id) REFERENCES Author(id),
    FOREIGN KEY (category_id) REFERENCES BookCategory(id),
    FOREIGN KEY (editorial_id) REFERENCES Editorial(id)
);

CREATE TABLE customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE purchase (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id)
);

CREATE TABLE purchasedetail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    purchase_id INT,
    customer_id INT,
    book_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (purchase_id) REFERENCES Purchase(id),
    FOREIGN KEY (book_id) REFERENCES Book(id)
);

CREATE TABLE review (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    customer_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    FOREIGN KEY (book_id) REFERENCES Book(id),
    FOREIGN KEY (customer_id) REFERENCES Customer(id)
);