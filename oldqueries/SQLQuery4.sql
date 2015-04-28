
SELECT Count (*) AS cnt, d.breed from Owner o INNER JOIN DogOwner do ON do.ownerID = o.ownerID INNER JOIN Dogg d ON d.dogID = do.dogID
	GROUP BY breed

SELECT * FROM Owner o INNER JOIN DogOwner do ON do.ownerID = o.ownerID INNER JOIN Dogg d ON d.dogID = do.dogID
	