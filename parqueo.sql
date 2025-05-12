DROP DATABASE IF EXISTS Parqueadero;
CREATE DATABASE Parqueadero;
USE Parqueadero;

CREATE TABLE  Marca(
	ID_Marca tinyint primary key auto_increment,
    Marca varchar(20)
);
CREATE TABLE Modelo(
	ID_Modelo smallint primary key auto_increment,
    Modelo smallint
);
CREATE TABLE Color(
	ID_Color tinyint primary key auto_increment,
    Color varchar(12)
);
CREATE TABLE TipoVehiculo(
	ID_TipoVehiculo tinyint primary key auto_increment,
    TipoVehiculo varchar(12)
);
CREATE TABLE Vehiculo(
	ID_Placa varchar(12) primary key,
    ID_Marca tinyint,
    ID_Modelo smallint,
    ID_Color tinyint,
    ID_TipoVehiculo tinyint
);
CREATE TABLE Parqueo(
	ID_Parqueo mediumint primary key auto_increment,
    FechaLlegada datetime,
    FechaSalida datetime,
    Costo mediumint,
    Tiempo time,
    ID_Puestos tinyint,
    ID_Placa varchar (12)
);
CREATE TABLE Puestos(
	ID_Puestos tinyint primary key auto_increment,
    NumPuesto tinyint,
    Estado boolean
);
CREATE TABLE Sotano(
	ID_Sotano tinyint primary key auto_increment,
    Nivel tinyint
);
CREATE TABLE Pagos(
	ID_Pagos mediumint primary key auto_increment,
    ValorPago mediumint,
    ID_MetdodoPago tinyint,
    ID_Parqueo mediumint
);
CREATE TABLE MetodosPago(
	ID_MetodoPago tinyint primary key auto_increment,
    MetodoPago varchar(15)
);

ALTER TABLE Vehiculo
ADD CONSTRAINT FK_Vehiculos_Marca
FOREIGN KEY (ID_Marca) REFERENCES Marca(ID_Marca);
ALTER TABLE Vehiculo
ADD CONSTRAINT FK_Vehiculos_Modelo
FOREIGN KEY (ID_Modelo) REFERENCES Modelo(ID_Modelo);
ALTER TABLE Vehiculo
ADD CONSTRAINT FK_Vehiculos_Color
FOREIGN KEY (ID_Color) REFERENCES Color(ID_Color);
ALTER TABLE Vehiculo
ADD CONSTRAINT FK_Vehiculos_TipoVehiculo
FOREIGN KEY (ID_TipoVehiculo) REFERENCES TipoVehiculo(ID_TipoVehiculo);