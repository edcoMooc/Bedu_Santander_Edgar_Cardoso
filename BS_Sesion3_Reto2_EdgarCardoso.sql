USE tienda;
-- 1
SELECT venta.clave, empleado.nombre, empleado.apellido_paterno FROM venta 
LEFT JOIN empleado ON venta.id_empleado = empleado.id_empleado;

-- 2
SELECT venta.clave, articulo.nombre FROM venta 
LEFT JOIN articulo ON venta.id_articulo = articulo.id_articulo;

-- 3
SELECT venta.clave, SUM(articulo.precio) FROM venta
LEFT JOIN articulo ON venta.id_articulo = articulo.id_articulo GROUP BY clave;