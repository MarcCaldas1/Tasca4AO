use Exercici6;
select p.Nom as Nom_Passatger, p.Cognoms as Cognoms_Passatger, COUNT(r.idReserva) as Total_Reserves, SUM(r.Import) as Import_Total
from Reserva r
join Passatger p on r.Passatger_idPassatgers = p.idPassatgers
GROUP BY p.idPassatgers, p.Nom, p.Cognoms;
