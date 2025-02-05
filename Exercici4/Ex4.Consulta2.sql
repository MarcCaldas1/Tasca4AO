use Exercici4;
SELECT Client.DNI as "DNI", Client.Nom as "Nom", Client.Cognoms as "Cognoms", Polissa.NumPolissa as "Número de la Pòlissa", TipusPolissa.Nom as "Tipus Pòlissa"
From Client, Polissa, TipusPolissa
Where Client.idClient=Polissa.Client_idClient and TipusPolissa.idTipusPolissa=Polissa.TipusPolissa_idTipusPolissa and TipusPolissa.Nom like "%Viatge%"