#kreiranje baze
CREATE DATABASE work_test;

#kreirenje kolona
USE work_test;
CREATE TABLE work_test.product (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
						code CHAR(10), 
						name char(25), 
                        manufacturer char(25), 
                        purchase_price decimal(10,2), 
                        tax decimal(10,2),
                        sales_price decimal (10,2), 
                        unit_of_measure char(5));
CREATE TABLE work_test.partner (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
						code CHAR(10), 
                        name char(25), 
                        vat_number int(10), 
                        identification_number char(10));
CREATE TABLE work_test.warehouse (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
						code CHAR(10), 
                        name char(25));
CREATE TABLE work_test.invoice (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
						id_partner INT NOT NULL,
						FOREIGN KEY (id_partner) REFERENCES partner(id),
                        id_warehouse INT NOT NULL,
                        FOREIGN KEY (id_warehouse) REFERENCES warehouse(id), 
                        invoice_number int(10), 
                        invoice_date date);
CREATE TABLE work_test.invoice_item (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
						id_invoice INT NOT NULL,
                        FOREIGN KEY (id_invoice) REFERENCES invoice(id), 
						id_product INT NOT NULL,
                        FOREIGN KEY (id_product) REFERENCES product(id), 
                        price decimal(10,2), 
                        quantity int(10), 
                        value decimal(10,2),
						tax decimal(10,2), 
                        value_with_tax decimal (10,2),
                        average_purchase_price decimal (10,2));
#unos podataka u tabele
INSERT INTO work_test.product (code, name, manufacturer, purchase_price, unit_of_measure) 
			VALUES ('BSJR2213', 'APPLE', 'VOCAR PETROVARADIN', '44.32', 'KOM'), 
					('ASAQ4366', 'BANANA', 'BANANA DOO GREECE', '56.48', 'KOM'), 
					('MNJK8726', 'PINEAPPLE', 'MIS SPAIN', '76.46', 'KOM');

INSERT INTO work_test.partner (code, name, vat_number, identification_number) 
			VALUES ('KKJDUEYG', 'PIJACA BEOGRAD', '0654855688', '299-348-11'), 
					('MDJHDJGG', 'FUTOSKA PIJACA', '0659951114', '1000-02-1'), 
					('ORITKSGU', 'LIMAN PIJACA', '0695584441', '324-212-32'); 

INSERT INTO work_test.warehouse (code, name) 
			VALUES ('NS100', 'FUTOG'), 
					('BGOO1','NOVI BEOGRAD'), 
					('NI191', 'NIS');
                    
INSERT INTO work_test.invoice (id_partner, id_warehouse, invoice_number, invoice_date) 
			VALUES ('1', '2', '1151588', '2017-05-20'), 
					('1', '2', '25457777', '2017-05-12'), 
					('2', '3', '54547777', '2017-05-14');

INSERT INTO work_test.invoice_item (id_invoice , id_product, price, quantity)
			VALUES ('1', '3', '44.32', '100'), 
					('2', '3', '90.64', '1000'), 
					('3', '2', '80.55', '2000');

