drop DATABASE IF EXISTS ParqueaderoDB;
CREATE DATABASE  ParqueaderoDB;
USE ParqueaderoDB;


CREATE TABLE Color (
    IdCol INT PRIMARY KEY auto_increment,
    Col varchar(20)
);

CREATE TABLE TipDoc (
    IdTiDoc INT PRIMARY KEY auto_increment,
    Tip varchar(20)
);


CREATE TABLE Clientes (
    IdCli INT PRIMARY KEY,
    Nomb varchar(30),
    Apell1 varchar(30),
    Apell2 varchar(30),
    TarPro bigint,
    NumCel bigint,
    IdTiDoc int
);


CREATE TABLE Vehiculos (
    IdPlaca varchar(30) PRIMARY KEY,
    Novedad varchar(100),
    IdCli int,
    IdCol INT,
    TipVeh varchar(30)
    );


CREATE TABLE Estado (
    IdEsta INT PRIMARY KEY auto_increment,
    Esta varchar(30)
);


CREATE TABLE ZonParq (
    IdZonPa INT PRIMARY KEY,
    Sec varchar(30),
	Tari int,
    IdEsta INT
    );


CREATE TABLE Ticket (
    IdTick INT PRIMARY KEY auto_increment,
	FecIngre TIMESTAMP,
    IdPlaca varchar(30),
	IdZonPa INT
);

CREATE TABLE MedPago (
    IdMePago INT PRIMARY KEY auto_increment,
    TipPa varchar(20)
);

CREATE TABLE FACTURA(
	IdFact INT PRIMARY KEY auto_increment,
	IdTick INT,
	IdMePago INT,
	ValPag INT,
    duracion int,
    FecEgre timestamp
);

alter table clientes
add constraint Fk_IdTiDoc
foreign key (IdTiDoc) references TipDoc(IdTiDoc);

alter table vehiculos
add constraint Fk_IdCol
foreign key (IdCol) references Color(IdCol);

alter table Zonparq
add constraint Fk_IdEsta
foreign key (IdEsta) references estado(IdEsta);
	
alter table ticket
add constraint Fk_IdPlaca
foreign key (IdPlaca) references vehiculos(IdPlaca);


alter table ticket
add constraint Fk_IdZonPa
foreign key (IdZonPa) references zonparq(IdZonPa);

alter table vehiculos
add constraint Fk_IdCli
foreign key (IdCli) references clientes(IdCli);

alter table FACTURA
add constraint Fk_IdTICKET
foreign key (IdTick) references TICKET(IdTick);

alter table FACTURA
add constraint Fk_IdMePago
foreign key (IdMePago) references medpago(IdMePago);