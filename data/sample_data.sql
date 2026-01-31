-- Sample data for retail sales analysis

INSERT INTO customers VALUES
(1,'Amit Sharma','Consumer','Delhi','Delhi','India','North'),
(2,'Neha Verma','Corporate','Mumbai','Maharashtra','India','West'),
(3,'Rahul Singh','Consumer','Bangalore','Karnataka','India','South'),
(4,'Pooja Mehta','Home Office','Ahmedabad','Gujarat','India','West'),
(5,'Ankit Kumar','Corporate','Patna','Bihar','India','East');

INSERT INTO products VALUES
(101,'Office Chair','Furniture','Chairs'),
(102,'Study Table','Furniture','Tables'),
(103,'Printer','Technology','Machines'),
(104,'Notebook','Office Supplies','Paper'),
(105,'Pen Set','Office Supplies','Accessories');

INSERT INTO orders VALUES
(1001,'2024-01-10',1),
(1002,'2024-01-15',2),
(1003,'2024-02-05',3),
(1004,'2024-02-18',4),
(1005,'2024-03-01',5);

INSERT INTO order_items VALUES
(1,1001,101,2,15000,2000),
(2,1001,104,5,500,150),
(3,1002,103,1,22000,3500),
(4,1002,105,10,800,200),
(5,1003,102,1,12000,1800),
(6,1003,104,8,800,250),
(7,1004,101,1,7500,900),
(8,1004,105,6,480,120),
(9,1005,103,1,21000,3200),
(10,1005,104,4,400,100);
