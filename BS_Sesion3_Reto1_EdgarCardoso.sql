USE tienda;
-- 1
SELECT nombre FROM empleado WHERE id_puesto IN (SELECT id_puesto FROM puesto WHERE salario < 10000);

-- 2
SELECT MIN(conteo) AS conteo_minimo, MAX(conteo) AS conteo_maximo FROM 
(SELECT id_empleado, COUNT(id_articulo) AS conteo FROM venta GROUP BY id_empleado) as s1;

-- 3
SELECT clave FROM venta WHERE id_articulo IN (SELECT id_articulo FROM articulo WHERE precio > 5000);
