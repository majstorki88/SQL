# Napraviti spisak izdatih faktura po mesecima – Januar, Februar, Mart,..., Decembar
SELECT invoice.id, invoice.invoice_number AS number, invoice_date FROM invoice WHERE invoice.invoice_date LIKE '2%01%';
SELECT invoice.id, invoice.invoice_number AS number, invoice_date FROM invoice WHERE invoice.invoice_date LIKE '2%02%';
SELECT invoice.id, invoice.invoice_number AS number, invoice_date FROM invoice WHERE invoice.invoice_date LIKE '2%03%';
SELECT invoice.id, invoice.invoice_number AS number, invoice_date FROM invoice WHERE invoice.invoice_date LIKE '2%04%';
SELECT invoice.id, invoice.invoice_number AS number, invoice_date FROM invoice WHERE invoice.invoice_date LIKE '2%05%';
SELECT invoice.id, invoice.invoice_number AS number, invoice_date FROM invoice WHERE invoice.invoice_date LIKE '2%06%';
SELECT invoice.id, invoice.invoice_number AS number, invoice_date FROM invoice WHERE invoice.invoice_date LIKE '2%07%';
SELECT invoice.id, invoice.invoice_number AS number, invoice_date FROM invoice WHERE invoice.invoice_date LIKE '2%08%';
SELECT invoice.id, invoice.invoice_number AS number, invoice_date FROM invoice WHERE invoice.invoice_date LIKE '2%09%';
SELECT invoice.id, invoice.invoice_number AS number, invoice_date FROM invoice WHERE invoice.invoice_date LIKE '2%10%';
SELECT invoice.id, invoice.invoice_number AS number, invoice_date FROM invoice WHERE invoice.invoice_date LIKE '2%11%';
SELECT invoice.id, invoice.invoice_number AS number, invoice_date FROM invoice WHERE invoice.invoice_date LIKE '2%12%';