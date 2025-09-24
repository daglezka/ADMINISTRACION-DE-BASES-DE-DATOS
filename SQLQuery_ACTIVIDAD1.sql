CREATE TABLE Sucursal (
    Id_Sucursal INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(30) NOT NULL,
    Direccion VARCHAR(200) NOT NULL,
    Telefono VARCHAR(10),
    Encargado_Id INT -- Relaci�n con empleado   
);

CREATE TABLE Empleado (
    Id_Empleado INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(20) NOT NULL,
    Apellido VARCHAR(20) NOT NULL,
    Puesto VARCHAR(20) NOT NULL,
    Salario DECIMAL(10,2),
    Id_Sucursal INT  
);

ALTER TABLE Empleado
ADD CONSTRAINT FK_Empleado_Sucursal
FOREIGN KEY (Id_Sucursal)
REFERENCES Sucursal(Id_Sucursal);

ALTER TABLE Sucursal
ADD CONSTRAINT FK_Sucursal_Encargado
FOREIGN KEY (Encargado_Id)
REFERENCES Empleado(Id_Empleado);

ALTER TABLE Empleado
ADD CorreoElectronico VARCHAR(20),
    Estado NVARCHAR(25);

    EXEC sp_rename 'Sucursal.Nombre', 'NombreSucursal', 'COLUMN'; --Renombrar alguna columna existente


    INSERT INTO Sucursal (NombreSucursal, NombreEncargado, Direccion, NumeroTelefono, Ciudad, Estado)
VALUES
('Akira''s Boutique: Las Mercedes', 'Sonia Alejandra Fern�ndez Moreno', 'Calle Roble #507 Fracc. Las Mercedes', '4447831225', 'San Luis Potos�', 'San Luis Potos�'),

('Akira''s Boutique: Obraje', 'Fernando Calder�n Ayala', 'Calle Dr. Jes�s D�az de Le�n #438 col. Obraje', '4493780921', 'Aguascalientes', 'Aguascalientes'),

('Akira''s Boutique: Galer�as Mazatl�n', 'Daniela Fernanda D�az Ordaz', 'Av. de la Marina #6204, Marina', '6692932059', 'Mazatl�n', 'Sinaloa'),

('Akira''s Boutique: Zapopan', 'Mario Alberto Jim�nez Salcido', 'Av. Manuel J. Clouthier 525 col. Benito Ju�rez', '3337841207', 'Zapopan', 'Jalisco'),

('Akira''s Boutique: Melchor Ocampo', 'Yesenia Guadalupe Campos Rojo', 'Melchor Ocampo #2528 Zona Centro', '6142536721', 'Chihuahua', 'Chihuahua'),

('Akira''s Boutique: Durango', 'Tamara Alejandra Bernal Ramos', 'Calle Constituci�n #106 Zona Centro', '6181962954', 'Durango', 'Durango'),

('Akira''s Boutique: Zacatecas Centro', 'Ernesto Enrique Barrios Enciso', 'Av. Hidalgo #333 Zacatecas Centro', '4929301250', 'Zacatecas', 'Zacatecas');

select * from Sucursal

INSERT INTO Empleado (Nombre, Apellido, Puesto, Salario, Id_Sucursal)
VALUES

('Juan', 'P�rez', 'Vendedor', 12000.00, 2),
('Ana', 'Garc�a', 'Cajero', 11500.00, 2),
('Luis', 'Mart�nez', 'Almac�n', 11000.00, 2),
('Mar�a', 'Rodr�guez', 'Vendedor', 12500.00, 2),
('Carlos', 'Hern�ndez', 'Supervisor', 15000.00, 2),

('Sof�a', 'L�pez', 'Vendedor', 12300.00, 3),
('Diego', 'Ram�rez', 'Cajero', 11800.00, 3),
('Valeria', 'G�mez', 'Vendedor', 12200.00, 3),
('Miguel', 'Torres', 'Almac�n', 11000.00, 3),
('Claudia', 'Flores', 'Supervisor', 15200.00, 3),
('Jorge', 'S�nchez', 'Vendedor', 12000.00, 3),

