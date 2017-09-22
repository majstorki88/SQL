# Napisati sql upit za prikaz iznosa prodaje po partnerima u tekućoj godini.
SELECT partner.name, SUM(invoice_item.average_purchase_price) AS total_price FROM partner
JOIN invoice ON invoice.id_partner=partner.id 
JOIN invoice_item ON invoice_item.id_invoice=invoice.id
WHERE invoice.invoice_date<'2018-00-00' AND invoice.invoice_date>'2016-12-31' 
GROUP BY partner.name;