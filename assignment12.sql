CREATE DATABASE restaurant_assignment12_pizza_orders;

-- create tables --

CREATE TABLE customers (
    customer_id INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(100),
    customer_tel VARCHAR(25),
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
 
  CREATE TABLE pizzas (
	pizza_id INT NOT NULL AUTO_INCREMENT,
    pizza_name VARCHAR(100),
    pizza_price DEC(5,2),
    PRIMARY KEY (pizza_id)
    );

CREATE TABLE pizzas_orders (
	pizza_id INT NOT NULL,
	order_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (pizza_id) REFERENCES pizzas (pizza_id) ON DELETE NO ACTION,
    FOREIGN KEY (order_id) REFERENCES orders (order_id) ON DELETE NO ACTION
	);

-- fill up tables with orders data --

INSERT INTO customers (customer_name, customer_tel) 
	VALUES ("John Doe", "226-555-4982"), ("Trevor Page", "226-555-4982");
    
INSERT INTO pizzas (pizza_name, pizza_price)
	VALUES ("Pepperoni & Cheese", 7.99), ("Vegetarian", 9.99), ("Meat Lovers", 14.99), ("Hawaiian", 12.99);
    
INSERT INTO orders (order_time, customer_id)
	VALUES ("2014-10-09 09:47:00", 2), ("2014-10-09 13:20:00", 1), ("2014-10-09 09:47:00", 2);
    
INSERT INTO pizzas_orders (order_id, pizza_id, quantity)
	VALUES (1,1,1), (1,3,1), (2,2,1), (2,3,2), (3,3,1), (3,4,1);

-- Q4: how much money has each individual customer spent? --
SELECT customer_name, sum(quantity * pizza_price) AS total_spent FROM pizzas_orders piors 
	LEFT JOIN pizzas p ON p.pizza_id = piors.pizza_id
    LEFT Join orders o ON o.order_id = piors.order_id 
    LEFT JOIN customers c ON c.customer_id = o.customer_id
    GROUP BY customer_name;
    
-- Q5: how much money has each individual customer spent on which date?--
SELECT customer_name, CONVERT(order_time, DATE) AS order_date , sum(quantity * pizza_price) AS total_spent FROM pizzas_orders piors 
    LEFT JOIN pizzas p ON p.pizza_id = piors.pizza_id
    LEFT Join orders o ON o.order_id = piors.order_id 
    LEFT JOIN customers c ON c.customer_id = o.customer_id
    GROUP BY customer_name, order_date 
    ORDER BY  total_spent, order_date;
    
-- testing area --
DESCRIBE pizzas_orders;
SELECT* FROM customers
	GROUP BY customer_id;
SELECT* FROM pizzas
	GROUP BY pizza_id;
SELECT* FROM pizzas_orders
	order BY order_id;
SELECT* FROM orders;
SHOW FULL COLUMNS FROM customers;
SHOW FULL COLUMNS FROM orders;
SHOW VARIABLES LIKE 'sql_mode';