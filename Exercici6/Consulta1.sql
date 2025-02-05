use Exercici6;
select p.Nom as Nom, p.Cognoms as Cognoms, p.DNI as DNI, v.Numero as "Num vol", v.Origen as "Origen", v.Desti as Desti, r.Import as Import
from Passatger as p, Vol as v, Reserva as r
where p.idPassatgers=r.Passatger_idPassatgers and v.idVol=r.Vol_idVol;