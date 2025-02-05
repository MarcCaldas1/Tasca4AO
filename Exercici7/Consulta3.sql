use Exercici7;
select count(idLiniaTicket) as "Número de línies de tickets" 
from LiniaTicket as lt, Empleat as e, Tickets as t
where Empleat_idEmpleat=idEmpleat and idTickets=Tickets_idTickets and e.Nom like "B%";