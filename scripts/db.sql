CREATE DATABASE IF NOT EXISTS Hospital;
CREATE TABLE  IF NOT EXISTS Hospital.Paciente(
    N° de Paciente CHAR(50)
    Nombre VARCHAR(45),
    Edad VARCHAR(70) ,
    Genero VARCHAR(60)NOT NULL,
    Fecha de Ingreso CHAR(12) NOT NULL,
PRIMARY KEY (N° de Paciente)
)
CREATE TABLE IF NOT EXISTS Hospital.Medico(
    ID_Medico INT,
    Nombre VARCHAR (45)
    Cedula Profesional VARCHAR(30),
    Especialidad VARCHAR(40) ,
PRIMARY KEY (ID_Medico)
)
CREATE TABLE IF NOT EXISTS Hospital.Analisis(
    ID_Analisis VARCHAR (20) ,
    Paciente N° de Paciente INT;
PRIMARY KEY (ID_Analisis)
)
