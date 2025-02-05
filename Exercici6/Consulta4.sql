use Exercici6;
select r.Numero as "Número de reserva", p.Nom as Nom, p.Cognoms as Cognoms, v.Numero as "Número de vol"
from Reserva r, Passatger as p, Vol as v
where r.Passatger_idPassatgers=p.idPassatgers and r.Vol_idVol=v.idVol and r.Data="29/1/2025";