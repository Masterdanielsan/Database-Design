INSERT INTO Venue (fk_AddressID) Values ((SELECT AddressID FROM Addresses WHERE fk_StreetID=(SELECT StreetID FROM Street WHERE StreetName='10 Napa Ct.')
 AND fk_ZipID=(SELECT ZipID FROM Zip WHERE ZipCode='97355') AND fk_CityID=(SELECT CityID FROM City WHERE CityName='Lebanon') 
 AND fk_ProvidenceID=(SELECT ProvidenceID FROM Providence WHERE ProvidenceName='Oregon')))