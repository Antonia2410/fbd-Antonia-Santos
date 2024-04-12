CREATE DATABASE IF NOT EXISTS Hospital;
CREATE TABLE  IF NOT EXISTS Hospital.Hospital(
    Codigo_Hospital CHAR(50),
    Nombre VARCHAR (45),
    Direccion VARCHAR (45),
    Telefono CHAR (12) NOT NULL,
PRIMARY KEY (Codigo_Hospital)
);

CREATE TABLE  IF NOT EXISTS Hospital.Sala(
    Codigo_Sala INT PRIMARY KEY,
    Nombre VARCHAR (45),
    Cantidad_de_Camas CHAR(255),
    Codigo_Hospital CHAR (50),
    FOREIGN KEY (Codigo_Hospital) REFERENCES Hospital.Hospital(Codigo_Hospital)
);

CREATE TABLE IF NOT EXISTS Hospital.Medico(
    ID_Medico INT PRIMARY KEY,
    Nombre VARCHAR (45),
    CedulaProfesional VARCHAR(30),
    Especialidad VARCHAR(40) ,
    Cargo VARCHAR (100),
    Codigo_Hospital CHAR (50),
FOREIGN KEY (Codigo_Hospital) REFERENCES Hospital.Hospital(Codigo_Hospital)
);

CREATE TABLE IF NOT EXISTS Hospital.Laboratorio(
    ID_Laboratorio CHAR(50) PRIMARY KEY ,
    Nombre VARCHAR (45),
    Direccion VARCHAR (45),
    Telefono CHAR (12) NOT NULL,
    Codigo_Hospital CHAR (50),
    FOREIGN KEY (Codigo_Hospital) REFERENCES Hospital.Hospital(Codigo_Hospital)
);

CREATE TABLE IF NOT EXISTS Hospital.Analisis(
    ID_Analisis VARCHAR (20) PRIMARY KEY ,
    Complicaciones VARCHAR (200),
    Tipo  VARCHAR (100),
    ID_Laboratorio CHAR (50),
    ID_Medico INT,
    N°_de_Paciente INT,
    FOREIGN KEY (ID_Laboratorio) REFERENCES Hospital.Laboratorio(ID_Laboratorio),
    FOREIGN KEY (ID_Medico) REFERENCES Hospital.Medico(ID_Medico),
    FOREIGN KEY (N°_de_Paciente) REFERENCES Hospital.Paciente(N°_de_Paciente)
);

CREATE TABLE IF NOT EXISTS Hospital.Paciente(
     N°_de_Paciente INT,
     Nombre VARCHAR (50),
     Edad INT,
     Genero VARCHAR (10),
     Fecha_de_Ingreso DATE,
     Direccion VARCHAR (45),
PRIMARY KEY (N°_de_Paciente)
);

ALTER TABLE Hospital.Sala
ADD FOREIGN KEY (Codigo_Hospital) REFERENCES Hospital.Hospital(Codigo_Hospital) ON UPDATE CASCADE ON DELETE CASCADE; 

ALTER TABLE Hospital.Medico
ADD FOREIGN KEY (Codigo_Hospital) REFERENCES Hospital.Hospital(Codigo_Hospital) ON UPDATE CASCADE ON DELETE CASCADE; 

ALTER TABLE Hospital.Laboratorio
ADD FOREIGN KEY (Codigo_Hospital) REFERENCES Hospital.Hospital(Codigo_Hospital) ON UPDATE CASCADE ON DELETE CASCADE; 

ALTER TABLE Hospital.Analisis
ADD FOREIGN KEY (ID_Laboratorio) REFERENCES Hospital.Laboratorio(ID_Laboratorio),
ADD FOREIGN KEY (ID_Medico) REFERENCES Hospital.Medico(ID_Medico),
ADD FOREIGN KEY (N°_de_Paciente) REFERENCES Hospital.Paciente(N°_de_Paciente);