('Paula', 'Rivas', 'Vendedor', 12100.00, 4),
('Ricardo', 'Vega', 'Cajero', 11700.00, 4),
('Gabriela', 'Molina', 'Vendedor', 12400.00, 4),
('Fernando', 'Castillo', 'Almac�n', 11200.00, 4),
('Isabel', 'Ortega', 'Supervisor', 15500.00, 4),
('Andr�s', 'Silva', 'Vendedor', 11900.00, 4),

('Laura', 'Jim�nez', 'Vendedor', 12300.00, 5),
('Pedro', 'Alvarado', 'Cajero', 11600.00, 5),
('Natalia', 'Campos', 'Vendedor', 12100.00, 5),
('Hugo', 'Morales', 'Almac�n', 11100.00, 5),
('Daniela', 'Rojas', 'Supervisor', 15000.00, 5),
('Esteban', 'Paredes', 'Vendedor', 12000.00, 5),

('Carla', 'Navarro', 'Vendedor', 12200.00, 6),
('Emilio', 'Cruz', 'Cajero', 11500.00, 6),
('Renata', 'Herrera', 'Vendedor', 12400.00, 6),
('Gustavo', 'Reyes', 'Almac�n', 11300.00, 6),
('Liliana', 'Vargas', 'Supervisor', 15300.00, 6),

('Ra�l', 'M�ndez', 'Vendedor', 12100.00, 7),
('Fernanda', 'Soto', 'Cajero', 11700.00, 7),
('Juli�n', 'Bravo', 'Vendedor', 12200.00, 7),
('Patricia', 'Casta�eda', 'Almac�n', 11000.00, 7),
('Alberto', 'Paz', 'Supervisor', 15100.00, 7),
('Monica', 'Ramos', 'Vendedor', 12000.00, 7),

('Ignacio', 'Salazar', 'Vendedor', 12300.00, 8),
('Camila', 'Fuentes', 'Cajero', 11600.00, 8),
('Jazm�n', 'Orozco', 'Vendedor', 12100.00, 8),
('Victor', 'Rebollo', 'Almac�n', 11200.00, 8),
('Marcos', 'Cervantes', 'Supervisor', 15400.00, 8),
('Daniel', 'Beltr�n', 'Vendedor', 12000.00, 8);

