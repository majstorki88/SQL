#kreiranje baze
CREATE DATABASE work_test;

#kreirenje kolona
USE work_test;
CREATE TABLE work_test.product (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
						code CHAR(10), 
						name char(25), 
                        manufacturer char(25), 
                        purchase_price decimal(10,2), 
                        tax decimal(10,2) AS (purchase_price/5),
                        sales_price decimal (10,2) AS (purchase_price + tax), 
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
                        value decimal(10,2) AS (price * quantity),
						tax decimal(10,2) AS (value/5), 
                        value_with_tax decimal (10,2) AS (tax + value),
                        average_purchase_price decimal (10,2) AS (value_with_tax / quantity));
#unos podataka u tabele
INSERT INTO product (code, name, manufacturer, purchase_price, unit_of_measure) 
			VALUES ('BSJR2213', 'JABUKA', 'VOCAR PETROVARADIN', '44.32', 'KG'), 
					('ASAQ4366', 'BANANA', 'BANANA DOO GREECE', '56.48', 'KG'), 
					('MNJK8726', 'ANANAS', 'MIS SPAIN', '76.46', 'KOM'),
                    ('KAJSD193', 'SLJIVA', 'VRSAC VINOGRADI', '46.44', 'KG'), 
					('ASDDD232', 'BRESKVA', 'SUBOTICA PALIC', '70.48', 'KG'), 
					('FDSSF435', 'KAJSIJA', 'BIH', '100.46', 'KG'),
					('VDGG5567', 'VISNJA', 'LESKOVAC', '22.32', 'KG'), 
					('GFDGHY66', 'TRESNJA', 'NISKA BANJA DOO', '89.48', 'KG'), 
					('OTRFREFR', 'BUNDEVA', 'MMC DRUGOVI', '59.46', 'KOM'),
					('FDSF4543', 'PAPRIKA', 'DVA BRATA', '68.54', 'KOM'), 
					('FDGDT666', 'KUPUS', 'TATINO POLJE', '57.67', 'KOM'), 
					('FDSFSR4R', 'PATLIDZAN', 'BRDO KIKINDA', '83.33', 'KOM');

INSERT INTO partner (code, name, vat_number, identification_number) 
			VALUES ('KKJDUEYG', 'PIJACA BEOGRAD', '0654855688', '299-348-11'), 
					('MDJHDJGG', 'FUTOSKA PIJACA', '0659951114', '1000-02-1'), 
					('ORITKSGU', 'LIMAN PIJACA', '0695584441', '324-212-32'),
                    ('KFDSJHJF', 'PIJACA NIS', '065555888','02-349-11'), 
					('KSKAJDJH', 'LESKOVAC PIJACA', '065988554', '10-0255-15'), 
					('DWWDDDGU', 'VRANJE PIJACA', '069555881', '324-432-33'); 

INSERT INTO warehouse (code, name) 
			VALUES ('NS100', 'FUTOG'), 
					('BGOO1','NOVI BEOGRAD'), 
					('NI191', 'NIS');
                    
INSERT INTO invoice (id_partner, id_warehouse, invoice_number, invoice_date) 
			VALUES  ('3', '3', '1151588', '2017-06-20'), 
					('1', '2', '25457777', '2016-03-12'), 
					('2', '3', '54535435', '2017-02-14'),
					('6', '3', '13121455', '2017-10-20'), 
					('5', '1', '25543547', '2017-02-12'), 
					('4', '3', '54547777', '2016-03-14'),
					('4', '1', '11598838', '2017-04-20'), 
					('5', '2', '25655447', '2016-06-12'), 
					('3', '3', '54546547', '2017-07-14'),
                    ('6', '1', '1151588', '2017-06-20'), 
					('4', '2', '25457777', '2016-03-12'), 
					('2', '3', '54535435', '2017-02-14'),
					('5', '2', '13121455', '2016-10-20'), 
					('1', '1', '25543547', '2017-02-12'), 
					('2', '3', '54547777', '2016-03-14'),
					('3', '2', '11598838', '2017-04-20'), 
					('6', '1', '25655447', '2016-06-12'), 
					('2', '3', '54546547', '2017-07-14');

INSERT INTO invoice_item (id_invoice , id_product, price, quantity)
			VALUES  ('1', '3', '60.52', '100'), 
					('1', '1', '70.64', '1000'), 
					('2', '2', '100.53', '1500'),
					('2', '4', '63.32', '500'), 
					('3', '5', '72.78', '700'), 
					('4', '6', '99.55', '900'),
					('5', '10', '66.72', '500'), 
					('6', '11', '74.93', '600'), 
					('6', '12', '98.56', '900'),
					('6', '11', '59.52', '100'), 
					('7', '9', '75.54', '1000'), 
					('8', '7', '10.53', '1500'),
					('9', '6', '43.42', '500'), 
					('10', '5', '74.78', '700'), 
					('10', '4', '54.55', '900'),
					('11', '4', '45.72', '500'), 
					('12', '3', '75.93', '600'), 
					('13', '2', '44.56', '900'),
                    ('14', '3', '60.52', '100'), 
					('14', '1', '70.64', '1000'), 
					('14', '8', '100.53', '1500'),
					('15', '9', '63.32', '500'), 
					('15', '10', '72.78', '700'), 
					('15', '12', '99.55', '900'),
					('16', '11', '66.72', '500'), 
					('16', '5', '74.93', '600'), 
					('16', '4', '94.56', '900'),
					('17', '6', '74.64', '1000'), 
					('17', '7', '14.53', '1500'),
					('18', '7', '44.32', '500'), 
					('18', '8', '33.78', '700'), 
					('1', '5', '55.55', '900'),
					('2', '4', '55.72', '500'), 
					('2', '6', '42.93', '600'), 
					('5', '1', '43.56', '900');

                    
 
                              
                                
                                
