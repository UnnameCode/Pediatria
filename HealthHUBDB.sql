CREATE DATABASE HealthHUB;
USE HealthHUB;

CREATE TABLE Cuidador (
	Id INT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(15) NOT NULL,
    Apellido VARCHAR(15) NOT NULL,
    E_mail VARCHAR(15) NOT NULL,
    Telefono INT NOT NULL,
    Contrasena VARCHAR(15) NOT NULL,
    Direccion VARCHAR(40) NOT NULL,
    Fecha_nacimiento DATE NOT NULL,
    Rol VARCHAR(15) NOT NULL
);

CREATE TABLE Padre (
	Id INT PRIMARY KEY NOT NULL,
	Nombre VARCHAR(15) NOT NULL,
	Apellido VARCHAR(15) NOT NULL,
	E_mail VARCHAR(15) NOT NULL,
	Telefono INT NOT NULL,
	Contrasena VARCHAR(15) NOT NULL,
	Direccion VARCHAR(40) NOT NULL,
	Fecha_nacimiento DATE NOT NULL,
	Rol VARCHAR(15) NOT NULL
);

CREATE TABLE Pediatra (
	Id INT PRIMARY KEY NOT NULL,
    Contenido VARCHAR(40) NOT NULL, /*REVISAR*/
    Id_cuidador INT NOT NULL,
    Id_padre INT NOT NULL,
    FOREIGN KEY (Id_cuidador) REFERENCES Cuidador(Id),
    FOREIGN KEY (Id_padre) REFERENCES Padre(Id)
);

CREATE TABLE Paciente (
	Id INT PRIMARY KEY NOT NULL,
	Nombre VARCHAR(15) NOT NULL,
	Apellido VARCHAR(15) NOT NULL,
	Fecha_nacimiento DATE NOT NULL,
	Direccion VARCHAR(40) NOT NULL,
	Genero VARCHAR(15) NOT NULL,
	Estado VARCHAR(10) NOT NULL,
	Id_pediatra INT NOT NULL,
    FOREIGN KEY (Id_pediatra) REFERENCES Pediatra(Id)
);

CREATE TABLE Acudiente (
	Id_padre INT NOT NULL,
    Id_paciente INT NOT NULL,
    FOREIGN KEY (Id_padre) REFERENCES Padre(Id),
    FOREIGN KEY (Id_paciente) REFERENCES Paciente(Id)
);

CREATE TABLE Encargado (
	Id_cuidador INT NOT NULL,
    Id_paciente INT NOT NULL,
    FOREIGN KEY (Id_cuidador) REFERENCES Cuidador(Id),
    FOREIGN KEY (Id_paciente) REFERENCES Paciente(Id)
);

CREATE TABLE Notificacion (
	Id INT PRIMARY KEY NOT NULL,
	Contenido VARCHAR(40) NOT NULL,
	Id_cuidador INT NOT NULL,
	Id_padre INT NOT NULL,
	FOREIGN KEY (Id_cuidador) REFERENCES Cuidador(Id),
    FOREIGN KEY (Id_padre) REFERENCES Padre(Id)
)