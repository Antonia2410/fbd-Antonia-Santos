CREATE DATABASE IF NOT EXISTS hospital;

CREATE TABLE  hospital.Hospital (
    Codigo_Hospital CHAR(50),
    Nombre VARCHAR(20),
    Direccion VARCHAR(45),
    Telefono CHAR(12) NOT NULL,
    PRIMARY KEY (Codigo_Hospital)
);

CREATE TABLE hospital.Sala (
    Codigo_Sala INT PRIMARY KEY,
    Nombre VARCHAR(20),
    Cantidad_de_Camas CHAR(200),
    Codigo_Hospital CHAR(50),
    FOREIGN KEY (Codigo_Hospital) REFERENCES hospital.Hospital(Codigo_Hospital)
);

CREATE TABLE hospital.Medico (
    ID_Medico INT PRIMARY KEY,
    Nombre VARCHAR(20),
    CedulaProfesional VARCHAR(30),
    Especialidad VARCHAR(40),
    Cargo VARCHAR(100),
    Codigo_Hospital CHAR(50),
    FOREIGN KEY (Codigo_Hospital) REFERENCES hospital.Hospital(Codigo_Hospital)
);

CREATE TABLE hospital.Laboratorio (
    ID_Laboratorio CHAR(50) PRIMARY KEY,
    Nombre VARCHAR(20),
    Direccion VARCHAR(45),
    Telefono CHAR(12) NOT NULL,
    Codigo_Hospital CHAR(50),
    FOREIGN KEY (Codigo_Hospital) REFERENCES hospital.Hospital(Codigo_Hospital)
);

CREATE TABLE hospital.Analisis (
    ID_Analisis VARCHAR(20) PRIMARY KEY,
    Complicaciones VARCHAR(200),
    Tipo VARCHAR(100),
    ID_Laboratorio CHAR(50),
    ID_Medico INT,
    No_de_Paciente INT,
    Codigo_Hospital CHAR(50),
    FOREIGN KEY (ID_Laboratorio) REFERENCES hospital.Laboratorio(ID_Laboratorio),
    FOREIGN KEY (ID_Medico) REFERENCES hospital.Medico(ID_Medico),
    FOREIGN KEY (No_de_Paciente) REFERENCES hospital.Paciente(No_de_Paciente),
    FOREIGN KEY (Codigo_Hospital) REFERENCES hospital.Hospital(Codigo_Hospital)
);

CREATE TABLE  hospital.Paciente (
    No_de_Paciente INT,
    Nombre VARCHAR(20),
    Edad INT,
    Genero VARCHAR(10),
    Fecha_de_Ingreso DATE,
    Direccion VARCHAR(45),
    Codigo_Hospital CHAR(50),
    FOREIGN KEY (Codigo_Hospital) REFERENCES hospital.Hospital(Codigo_Hospital)
);

-- ALTER TABLE statements (execute after creating all tables)
ALTER TABLE hospital.Sala
ADD FOREIGN KEY (Codigo_Hospital) REFERENCES hospital.Hospital(Codigo_Hospital) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE hospital.Medico
ADD FOREIGN KEY (Codigo_Hospital) REFERENCES hospital.Hospital(Codigo_Hospital) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE hospital.Laboratorio
ADD FOREIGN KEY (Codigo_Hospital) REFERENCES hospital.Hospital(Codigo_Hospital) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE hospital.Analisis
ADD FOREIGN KEY (ID_Laboratorio) REFERENCES hospital.Laboratorio(ID_Laboratorio),
ADD FOREIGN KEY (ID_Medico) REFERENCES hospital.Medico(ID_Medico),
ADD FOREIGN KEY (No_de_Paciente) REFERENCES hospital.Paciente(No_de_Paciente),
ADD FOREIGN KEY (Codigo_Hospital) REFERENCES hospital.Hospital(Codigo_Hospital) ON UPDATE CASCADE ON DELETE CASCADE;

INSERT INTO hospital.Hospital (Codigo_Hospital, Nombre, Direccion, Telefono)
VALUES ('HOSP001', 'Hospital General', 'Calle Principal 123', '123-456-7890'),
       ('HOSP002', 'Hospital Infantil', 'Calle Niños 456', '987-654-3210'),
       ('HOSP003', 'Hospital del Corazón', 'Av. Cardiología 789', '123-456-7890'),
       ('HOSP004', 'Hospital del Corazón', 'Av. Cardiología 789', '123-456-7890'),
       ('HOSP005', 'Hospital del Corazón', 'Av. Cardiología 789', '123-456-7890'),
       ('HOSP006', 'Hospital del Corazón', 'Av. Cardiología 789', '123-456-7890'),
       ('HOSP007', 'Hospital del Corazón', 'Av. Cardiología 789', '123-456-7890'),
       ('HOSP008', 'Hospital del Corazón', 'Av. Cardiología 789', '123-456-7890'),
       ('HOSP009', 'Hospital del Corazón', 'Av. Cardiología 789', '123-456-7890'),
       ('HOSP0010', 'Hospital del Corazón', 'Av. Cardiología 789', '123-456-7890');
