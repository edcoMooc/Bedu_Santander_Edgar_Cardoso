USE tienda;

-- 1
CREATE VIEW puestos AS 
SELECT CONCAT(empleado.nombre, ' ',empleado.apellido_paterno) AS nombre, puesto.nombre AS puesto FROM empleado 
LEFT JOIN puesto ON empleado.id_puesto = puesto.id_puesto;

-- 2
CREATE VIEW empleado_articulos AS
SELECT sub1.clave AS clave_venta, CONCAT(empleado.nombre, ' ', empleado.apellido_paterno) AS nombre_empleado, 
sub1.nombre AS nombre_articulo FROM 
(SELECT venta.clave AS clave, venta.id_empleado AS id_empleado, 
articulo.nombre AS nombre FROM venta 
LEFT JOIN articulo ON venta.id_articulo = articulo.id_articulo) AS sub1
LEFT JOIN empleado ON sub1.id_empleado = empleado.id_empleado;

-- 3
CREATE VIEW numero_ventas AS
SELECT p.nombre puesto, COUNT(sub1.id_venta) conteo_ventas FROM
(SELECT v.id_venta id_venta, e.id_puesto id_puesto FROM venta v 
LEFT JOIN empleado e ON v.id_empleado = e.id_empleado) sub1
LEFT JOIN puesto p ON sub1.id_puesto = p.id_puesto GROUP BY puesto;

