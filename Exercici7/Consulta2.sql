use Exercici7;
select t.NumFac as Factura, t.Data as Data, t.HoraVenta as Hora, e.Nom as Empleat, SUM(lt.Import*p.IVA)
from Tickets as t, Empleat as e, LiniaTicket as lt, Producte as p
where Empleat_idEmpleat and idTickets=Tickets_idTickets and idProducte=Producte_idProducte
Group by t.NumFac, t.Data, t.HoraVenta, e.Nom;