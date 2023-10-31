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
