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

alter table clientes add column IdPlaca varchar(30);
alter table clientes
add constraint Fk_IdPlaca
foreign key (IdPlaca) references Vehiculos(IdPlaca);
alter table clientes add column IdTiDoc int ;
alter table clientes
add constraint Fk_IdTiDoc
foreign key (IdTiDoc) references TipDoc(IdTiDoc);

ALTER TABLE vehiculos
drop column IdTVe;
ALTER TABLE vehiculos
drop column IdDoc;
alter table vehiculos
add constraint Fk_IdCol
foreign key (IdCol) references Color(IdCol);

alter table sectores
add column Tari varchar (30);
alter table sectores
add column TipVeh varchar (30);
ALTER TABLE sectores
drop column IdTipSec;
ALTER TABLE sectores
drop column IdPar;

alter table Zonparq
add constraint Fk_IdSec
foreign key (IdSec) references sectores(IdSec);
alter table Zonparq
add constraint Fk_IdEsta
foreign key (IdEsta) references estado(IdEsta);

alter table empleados
add constraint Fk_IdPar
foreign key (IdPar) references parqueadero(IdPar);
alter table empleados
add constraint Fk_IdTiDocc
foreign key (IdTiDoc) references TipDoc(IdTiDoc);

alter table ticket change column IdCli IdCli int;
alter table ticket
add constraint Fk_IdCli
foreign key (IdCli) references clientes(IdCli);
alter table ticket
add constraint Fk_IdZonPa
foreign key (IdZonPa) references zonparq(IdZonPa);

alter table factura drop column IdTari;
alter table factura
add constraint Fk_IdMePago
foreign key (IdMePago) references medpago(IdMePago);
alter table factura
add constraint Fk_IdTick
foreign key (IdTick) references ticket(IdTick);





