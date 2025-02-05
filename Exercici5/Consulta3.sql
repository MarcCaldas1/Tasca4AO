use Exercici5;
Select *
from Cita, Client, Empleat, Vehicle
where Client.idClient=Vehicle.Client_idClient and Vehicle.idVehicle=Cita.Vehicle_idVehicle and Empleat.idEmpleat=Cita.Empleat_idEmpleat;