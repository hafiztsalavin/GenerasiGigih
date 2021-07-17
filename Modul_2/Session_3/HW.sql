CREATE TABLE customer ( 
    customer_id INT(2) AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL, 
    phone VARCHAR(12) NOT NULL
)

CREATE TABLE orders( 
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL, 
    create_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE order_details ( 
    order_id INT NOT NULL,
    item_id INT NOT NULL, 
    quantity INT NOT NULL, 
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
)

INSERT INTO customer(name, phone) 
VALUES ('Budiyawan', '+6212345678'), ('Mary Jones', '+6287654321'), ('Budiyawan', '+6289753124');

INSERT INTO orders(customer_id, create_date) 
VALUES (1, '2020-10-10' ),(2, '2020-10-10' ),(3, '2020-10-10' ),(1, '2020-10-11' ),(2, '2020-10-11' );

INSERT INTO order_details(order_id, item_id, quantity) 
VALUES (1, 1, 1),(1, 2, 1),
       (2, 3, 1),(2, 4, 1),
       (3, 3, 1),(3, 8, 1),
       (4, 1, 1),(4, 2, 1),
       (5, 6, 1),(5, 4, 1);

SELECT orders.order_id as "order ID", 
    orders.create_date as "order data", 
    customer.name as "Customer Name", 
    customer.phone as "Customer Phone", 
    sum(items.price) as total
from orders 
    left join customer on orders.customer_id = customer.customer_id 
    left join order_details on orders.order_id = order_details.order_id 
    left join items on order_details.item_id = items.id
group by orders.order_id;





