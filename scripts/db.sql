CREATE DATABASE IF NOT EXISTS hospital;

CREATE TABLE  hospital.Hospital (
    Codigo_Hospital CHAR(50),
    Nombre VARCHAR(20),
    Direccion VARCHAR(45),
    Telefono CHAR(12) NOT NULL,
    PRIMARY KEY (Codigo_Hospital)
);

CREATE TABLE hospital.Sala (
    Codigo_Sala CHAR(50) PRIMARY KEY,
    Nombre VARCHAR(20),
    Cantidad_de_Camas CHAR(100),
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

CREATE TABLE hospital.Paciente (
    No_de_Paciente INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Edad INT NOT NULL,
    Genero VARCHAR(10) NOT NULL,
    Direccion VARCHAR(100) NOT NULL
);

CREATE TABLE hospital.Estancia (
    No_de_Paciente INT,
    Fecha_Inicio DATE,
    Fecha_Fin DATE,
    FOREIGN KEY (No_de_Paciente) REFERENCES hospital.Paciente(No_de_Paciente)
);

-- alter table hospital.paciente drop column No_de_Paciente;
alter table hospital.paciente add primary key (No_de_Paciente);

-- Tabla Informacion_Analisis
CREATE TABLE hospital.Informacion_Analisis (
    ID_Analisis VARCHAR(20) PRIMARY KEY,
    Complicaciones VARCHAR(200) NOT NULL,
    Tipo VARCHAR(100) NOT NULL
);

CREATE TABLE hospital.Analisis_Paciente (
    ID_Analisis INT,
    No_de_Paciente INT,
    Fecha_Analisis DATE,
    FOREIGN KEY (ID_Analisis) REFERENCES hospital.Analisis(ID_Analisis),
    FOREIGN KEY (No_de_Paciente) REFERENCES hospital.Paciente(No_de_Paciente)
);

-- Tabla Analisis_Relacion
CREATE TABLE hospital.Analisis_Relacion (
    ID_Analisis VARCHAR(20),
    ID_Medico INT,
    No_de_Paciente INT,
    Codigo_Hospital CHAR(50),
    FOREIGN KEY (ID_Analisis) REFERENCES hospital.Informacion_Analisis(ID_Analisis),
    FOREIGN KEY (ID_Medico) REFERENCES hospital.Medico(ID_Medico),
    FOREIGN KEY (No_de_Paciente) REFERENCES hospital.Paciente(No_de_Paciente),
    FOREIGN KEY (Codigo_Hospital) REFERENCES hospital.Hospital(Codigo_Hospital)
);


-- alter table hospital.Analisis drop column No_de_Paciente;

-- ALTER TABLE statements (execute after creating all tables)
ALTER TABLE hospital.Hospital;

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
VALUES ('SAL011', 'Sala de Emergencias', '10 camas', 'HOSP001'),
       ('SAL021', 'Sala de Pediatría', '15 camas', 'HOSP002'),
       ('SAL031', 'Sala de Cardiología', '20 camas', 'HOSP003'),
       ('SAL041', 'Sala de Cardiología', '20 camas', 'HOSP004'),
       ('SAL051', 'Sala de Pediatría', '20 camas', 'HOSP005'),
       ('SAL061', 'Sala de Cardiología', '20 camas', 'HOSP006'),
       ('SAL071', 'Sala de Cardiología', '50 camas', 'HOSP007'),
       ('SAL081', 'Sala de Cardiología', '20 camas', 'HOSP008'),
       ('SAL091', 'Sala de Emergencias', '20 camas', 'HOSP009'),
       ('SAL101', 'Sala de Cardiología', '30 camas', 'HOSP0010');
       
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
       
INSERT INTO hospital.Paciente (No_de_Paciente, Nombre, Edad, Genero, Fecha_de_Ingreso, Direccion)
VALUES (1, 'Ana García', 35, 'Femenino', '2023-01-10', 'Calle A, #123'),
       (2, 'Pedro Martínez', 8, 'Masculino', '2023-01-15', 'Calle B, #456'),
       (3, 'Luisa Fernández', 50, 'Femenino', '2023-01-20', 'Av. Corazón, #789'),
       (4, 'Ana García', 35, 'Femenino', '2023-01-10', 'Calle A, #123'),
       (5, 'Pedro Martínez', 8, 'Masculino', '2023-01-15', 'Calle B, #456'),
       (6, 'Luisa Fernández', 50, 'Femenino', '2023-01-20', 'Av. Corazón, #789'),
       (7, 'Ana García', 35, 'Femenino', '2023-01-10', 'Calle A, #123'),
       (8, 'Pedro Martínez', 8, 'Masculino', '2023-01-15', 'Calle B, #456'),
       (9, 'Luisa Fernández', 50, 'Femenino', '2023-01-20', 'Av. Corazón, #789'),
	   (10, 'Luisa Fernández', 50, 'Femenino', '2023-01-20', 'Av. Corazón, #789');
       
INSERT INTO hospital.Analisis (ID_Analisis, Complicaciones, Tipo, ID_Laboratorio, ID_Medico, No_de_Paciente, Codigo_Hospital)
VALUES ('ANAL001', 'Sin complicaciones', 'Análisis de sangre', 'LAB001', 101, 1,'HOSP001' ),
       ('ANAL002', 'Sin complicaciones', 'Análisis de orina', 'LAB002', 102, 2, 'HOSP002'),
       ('ANAL003', 'Sin complicaciones', 'Electrocardiograma', 'LAB003', 103, 3, 'HOSP005'),
       ('ANAL004', 'Sin complicaciones', 'Electrocardiograma', 'LAB004', 104, 4, 'HOSP004'),
       ('ANAL005', 'Sin complicaciones', 'Electrocardiograma', 'LAB005', 105, 5, 'HOSP008'),
       ('ANAL006', 'Sin complicaciones', 'Electrocardiograma', 'LAB006', 106, 6, 'HOSP009'),
       ('ANAL007', 'Sin complicaciones', 'Electrocardiograma', 'LAB007', 107, 7, 'HOSP007'),
       ('ANAL008', 'Sin complicaciones', 'Electrocardiograma', 'LAB008', 108, 8, 'HOSP003'),
       ('ANAL009', 'Sin complicaciones', 'Electrocardiograma', 'LAB009', 109, 9, 'HOSP001'),
       ('ANAL0010', 'Sin complicaciones', 'Electrocardiograma', 'LAB0010', 110, 10, 'HOSP006');
       
       
SELECT * FROM hospital.Hospital;
SELECT * FROM hospital.sala;
SELECT * FROM hospital.laboratorio;
SELECT * FROM hospital.analisis;
SELECT * FROM hospital.medico;
SELECT * FROM hospital.paciente;

SELECT Codigo_Hospital, Telefono FROM hospital.Hospital;
SELECT Codigo_Sala, Cantidad_de_Camas FROM hospital.Sala;
SELECT ID_Laboratorio, Telefono FROM hospital.Laboratorio;
SELECT ID_Analisis, Complicaciones, No_de_Paciente FROM hospital.Analisis;
SELECT ID_Medico, Cargo, Codigo_Hospital FROM hospital.Medico;
SELECT No_de_Paciente, Nombre, Edad, Direccion FROM hospital.Paciente;

SELECT Nombre, Especialidad FROM hospital.Medico WHERE Especialidad = 'Cardiología';

SELECT * FROM hospital.Sala ORDER BY Cantidad_de_Camas ASC;
SELECT * FROM hospital.Paciente ORDER BY Fecha_de_Ingreso DESC;

SELECT COUNT(*) FROM hospital.Hospital;
SELECT COUNT(*) FROM hospital.Sala;
SELECT COUNT(*) FROM hospital.Laboratorio;
SELECT COUNT(*) FROM hospital.Analisis;
SELECT COUNT(*) FROM hospital.Medico;
SELECT COUNT(*) FROM hospital.Paciente;

SELECT SUM(Cantidad_de_Camas) FROM hospital.Sala;
SELECT SUM(Edad) FROM hospital.Paciente;

SELECT MAX(Edad), MIN(Edad) FROM hospital.Paciente;

SELECT hospital.Hospital.Codigo_Hospital, hospital.Medico.ID_Medico
FROM hospital.Hospital
INNER JOIN  hospital.Medico ON hospital.Hospital.Codigo_Hospital= hospital.Medico.Codigo_Hospital;

SELECT hospital.Analisis.ID_Analisis, hospital.Laboratorio.ID_Laboratorio
FROM hospital.Analisis
INNER JOIN hospital.Laboratorio ON hospital.Analisis.ID_Analisis= hospital.Laboratorio.Codigo_Hospital;



SELECT e.Nombre AS Medico, d.Nombre AS Sala
FROM hospital.Medico e
JOIN hospital.Sala d ON e.Codigo_Hospital = d.Codigo_Hospital
WHERE e.Cargo = 'Cirujano';
SELECT e.Nombre AS Hospital, d.Nombre AS Sala
FROM hospital.Hospital e
JOIN hospital.Sala d ON e.Codigo_Hospital = d.Codigo_Hospital
WHERE e.Cantidad_de_Camas > 100;
SELECT p.Nombre AS Paciente, a.Complicaciones
FROM hospital.Paciente p
JOIN hospital.Analisis a ON p.No_de_Paciente = a.No_de_Paciente
WHERE a.Complicaciones IS NOT NULL;


SELECT e.Nombre AS Paciente, e.Edad
FROM hospital.Paciente e
WHERE e.Edad > (
    SELECT AVG(Edad) FROM hospital.Paciente WHERE Genero = e.Genero
);
SELECT e.Nombre AS Medico, e.Especialidad
FROM hospital.Medico e
WHERE e.Especialidad = (
    SELECT Especialidad FROM hospital.Medico WHERE Nombre = 'Dr. Juan Pérez'
);

SELECT Codigo_Hospital, AVG(Total) AS Total_Camas
FROM hospital.Sala
GROUP BY Codigo_Hospital;

SELECT nombre, Fecha_de_Ingreso
FROM hospital.Paciente
WHERE YEAR ( Fecha_de_Ingreso) = 2023;

SELECT Nombre, 'Paciente' AS Tipo
FROM hospital.Paciente
UNION
SELECT Nombre, 'Médico' AS Tipo
FROM hospital.Medico;
SELECT Nombre, 'Paciente' AS Tipo
FROM hospital.Paciente
UNION
SELECT Nombre, 'Laboratorio' AS Tipo
FROM hospital.Laboratorio;

SELECT nombre, direccion
FROM Laboratorio
WHERE direccion LIKE '%Calle%';

SELECT Nombre
FROM hospital.Medico e
WHERE NOT EXISTS (
    SELECT 1 FROM hospital.Analisis WHERE ID_Medico = e.ID_Medico
);
SELECT Nombre
FROM hospital.Hospital e
WHERE EXISTS (
    SELECT 1 FROM hospital.Sala WHERE Codigo_Hospital = e.Codigo_Hospital
);

SELECT Nombre, Edad
FROM hospital.Paciente
ORDER BY Edad DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;


-- Consulta de pacientes ingresados en el hospital en un rango de fechas.
SELECT p.Nombre AS Paciente, e.Fecha_Inicio, e.Fecha_Fin
FROM hospital.Paciente p
JOIN hospital.Estancia e ON p.No_de_Paciente = e.No_de_Paciente
WHERE e.Fecha_Inicio BETWEEN '2023-01-01' AND '2023-12-31';

-- Consulta de análisis realizados a pacientes en un rango de fechas.
SELECT p.Nombre AS Paciente, a.Complicaciones, ap.Fecha_Analisis
FROM hospital.Paciente p
JOIN hospital.Analisis_Paciente ap ON p.No_de_Paciente = ap.No_de_Paciente
JOIN hospital.Analisis a ON ap.ID_Analisis = a.ID_Analisis
WHERE ap.Fecha_Analisis BETWEEN '2023-01-01' AND '2023-12-31';

-- Consulta de pacientes cuya edad está por encima del promedio por género.
SELECT p.Nombre AS Paciente, p.Edad
FROM hospital.Paciente p
WHERE p.Edad > (
    SELECT AVG(Edad) FROM hospital.Paciente WHERE Genero = p.Genero
);

-- Consulta de médicos con la misma especialidad que un médico específico.
SELECT m.Nombre AS Medico, m.Especialidad
FROM hospital.Medico m
WHERE m.Especialidad = (
    SELECT Especialidad FROM hospital.Medico WHERE Nombre = 'Dr. Juan Pérez'
);

-- Consulta de análisis realizados por laboratorios en una calle específica.
SELECT a.ID_Analisis, l.ID_Laboratorio
FROM hospital.Analisis a
JOIN hospital.Laboratorio l ON a.ID_Analisis = l.ID_Laboratorio
WHERE l.Direccion LIKE '%Calle%';

-- Consulta de hospitales sin análisis asociados.
SELECT h.Nombre
FROM hospital.Hospital h
WHERE NOT EXISTS (
    SELECT 1 FROM hospital.Analisis_Paciente ap WHERE ap.No_de_Paciente = h.Codigo_Hospital
);

-- Consulta de hospitales con salas asociadas.
SELECT h.Nombre
FROM hospital.Hospital h
WHERE EXISTS (
    SELECT 1 FROM hospital.Estancia e WHERE e.No_de_Paciente = h.Codigo_Hospital
);

-- Consulta paginada de pacientes ordenados por edad descendente.
SELECT p.Nombre, p.Edad
FROM hospital.Paciente p
ORDER BY p.Edad DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;
