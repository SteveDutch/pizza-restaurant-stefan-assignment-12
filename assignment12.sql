CREATE TABLE customers (
	customer_id INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(100),
    customer_tel VARCHAR(14),
    PRIMARY KEY (customer_id)
    );



 CREATE TABLE orders (
    order_id INT NOT NULL AUTO_INCREMENT,
    order_time DATETIME,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
    ON DELETE NO ACTION,
    PRIMARY KEY (order_id)
);
 
    -- untested way to add foreignkey after table is created
    -- ALTER TABLE orders
    -- ADD COLUMN customer_id INT NOT NULL;  
    -- ALTER TABLE orders
    -- ADD FOREIGN KEY (customer_id) REFERENCES customers (customer_id);
    
CREATE TABLE pizzas (
	pizza_id INT NOT NULL AUTO_INCREMENT,
    pizza_name VARCHAR(100),
    pizza_price DEC(5,2),
    PRIMARY KEY (pizza_id)
    );

CREATE TABLE pizzas_orders (
	pizza_id INT NOT NULL,
	order_id INT NOT NULL,
    FOREIGN KEY (pizza_id) REFERENCES pizzas (pizza_id),
    FOREIGN KEY (order_id) REFERENCES orders (order_id)
    ON DELETE NO ACTION
);

INSERT INTO customers (customer_name, customer_tel) 
	VALUES ("John Doe", "226-555-4982"), ("Trevor Page", "226-555-4982");
    
INSERT INTO pizzas (pizza_name, pizza_price)
	VALUES ("Pepperoni & Cheese", 7.99), ("Vegetarian", 9.99), ("Meat Lovers", 14.99), ("Hawaiian", 12.99);
    
INSERT INTO orders (order_time, customer_id)
	VALUES ("2014-10-09 09:47:00", 2), ("2014-10-09 13:20:00", 1), ("2014-10-09 09:47:00", 2);
    
INSERT INTO pizzas_orders (order_id, pizza_id)
	VALUES (1,1), (1,3),(2,2), (2,3), (2,3), (3,3), (3,4);


 CREATE SCHEMA assi12;


SELECT* FROM customers;
SELECT* FROM pizzas;
SELECT* FROM pizzas_orders;
SELECT* FROM orders;
SHOW FULL COLUMNS FROM customers;
SHOW FULL COLUMNS FROM orders;