-- 005_funcion_comerciantes.sql
-- -------------------------------------------------------
-- Reto 04: Función con cursor referenciado de comerciantes activos
-- -------------------------------------------------------

-- CABECERA DEL PAQUETE
CREATE OR REPLACE PACKAGE pkg_reportes AS
  TYPE ref_cursor IS REF CURSOR;

  FUNCTION comerciantes_activos RETURN ref_cursor;
END pkg_reportes;
/

-- CUERPO DEL PAQUETE
CREATE OR REPLACE PACKAGE BODY pkg_reportes AS

  FUNCTION comerciantes_activos RETURN ref_cursor IS
    v_cursor ref_cursor;
  BEGIN
    OPEN v_cursor FOR
      SELECT
        c.nombre_razon_social,
        c.municipio,
        c.telefono,
        c.correo_electronico,
        c.fecha_registro,
        c.estado,
        COUNT(e.id_establecimiento)         AS cantidad_establecimientos,
        NVL(SUM(e.ingresos), 0)             AS total_ingresos,
        NVL(SUM(e.num_empleados), 0)        AS total_empleados
      FROM
        comerciante c
        LEFT JOIN establecimiento e ON c.id_comerciante = e.id_comerciante
      WHERE
        c.estado = 'ACTIVO'
      GROUP BY
        c.id_comerciante,
        c.nombre_razon_social,
        c.municipio,
        c.telefono,
        c.correo_electronico,
        c.fecha_registro,
        c.estado
      ORDER BY
        COUNT(e.id_establecimiento) DESC;

    RETURN v_cursor;
  END comerciantes_activos;

END pkg_reportes;
/

