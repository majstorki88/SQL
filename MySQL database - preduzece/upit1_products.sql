# Napisati sql upit kojim će se prikazati prodati artikli iz tekuće godine od najprodavanijeg do najmanje prodavanog grupisano po magacinima.
SELECT product.name,SUM(invoice_item.average_purchase_price) AS total_price, warehouse.name AS warehouse FROM product 
JOIN invoice_item ON invoice_item.id_product=product.id 
JOIN invoice ON invoice.id=invoice_item.id_invoice 
JOIN warehouse ON warehouse.id=invoice.id_warehouse WHERE invoice.invoice_date<'2018-00-00' AND invoice.invoice_date>'2016-12-31' 
GROUP BY product.name, warehouse.name
ORDER BY total_price DESC;