-- Actualizaci�n de correos y contrase�as ficticias
UPDATE Empleado SET CorreoElectronico = 'juan.perez@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Juan' AND Apellido = 'P�rez';
UPDATE Empleado SET CorreoElectronico = 'ana.garcia@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Ana' AND Apellido = 'Garc�a';
UPDATE Empleado SET CorreoElectronico = 'luis.martinez@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Luis' AND Apellido = 'Mart�nez';
UPDATE Empleado SET CorreoElectronico = 'maria.rodriguez@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Mar�a' AND Apellido = 'Rodr�guez';
UPDATE Empleado SET CorreoElectronico = 'carlos.hernandez@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Carlos' AND Apellido = 'Hern�ndez';
UPDATE Empleado SET CorreoElectronico = 'sofia.lopez@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Sof�a' AND Apellido = 'L�pez';
UPDATE Empleado SET CorreoElectronico = 'diego.ramirez@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Diego' AND Apellido = 'Ram�rez';
UPDATE Empleado SET CorreoElectronico = 'valeria.gomez@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Valeria' AND Apellido = 'G�mez';
UPDATE Empleado SET CorreoElectronico = 'miguel.torres@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Miguel' AND Apellido = 'Torres';
UPDATE Empleado SET CorreoElectronico = 'claudia.flores@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Claudia' AND Apellido = 'Flores';
UPDATE Empleado SET CorreoElectronico = 'jorge.sanchez@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Jorge' AND Apellido = 'S�nchez';
UPDATE Empleado SET CorreoElectronico = 'paula.rivas@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Paula' AND Apellido = 'Rivas';
UPDATE Empleado SET CorreoElectronico = 'ricardo.vega@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Ricardo' AND Apellido = 'Vega';
UPDATE Empleado SET CorreoElectronico = 'gabriela.molina@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Gabriela' AND Apellido = 'Molina';
UPDATE Empleado SET CorreoElectronico = 'fernando.castillo@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Fernando' AND Apellido = 'Castillo';
UPDATE Empleado SET CorreoElectronico = 'isabel.ortega@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Isabel' AND Apellido = 'Ortega';
UPDATE Empleado SET CorreoElectronico = 'andres.silva@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Andr�s' AND Apellido = 'Silva';
UPDATE Empleado SET CorreoElectronico = 'laura.jimenez@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Laura' AND Apellido = 'Jim�nez';
UPDATE Empleado SET CorreoElectronico = 'pedro.alvarado@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Pedro' AND Apellido = 'Alvarado';
UPDATE Empleado SET CorreoElectronico = 'natalia.campos@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Natalia' AND Apellido = 'Campos';
UPDATE Empleado SET CorreoElectronico = 'hugo.morales@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Hugo' AND Apellido = 'Morales';
UPDATE Empleado SET CorreoElectronico = 'daniela.rojas@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Daniela' AND Apellido = 'Rojas';
UPDATE Empleado SET CorreoElectronico = 'esteban.paredes@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Esteban' AND Apellido = 'Paredes';
UPDATE Empleado SET CorreoElectronico = 'carla.navarro@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Carla' AND Apellido = 'Navarro';
UPDATE Empleado SET CorreoElectronico = 'emilio.cruz@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Emilio' AND Apellido = 'Cruz';
UPDATE Empleado SET CorreoElectronico = 'renata.herrera@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Renata' AND Apellido = 'Herrera';
UPDATE Empleado SET CorreoElectronico = 'gustavo.reyes@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Gustavo' AND Apellido = 'Reyes';
UPDATE Empleado SET CorreoElectronico = 'liliana.vargas@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Liliana' AND Apellido = 'Vargas';
UPDATE Empleado SET CorreoElectronico = 'raul.mendez@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Ra�l' AND Apellido = 'M�ndez';
UPDATE Empleado SET CorreoElectronico = 'fernanda.soto@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Fernanda' AND Apellido = 'Soto';
UPDATE Empleado SET CorreoElectronico = 'julian.bravo@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Juli�n' AND Apellido = 'Bravo';
UPDATE Empleado SET CorreoElectronico = 'patricia.castaneda@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Patricia' AND Apellido = 'Casta�eda';
UPDATE Empleado SET CorreoElectronico = 'alberto.paz@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Alberto' AND Apellido = 'Paz';
UPDATE Empleado SET CorreoElectronico = 'monica.ramos@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Monica' AND Apellido = 'Ramos';
UPDATE Empleado SET CorreoElectronico = 'ignacio.salazar@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Ignacio' AND Apellido = 'Salazar';
UPDATE Empleado SET CorreoElectronico = 'camila.fuentes@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Camila' AND Apellido = 'Fuentes';
UPDATE Empleado SET CorreoElectronico = 'jazmin.orozco@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Jazm�n' AND Apellido = 'Orozco';
UPDATE Empleado SET CorreoElectronico = 'victor.rebollo@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Victor' AND Apellido = 'Rebollo';
UPDATE Empleado SET CorreoElectronico = 'marcos.cervantes@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Marcos' AND Apellido = 'Cervantes';
UPDATE Empleado SET CorreoElectronico = 'daniel.beltran@empresa.com', Contrasena = 'Password123' WHERE Nombre = 'Daniel' AND Apellido = 'Beltr�n';


Select * from Empleado
select * from Sucursal
ALTER TABLE Empleado
ALTER COLUMN CorreoElectronico VARCHAR(50);

--Querys para probar funcionamiento de BD

--Consultar empleados de una sucursal espec�fica
SELECT Nombre, Apellido, Puesto
FROM Empleado
WHERE Id_Sucursal = 3; 

--Contar cu�ntos empleados hay en cada sucursal
SELECT s.NombreSucursal, COUNT(e.Id_Empleado) AS TotalEmpleados
FROM Sucursal s
LEFT JOIN Empleado e ON e.Id_Sucursal = s.Id_Sucursal
GROUP BY s.NombreSucursal;

--Mostrar todos los empleados con su sucursal
SELECT e.Id_Empleado, e.Nombre, e.Apellido, e.Puesto, e.Salario,
       s.NombreSucursal, s.Ciudad, s.Estado
FROM Empleado e
JOIN Sucursal s ON e.Id_Sucursal = s.Id_Sucursal;

--Actualizar un dato y verificar
UPDATE Empleado
SET Salario = 13000
WHERE Nombre = 'Juan' AND Apellido = 'P�rez';

-- Verificar el cambio
SELECT Nombre, Apellido, Salario
FROM Empleado
WHERE Nombre = 'Juan' AND Apellido = 'P�rez';

