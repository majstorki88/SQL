#kreiranje baze
CREATE DATABASE work_testB;

#kreirenje kolona
USE work_testB;
CREATE TABLE artikal (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
						sifra CHAR(10), 
						ime char(25), 
                        proizvodjac char(25), 
                        kupovna_cena decimal(10,2), 
                        porez decimal(10,2),
                        prodajna_cena decimal (10,2), 
                        jedinica_mere char(5));
CREATE TABLE moja_firma (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
						ime CHAR(10), 
                        PIB char(25), 
                        broj_racuna int(10),
                        adresa char(25),
                        mesto int(10),
                        e_mail char(10),
                        broj_telefona char (10));
CREATE TABLE dobavljac (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
						ime CHAR(10), 
                        PIB char(25), 
                        broj_racuna int(10),
						adresa char(25),
                        mesto int(10),
                        e_mail char(10),
                        broj_telefona char (10));
CREATE TABLE magacin (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
						kod CHAR(10), 
                        ime char(25));
CREATE TABLE upit (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
						id_dobavljac INT NOT NULL,
						FOREIGN KEY (id_dobavljac) REFERENCES dobavljac(id),
                        id_artikal INT NOT NULL,
                        FOREIGN KEY (id_artikal) REFERENCES artikal(id),
                        kolicina int (5),
                        broj_upita int(10), 
                        datum_upita date,
                        rok_isporuke date);
CREATE TABLE ponuda (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
						id_upit INT NOT NULL,
                        FOREIGN KEY (id_upit) REFERENCES upit(id), 
						id_moja_firma INT NOT NULL,
                        FOREIGN KEY (id_moja_firma) REFERENCES moja_firma(id),
                        datum date,
                        cena decimal(10,2), 
                        kolicina int(10), 
                        vrednost decimal(10,2),
						porez decimal(10,2), 
                        vrednost_sa_porezom decimal (10,2),
                        srednja_prodajna_vrednost decimal (10,2));
  CREATE TABLE ugovor (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
						broj_ugovora int (10),
						id_upit INT NOT NULL,
                        FOREIGN KEY (id_upit) REFERENCES upit(id), 
						id_moja_firma INT NOT NULL,
                        FOREIGN KEY (id_moja_firma) REFERENCES moja_firma(id),
                        datum date,
                        datum_isporuke date,
                        vreme_kasnjenja date,
                        kamata decimal(10,2), 
                        cena decimal(10,2), 
                        kolicina int(10), 
                        vrednost decimal(10,2),
                        porez decimal(10,2), 
                        vrednost_sa_porezom decimal (10,2)); 
CREATE TABLE otpremnica (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
						broj_otpremnice int (10),
						id_ugovor INT NOT NULL,
                        FOREIGN KEY (id_ugovor) REFERENCES ugovor(id), 
                        datum date,
                        rok_placanja date,
                        mesto char (10),
                        cena decimal(10,2), 
                        kolicina int(10), 
                        vrednost decimal(10,2),
                        porez decimal(10,2), 
                        vrednost_sa_porezom decimal (10,2));   
CREATE TABLE faktura (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
						broj_fakture int (10),
						id_otpremnica INT NOT NULL,
                        FOREIGN KEY (id_otpremnica) REFERENCES otpremnica(id),
						id_magacin INT NOT NULL,
                        FOREIGN KEY (id_magacin) REFERENCES magacin(id),
                        datum_otpreme date,
                        nacin_otpreme char (10),
                        nacin_placanja char (10),
                        poresko_oslobadjanje char (10)); 
CREATE TABLE prijemnica (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
						broj_prijemnice int (10),
						id_faktura INT NOT NULL,
                        FOREIGN KEY (id_faktura) REFERENCES faktura(id),
                        cena decimal(10,2), 
                        kolicina int(10), 
                        vrednost decimal(10,2),
                        porez decimal(10,2), 
                        vrednost_sa_porezom decimal (10,2));
CREATE TABLE zapisnik (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
						broj_zapisnika int (10),
						id_prijemnica INT NOT NULL,
                        FOREIGN KEY (id_prijemnica) REFERENCES prijemnica(id), 
                        clanovi char (50),
                        nalaz text (1000),
                        misljenje text (1000),
                        datum date,
                        mesto char (10)); 
CREATE TABLE reklamacija (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
						broj_reklamacije int (10),
						id_zapisnik INT NOT NULL,
                        FOREIGN KEY (id_zapisnik) REFERENCES zapisnik(id), 
                        razlog text (1000),
                        datum date,
                        mesto char (10)); 
CREATE TABLE urgencija (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
						broj_urgencije int (10), 
						id_reklamacija INT NOT NULL,
                        FOREIGN KEY (id_reklamacija) REFERENCES reklamacija(id),
                        razlog text (1000),
                        datum date,
                        mesto char (10)); 

