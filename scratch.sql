--1.1
select * from teilestamm;
--1.2
SELECT * FROM teilestamm WHERE bezeichnung LIKE '%City%';
--1.3
SELECT posnr, auftrnr, teilnr, anzahl*gesamtpreis as umsatz FROM Auftragsposten ORDER BY umsatz DESC LIMIT 1;
--1.4
Select count(kunde) from kunde