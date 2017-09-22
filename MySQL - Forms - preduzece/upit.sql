CREATE VIEW `upit` AS SELECT dobavljac.e_mail, artikal.sifra, artikal.ime, artikal.proizvodjac, kolicina, broj_upita, datum_upita, rok_isporuke FROM upit
JOIN dobavljac ON upit.id_dobavljac=dobavljac.id 
JOIN artikal ON upit.id_artikal=artikal.id;