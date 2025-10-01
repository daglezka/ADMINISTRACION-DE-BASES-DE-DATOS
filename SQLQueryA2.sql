--CONTABILIZA LOS CLIENTES SE TUVO EN X AÑO
SELECT COUNT(*) AS TotalClientes2021 --
FROM factura
WHERE YEAR(fecha) = 2022; 

--CONTABILIZA CLIENTES DE DICIEMBRE DEL AÑO 2021
SELECT COUNT(*) AS TotalClientesDiciembre2021
FROM factura
WHERE YEAR(fecha) = 2021 and MONTH (fecha) = 12;

--Modifiqué el tipo de dato para poder ordenar los nombres de los clientes
--alfebéticamente
ALTER TABLE Cliente
ALTER COLUMN nombre VARCHAR(100);

ALTER TABLE producto
ALTER COLUMN nombre VARCHAR(100);

--Compras realizadas por clientes específicos
SELECT 
    c.nombre AS Nombre,
    c.apellido AS Apellido,
    cat.nombre AS Producto,
    d.cantidad,
    d.precio,
    f.fecha AS FechaCompra
FROM Cliente c
JOIN Factura f ON c.id_cliente = f.id_cliente
JOIN Detalle d ON f.id_factura = d.id_factura
JOIN Categoria cat ON d.id_producto = cat.id_categoria
WHERE (c.nombre = 'Valentina Anastasia' AND c.apellido = 'Huerta Corral')
   OR (c.nombre = 'Zayra Manuela' AND c.apellido = 'Gómez López')
   OR (c.nombre = 'Dante Eduardo' AND c.apellido = 'Dolores Meza')
   OR (c.nombre = 'Ana Maribel' AND c.apellido = 'Cedillo Núñez')
   OR (c.nombre = 'Rodrigo Ismael' AND c.apellido = 'Silva Ugarte');

--Agregar llave foránea
ALTER TABLE detalle
ADD id_factura INT NULL;

UPDATE detalle
SET id_factura = 1 

ALTER TABLE detalle
ALTER COLUMN id_factura INT NOT NULL;

ALTER TABLE Detalle
ADD CONSTRAINT FK_Detalle_Factura
FOREIGN KEY (id_factura) REFERENCES Factura(id_factura);

--Producto con más stock
SELECT TOP 1 p.nombre, i.stock
FROM producto i
JOIN producto p ON i.id_producto = p.id_producto
ORDER BY i.stock DESC;

--Ordena fecha de compra de mas antiguo a mas reciente
SELECT co.id_factura, c.Nombre, c.Apellido, co.fecha
FROM factura co
JOIN Cliente c ON co.Id_Cliente = c.Id_Cliente
ORDER BY co.fecha ASC;

--Ordena nombres alfabéticamente
SELECT Nombre, Apellido
FROM Cliente
ORDER BY Nombre ASC, Apellido ASC;

--Nombre de encargado de cada sucursal
SELECT NombreSucursal, NombreEncargado
FROM Sucursal;

--Empleados de sucursal Constitución
SELECT e.Nombre, e.Apellido, e.Puesto
FROM Empleado e
JOIN Sucursal s ON e.Id_Sucursal = s.Id_Sucursal
WHERE s.NombreSucursal = 'Akira''s Boutique: Durango';

--Muestra clientes mayores de 30 años
SELECT Nombre, Apellido, fec_nac,
       DATEDIFF(YEAR, fec_nac, GETDATE()) AS Edad
FROM Cliente
WHERE DATEDIFF(YEAR, fec_nac, GETDATE()) > 30;

--Contabiliza cuántos productos hay en cada categoría
SELECT id_categoria, COUNT(*) AS TotalProductos
FROM Producto
GROUP BY id_categoria;

--Producto mas vendido
SELECT TOP 1 p.nombre, SUM(d.Cantidad) AS TotalVendido
FROM detalle d
JOIN Producto p ON d.Id_Producto = p.Id_Producto
GROUP BY p.nombre
ORDER BY TotalVendido DESC;
