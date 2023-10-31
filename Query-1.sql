-- This query displays the product details of the products purchase on 2022-02-10 from Freshness, Inc.

SELECT product.product_id, product.description, product.product_type, purchase.purchase_date, supplier.supplier_name, 
purchase.quantity, purchase_price 
FROM product
INNER JOIN purchase
ON product.product_id = purchase.product_id
INNER JOIN supplier
ON purchase.supplier_id = supplier.supplier_id
WHERE supplier.supplier_id = 678 AND purchase_date = '2022-02-10';
