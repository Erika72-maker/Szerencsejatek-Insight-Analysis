/*válogassuk le azokat a játékosokat, akik a promóció után többet költöttek, mint elõtte.*/

SELECT 
    t.Jatekos_ID,
    p.Promocios_kod_felhasznalva,
    SUM(CASE WHEN t.Datum < '2026-04-01' THEN t.Osszeg ELSE 0 END) AS Pre_Promocio_Koltes,
    SUM(CASE WHEN t.Datum >= '2026-04-01' THEN t.Osszeg ELSE 0 END) AS Post_Promocio_Koltes
FROM Fact_Tranzakciok t
JOIN Fact_Promociok p ON t.Jatekos_ID = p.Jatekos_ID
GROUP BY t.Jatekos_ID, p.Promocios_kod_felhasznalva
HAVING p.Promocios_kod_felhasznalva = 'Igen';