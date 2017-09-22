# Napraviti popisnu listu proizvoda za bilo koji magacin koja će sadržati redni broj, 
# šifru, naziv proizvoda, jedinicu mere i tarifnu grupu poreza za bilo koji magacin
SELECT product.id, product.code, product.name, product.unit_of_measure, product.tax, warehouse.name AS warehouse FROM product
JOIN invoice_item ON invoice_item.id_product=product.id 
JOIN invoice ON invoice.id=invoice_item.id_invoice
JOIN warehouse ON warehouse.id=invoice.id_warehouse
GROUP BY warehouse, name;