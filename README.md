# sharaf-DBdesign

## Introduction
In this project, I will use my database design and development skills to help reorganize spreadsheet data into a database that supports an online grocery business as they expand their offerings.
### Project Scenario
Greenspot Grocer is a (fictional) small, family-owned online grocery store that is growing rapidly and planning a major expansion. They are currently storing their product data in a spreadsheet format that has become unwieldy and will soon be unable to accommodate their growing inventory. 
They have requested me as a data analyst, to examine their current data and design a relational database that will provide the ability to organize and store current data, while providing scalability as the business expands its product offerings. 
### Project Objectives
1.	Examine the current data and reorganize it into relational tables using the modeling tool in MySQL Workbench. 
2.	Create and load the database with the sample data provided. 
3.	Test the database design and verify the design by generating SQL JOIN queries. 

## Approach
### Design a Relational Database
For this task I carefully reviewed the grocery store data in the GreenspotDataset.csv file provided. Looking for fields that should be stored together in tables.
I identified and formed 4 tables namely: product, purchase, sales and supplier. I also created relationships between the tables considering my understanding of the business process.
This information has been put together in my model design using MySQL Workbench.
![image](https://github.com/sharafng/sharaf-DBdesign/assets/48239466/3c890360-fbb9-4166-8886-a0c26d266530)
The above EER (Extended Entity-Relationship) Diagram includes: 
- A table object for each table including:
-- The table name
-- Fields listed – each with a field name and applicable datatype 
-- One or more fields marked as primary key(s) 
-- A foreign key, where applicable
- Connectors between related tables 

### Build Database Tables 
After completing the database design, I needed to create the database in MySQL Workbench and generate the tables that I have included in the EER diagram. 
To do that, I used the Forward Engineer option from the Database menu to create the database and tables from my EER diagram. 
Now I have a new schema -- green_spot that includes all the tables, fields, primary keys, and foreign keys I designated in my data model (EER diagram). 
![image](https://github.com/sharafng/sharaf-DBdesign/assets/48239466/ccfb3e87-5a26-492b-bac3-9f6c9cc13bc3)
### Load Database Tables with Sample Data 
I worked through each row of the sample data in the .csv file, keying the data into the appropriate tables/fields in my green_spot database. After entering a row or 2, I tried to apply the changes to see if my database will accept it, thereby testing that each field’s data is appropriate for its defined datatype.
Occasionally, I faced some challenges especially with date entry, which I figured out the entry format as ‘yyyy-mm-dd’ and also null values entry for the customer_id. I had initially created a separate table for customers though the only information available for customer is the code. But when I entered customer_id data into the sales table, there was an error because primary key (though foreign key in this table) cannot have null values. Therefore, I decided to keep customer_code as a field in the sales table with null values acceptable.
### Test the Database Design using SQL Queries 
The main goal here is to prove that the tables and their relationships can allow the retrieval of data from all the tables in the database. Typically, this is done through the use of SQL JOIN queries. 

-- This query displays the product details of the products purchased on 2022-02-10 from Freshness, Inc.
SELECT product.product_id, product.description, product.product_type, purchase.purchase_date, supplier.supplier_name, purchase.quantity, purchase_price 
FROM product
INNER JOIN purchase
ON product.product_id = purchase.product_id
INNER JOIN supplier
ON purchase.supplier_id = supplier.supplier_id
WHERE supplier.supplier_id = 678 AND purchase_date = '2022-02-10';

-- This query displays how many customers that bought all the produce supplied by Ruby Redd Produce, LLC
SELECT sales.sales_date, product.product_id, product.description, product.product_type, sales.quantity, sales.sales_price, 
sales.customer_code customer, supplier.supplier_name supplier
FROM sales inner join product
ON sales.product_id = product.product_id
INNER JOIN supplier
ON product.supplier_id = supplier. supplier_id
WHERE supplier.supplier_id = 567;

-- This query calculates the profit made from each product sold
SELECT sales.sales_date, product.product_id, product.description, product.product_type, supplier.supplier_name, 
sales.quantity AS qty_sold, sales.sales_price, purchase.purchase_price, 
(sales.quantity * sales.sales_price) AS sales_amount, 
(sales.quantity * purchase.purchase_price) AS purchase_amount, 
(sales.quantity * sales.sales_price)-(sales.quantity * purchase.purchase_price) AS profit
FROM  sales INNER JOIN product ON sales.product_id = product. product_id
INNER JOIN purchase ON product.product_id = purchase.product_id
INNER JOIN supplier ON product.supplier_id = supplier.supplier_id
ORDER BY profit DESC

## Conclusions 
In conclusion, a well-designed database creation is key for efficient storage and management of large amounts of data in any organization. A structured database design process ensures that the database meets the specific needs of the organization and is optimized for performance. I have adopted these steps in creating a database design process which include analyzing stakeholder’s requirements, identifying entities and relationships, normalizing data, creating a data model, and implementing the database.
The first step of analyzing requirements involves understanding the data requirements of Green spot grocer, including what data needs to be stored and how it will be used. Identifying the tables and how they are related is crucial in defining the structure of the database, and normalization helps to ensure data consistency and reduce redundancy. Creating a data model helps to visualize the database structure and the relationships between the data entities. Finally, implementing the database involves the actual creation of the database structure and populating it with data. Though, Its not that simple but with continuous practice, I know I’ll get better.
These steps can be utilized to create a database design process that meets the specific needs of any organization and ensures its optimal performance, which can lead to improved operational efficiency, better decision-making, and ultimately, business growth. 
