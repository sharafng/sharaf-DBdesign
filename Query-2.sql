-- this query displays how many customers that bought all the produce supplied by Ruby Redd Produce, LLC
SELECT sales.sales_date, product.product_id, product.description, product.product_type, sales.quantity, sales.sales_price, 
sales.customer_code customer, supplier.supplier_name supplier
from sales inner join product
on sales.product_id = product.product_id
inner join supplier
on product.supplier_id = supplier. supplier_id
where supplier.supplier_id = 567;
