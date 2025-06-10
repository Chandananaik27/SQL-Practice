use student;
create table studnet3(s_id int primary key,
s_name varchar(30) not null,
s_mail varchar(20) unique,
s_age int check (s_age>18),
s_city varchar(30) default 'unknown');


create table departments(
dept_id int primary key,
dept_name varchar(30) not null
);

create table employee(
emp_id int primary key,
emp_name varchar(30) not null,
emp_email varchar (20) unique,
dept_id int,
age int check(age>=18),
joining_date date,
foreign key(dept_id) references departments(dept_id)
);


select * from departments;
select * from employee;

---VIEWS---

use student;
-- Create the customer_data table
CREATE TABLE customer_data (
    cust_id INT PRIMARY KEY,  -- Assuming cust_id is the primary key
    cust_name VARCHAR(255) NOT NULL, -- Assuming customer name is required
    mail VARCHAR(255) UNIQUE,      -- Assuming email should be unique
    address VARCHAR(255),
    phone VARCHAR(20)
);

-- Insert data into the customer_data table
INSERT INTO customer_data (cust_id, cust_name, mail, address, phone) VALUES
(1, 'Alice Smith', 'alice.smith@example.com', '123 Main St, Anytown', '555-123-4567'),
(2, 'Bob Johnson', 'bob.johnson@example.com', '456 Oak Ave, Somecity', '555-987-6543'),
(3, 'Charlie Brown', 'charlie.brown@example.com', '789 Pine Ln, Othertown', '555-555-1212'),
(4, 'Diana Miller', 'diana.miller@example.com', '101 Elm Rd, Nowhere', '555-111-2222');

-- Create the product_data table
CREATE TABLE product_data (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    brand VARCHAR(255),
    price DECIMAL(10, 2)  -- Use DECIMAL for accurate currency representation
);

-- Insert data into the product_data table
INSERT INTO product_data (product_id, product_name, brand, price) VALUES
(101, 'Laptop', 'Dell', 1200.00),
(102, 'Smartphone', 'Samsung', 900.00),
(103, 'Tablet', 'Apple', 700.00),
(104, 'Wireless Mouse', 'Logitech', 25.00),
(105, 'Keyboard', 'Corsair', 75.00),
(106, 'Monitor', 'LG', 300.00);
select * from product_data;
create view order_summary as
select * from product_data
where product_id=103
select * from order_summary;

CREATE TABLE customer_data2 (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(255) NOT NULL,
    mail VARCHAR(255) UNIQUE,
    address VARCHAR(255),
    phone VARCHAR(20)
);

INSERT INTO customer_data2(cust_id, cust_name, mail, address, phone) VALUES
(1, 'Alice Smith', 'alice.smith@example.com', '123 Main St, Anytown', '555-123-4567'),
(2, 'Bob Johnson', 'bob.johnson@example.com', '456 Oak Ave, Somecity', '555-987-6543'),
(3, 'Charlie Brown', 'charlie.brown@example.com', '789 Pine Ln, Othertown', '555-555-1212');

CREATE TABLE product_data2 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    brand VARCHAR(255),
    price DECIMAL(10, 2)
);

INSERT INTO product_data2 (product_id, product_name, brand, price) VALUES
(101, 'Laptop', 'Dell', 1200.00),
(102, 'Smartphone', 'Samsung', 900.00),
(103, 'Tablet', 'Apple', 700.00);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    cust_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (cust_id) REFERENCES customer_data(cust_id),
    FOREIGN KEY (product_id) REFERENCES product_data(product_id)
);

INSERT INTO orders (order_id, cust_id, product_id, order_date, quantity) VALUES
(1, 1, 101, '2023-11-01', 1),  
(2, 1, 102, '2023-11-05', 2),  
(3, 2, 103, '2023-11-10', 1),  
(4, 2, 101, '2023-11-15', 1),  
(5, 3, 102, '2023-11-20', 3);  

CREATE VIEW customer_product_purchases AS
SELECT c.cust_name,p.product_name,COUNT(o.order_id) AS number_of_purchases,
SUM(o.quantity) AS total_quantity_purchased
FROM customer_data2 c
JOIN orders o ON c.cust_id = o.cust_id
JOIN product_data2 p ON o.product_id = p.product_id
GROUP BY
    c.cust_name, p.product_name

SELECT * FROM customer_product_purchases;