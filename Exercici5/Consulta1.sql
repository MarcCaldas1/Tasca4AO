use Exercici5;
select c.idCIta as num, c.Data as dia, c.Hora as hora, v.Marca as marca, v.Model as model, cl.Nom as Client
from Cita as c, Vehicle as v, Client as cl
where v.idVehicle=c.Vehicle_idVehicle and cl.idClient=v.Client_idClient and c.Data>"19/01/2025";