INSERT INTO hospital.Sala (Codigo_Sala, Nombre, Cantidad_de_Camas, Codigo_Hospital)
VALUES (1, 'Sala de Emergencias', '10 camas', 'HOSP001'),
       (2, 'Sala de Pediatría', '15 camas', 'HOSP002'),
       (3, 'Sala de Cardiología', '20 camas', 'HOSP003'),
       (4, 'Sala de Cardiología', '20 camas', 'HOSP004'),
       (5, 'Sala de Cardiología', '20 camas', 'HOSP005'),
       (6, 'Sala de Cardiología', '20 camas', 'HOSP006'),
       (7, 'Sala de Cardiología', '20 camas', 'HOSP007'),
       (8, 'Sala de Cardiología', '20 camas', 'HOSP008'),
       (9, 'Sala de Cardiología', '20 camas', 'HOSP009'),
       (10, 'Sala de Cardiología', '20 camas', 'HOSP010');
INSERT INTO hospital.Medico (ID_Medico, Nombre, CedulaProfesional, Especialidad, Cargo, Codigo_Hospital)
VALUES (101, 'Dr. Juan Pérez', '12345', 'Cardiología', 'Jefe de Cardiología', 'HOSP001'),
	   (102, 'Dra. Maria López', '54321', 'Pediatría', 'Jefa de Pediatría', 'HOSP002'),
	   (103, 'Dr. Carlos Rodríguez', '67890', 'Cardiología', 'Jefe de Cardiología', 'HOSP003'),
       (104, 'Dr. Carlos Rodríguez', '67890', 'Cardiología', 'Jefe de Cardiología', 'HOSP004'),
       (105, 'Dr. Carlos Rodríguez', '67890', 'Cardiología', 'Jefe de Cardiología', 'HOSP005'),
       (106, 'Dr. Carlos Rodríguez', '67890', 'Cardiología', 'Jefe de Cardiología', 'HOSP006'),
       (107, 'Dr. Carlos Rodríguez', '67890', 'Cardiología', 'Jefe de Cardiología', 'HOSP007'),
       (108, 'Dr. Carlos Rodríguez', '67890', 'Cardiología', 'Jefe de Cardiología', 'HOSP008'),
       (109, 'Dr. Carlos Rodríguez', '67890', 'Cardiología', 'Jefe de Cardiología', 'HOSP009'),
       (110, 'Dr. Carlos Rodríguez', '67890', 'Cardiología', 'Jefe de Cardiología', 'HOSP0010');
INSERT INTO hospital.Laboratorio (ID_Laboratorio, Nombre, Direccion, Telefono, Codigo_Hospital)
VALUES ('LAB001', 'Laboratorio Clínico', 'Av. Principal 456', '987-654-3210', 'HOSP001'),
       ('LAB002', 'Laboratorio Pediátrico', 'Av. Niños 789', '987-654-3210', 'HOSP002'),
       ('LAB003', 'Laboratorio Cardiológico', 'Calle Corazón 123', '123-456-7890', 'HOSP003'),
       ('LAB004', 'Laboratorio Cardiológico', 'Calle Corazón 123', '123-456-7890', 'HOSP003'),
       ('LAB005', 'Laboratorio Cardiológico', 'Calle Corazón 123', '123-456-7890', 'HOSP003'),
       ('LAB006', 'Laboratorio Cardiológico', 'Calle Corazón 123', '123-456-7890', 'HOSP003'),
       ('LAB007', 'Laboratorio Cardiológico', 'Calle Corazón 123', '123-456-7890', 'HOSP003'),
       ('LAB008', 'Laboratorio Cardiológico', 'Calle Corazón 123', '123-456-7890', 'HOSP003'),
       ('LAB009', 'Laboratorio Cardiológico', 'Calle Corazón 123', '123-456-7890', 'HOSP003'),
       ('LAB0010', 'Laboratorio Cardiológico', 'Calle Corazón 123', '123-456-7890', 'HOSP003');
INSERT INTO hospital.Analisis (ID_Analisis, Complicaciones, Tipo, ID_Laboratorio, ID_Medico, No_de_Paciente)
VALUES ('ANAL001', 'Sin complicaciones', 'Análisis de sangre', 'LAB001', 101, 1),
       ('ANAL002', 'Sin complicaciones', 'Análisis de orina', 'LAB002', 102, 2),
       ('ANAL003', 'Sin complicaciones', 'Electrocardiograma', 'LAB003', 103, 3),
       ('ANAL004', 'Sin complicaciones', 'Electrocardiograma', 'LAB004', 104, 4),
       ('ANAL005', 'Sin complicaciones', 'Electrocardiograma', 'LAB005', 105, 5),
       ('ANAL006', 'Sin complicaciones', 'Electrocardiograma', 'LAB006', 106, 6),
       ('ANAL007', 'Sin complicaciones', 'Electrocardiograma', 'LAB007', 107, 7),
       ('ANAL008', 'Sin complicaciones', 'Electrocardiograma', 'LAB008', 108, 4),
       ('ANAL009', 'Sin complicaciones', 'Electrocardiograma', 'LAB009', 109, 9),
       ('ANAL0010', 'Sin complicaciones', 'Electrocardiograma', 'LAB0010', 110, 10);
INSERT INTO hospital.Paciente (No_de_Paciente, Nombre, Edad, Genero, Fecha_de_Ingreso, Direccion)
VALUES (1, 'Ana García', 35, 'Femenino', '2023-01-10', 'Calle A, #123'),
       (2, 'Pedro Martínez', 8, 'Masculino', '2023-01-15', 'Calle B, #456'),
       (3, 'Luisa Fernández', 50, 'Femenino', '2023-01-20', 'Av. Corazón, #789');
       
