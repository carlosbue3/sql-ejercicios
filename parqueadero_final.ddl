CREATE DATABASE IF NOT EXISTS ParqueaderoDB;
USE ParqueaderoDB;


CREATE TABLE Color (
    IdCol INT PRIMARY KEY,
    Col varchar(20)
);

CREATE TABLE TipDoc (
    IdTiDoc INT PRIMARY KEY,
    Tip varchar(20)
);


CREATE TABLE Clientes (
    IdCli INT PRIMARY KEY,
    Nomb varchar(30),
    Apell1 varchar(30),
    Apell2 varchar(30),
    TarPro bigint,
    NumCel bigint,
	IdPlaca varchar(30),
    IdTiDoc int
);


CREATE TABLE Vehiculos (
    IdPlaca varchar(30) PRIMARY KEY,
    Novedad varchar(100),
    IdCol INT
    );


CREATE TABLE Parqueadero (
    IdPar INT PRIMARY KEY,
    Direcc varchar(30),
    Num INT
   
);


CREATE TABLE Sectores (
    IdSec INT PRIMARY KEY,
    IdPar INT,
    IdTipSec INT
 
);


CREATE TABLE Estado (
    IdEsta INT PRIMARY KEY,
    Esta varchar(30)
);


CREATE TABLE ZonParq (
    IdZonPa INT PRIMARY KEY,
    IdSec INT,
    IdEsta INT);


CREATE TABLE Ticket (
    IdTick INT PRIMARY KEY,
    FecIngre TIMESTAMP,
    IdCli varchar(30),
    IdZonPa INT
    
);



CREATE TABLE MedPago (
    IdMePago INT PRIMARY KEY,
    TipPa varchar(20)
);


CREATE TABLE Factura (
    IdFact INT PRIMARY KEY,
    ValPag INT,
    FecEgre TIMESTAMP,
    IdTari INT,
    IdMePago INT,
    IdTick INT
    
);


CREATE TABLE Empleados (
    IdEmp INT PRIMARY KEY,
    Nom varchar(40),
    Ape1 varchar(40),
    Ape2 varchar(40),
    Contra INT,
    Email varchar(40),
    NumCont bigint,
    IdPar INT,
    IdTiDoc INT
);




