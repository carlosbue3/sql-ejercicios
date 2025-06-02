CREATE DATABASE hotel_reservas;
USE hotel_reservas;

-- Tabla clientes
CREATE TABLE clientes (
    IdCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Documento VARCHAR(50),
    Telefono VARCHAR(20)
);

-- Tabla habitaciones
CREATE TABLE habitaciones (
    IdHabitacion INT AUTO_INCREMENT PRIMARY KEY,
    Acomodacion INT CHECK (Acomodacion BETWEEN 1 AND 4),
    PrecioBase DECIMAL(10,2),
    Disponible BOOLEAN DEFAULT TRUE
);

-- Tabla reservas
CREATE TABLE reservas (
    IdReserva INT AUTO_INCREMENT PRIMARY KEY,
    IdCliente INT,
    IdHabitacion INT,
    FechaReserva DATE,
    FechaIngreso DATE,
    FechaSalida DATE,
    CostoTotal DECIMAL(10,2),
	CONSTRAINT fk_cliente FOREIGN KEY (IdCliente) REFERENCES clientes(IdCliente),
    CONSTRAINT fk_habitacion FOREIGN KEY (IdHabitacion) REFERENCES habitaciones(IdHabitacion)
);