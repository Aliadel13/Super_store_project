create schema super_store;

CREATE TABLE orders (
    row_id INT ,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    order_delivery_days INT,
    order_month_year VARCHAR(10),
    year INT,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(20),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales varchar(50),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);

LOAD DATA INFILE 'E:/Analysis projects/super_store/Superstore.csv' 
INTO TABLE orders 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;