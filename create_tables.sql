CREATE TABLE dbo.City
 (CityID int IDENTITY PRIMARY KEY NOT NULL,
  CityName varchar(50) NOT NULL)


  CREATE TABLE dbo.Difficulty
 (DifficultyID varchar(25) PRIMARY KEY NOT NULL)

 CREATE TABLE dbo.Providence
 (ProvidenceID int IDENTITY PRIMARY KEY NOT NULL,
  ProvidenceName varchar(50) NOT NULL)


  CREATE TABLE dbo.Roles
 (RoleID varchar(25) PRIMARY KEY NOT NULL)


 CREATE TABLE dbo.Street
 (StreetID int IDENTITY PRIMARY KEY NOT NULL,
  StreetName varchar(100) NOT NULL)

  CREATE TABLE dbo.Zip
 (ZipID int IDENTITY PRIMARY KEY NOT NULL,
  ZipCode varchar(15) NOT NULL)

  CREATE TABLE dbo.Addresses
 (AddressID int IDENTITY PRIMARY KEY NOT NULL,
  fk_StreetID int NOT NULL,
  fk_ZipID int NOT NULL,
  fk_CityID int NOT NULL,
  fk_ProvidenceID int NOT NULL,
  CONSTRAINT fk_Addresses_StreetID FOREIGN KEY (fk_StreetID) REFERENCES Street (StreetID),
  CONSTRAINT fk_Addresses_ZipID FOREIGN KEY (fk_ZipID) REFERENCES Zip (ZipID),
  CONSTRAINT fk_Addresses_CityID FOREIGN KEY (fk_CityID) REFERENCES City (CityID),
  CONSTRAINT fk_Addresses_ProvidenceID FOREIGN KEY (fk_ProvidenceID) REFERENCES Providence (ProvidenceID))
 

CREATE TABLE dbo.Venue
 (VenueID int IDENTITY PRIMARY KEY NOT NULL,
  fk_AddressID int NOT NULL
  CONSTRAINT fk_Venue_AddressID FOREIGN KEY (fk_AddressID) REFERENCES Addresses (AddressID))

  CREATE TABLE dbo.Person
 (PersonID int IDENTITY PRIMARY KEY NOT NULL,
  Fname varchar(25) NOT NULL,
  Lname varchar(25) NOT NULL,
  Email varchar(100),
  fk_AddressID int,
  fk_RoleID varchar(25) NOT NULL,
  CONSTRAINT fk_Person_RoleID FOREIGN KEY (fk_RoleID) REFERENCES Roles (RoleID),
  CONSTRAINT fk_Person_AddressID FOREIGN KEY (fk_AddressID) REFERENCES Addresses (AddressID))



  CREATE TABLE dbo.Rooms
 (RoomID int IDENTITY PRIMARY KEY NOT NULL,
  Capacity int NOT NULL,
  fk_VenueID int NOT NULL,
  CONSTRAINT fk_Rooms_VenueID FOREIGN KEY (fk_VenueID) REFERENCES Venue (VenueID))

   CREATE TABLE dbo.Vendor
 (CompanyName varchar(25) PRIMARY KEY NOT NULL,
  TableNum int NOT NULL,
  fk_PersonID int NOT NULL,
  fk_RoomID int NOT NULL,
  CONSTRAINT fk_Vendor_PersonID FOREIGN KEY (fk_PersonID) REFERENCES Person (PersonID),
  CONSTRAINT fk_Vendor_RoomID FOREIGN KEY (fk_RoomID) REFERENCES Rooms(RoomID))

  CREATE TABLE dbo.Raffle
 (Ticket int IDENTITY PRIMARY KEY NOT NULL,
  Prize varchar(25) NOT NULL,
  fk_PersonID int NOT NULL,
  fk_CompanyName varchar(25) NOT NULL,
  CONSTRAINT fk_Raffle_PersonID FOREIGN KEY (fk_PersonID) REFERENCES Person (PersonID),
  CONSTRAINT fk_Raffle_CompanyName FOREIGN KEY (fk_CompanyName) REFERENCES Vendor (CompanyName))