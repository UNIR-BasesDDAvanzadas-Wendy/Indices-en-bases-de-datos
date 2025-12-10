-- ==================================================
-- SCRIPT 03: Consultas finales y verificaciones
-- ==================================================

-- 1) Estadísticas básicas
SELECT 'provincias' AS item, COUNT(*) AS total FROM provincia;
SELECT 'municipios' AS item, COUNT(*) AS total FROM municipio;
SELECT 'empresas' AS item, COUNT(*) AS total FROM empresa;
SELECT 'estaciones' AS item, COUNT(*) AS total FROM estacion_servicio;
SELECT 'tipos_carburante' AS item, COUNT(*) AS total FROM tipo_carburante;
SELECT 'precios' AS item, COUNT(*) AS total FROM precio;

-- 2) Empresa con más estaciones terrestres (ejemplo simple)
SELECT e.nombre, COUNT(*) AS estaciones
FROM empresa e
JOIN estacion_servicio es ON es.id_empresa = e.id_empresa
WHERE LOWER(COALESCE(es.tipo_servicio,'')) NOT ILIKE '%barco%'
GROUP BY e.nombre
ORDER BY estaciones DESC
LIMIT 1;

-- 3) Empresa con más estaciones marítimas (ejemplo simple)
SELECT e.nombre, COUNT(*) AS estaciones_mar
FROM empresa e
JOIN estacion_servicio es ON es.id_empresa = e.id_empresa
WHERE LOWER(COALESCE(es.tipo_servicio,'')) ILIKE '%barco%' OR LOWER(COALESCE(es.tipo_servicio,'')) ILIKE '%marina%'
GROUP BY e.nombre
ORDER BY estaciones_mar DESC
LIMIT 1;

-- 4) Estación más barata para Gasolina 95 E5 en la Comunidad de Madrid
SELECT p.precio, tc.nombre AS carburante, es.direccion, m.nombre AS municipio, pr.nombre AS provincia, e.nombre AS empresa
FROM precio p
JOIN tipo_carburante tc ON p.id_carburante = tc.id_carburante
JOIN estacion_servicio es ON p.id_estacion = es.id_estacion
JOIN municipio m ON es.id_municipio = m.id_municipio
JOIN provincia pr ON m.id_provincia = pr.id_provincia
JOIN empresa e ON es.id_empresa = e.id_empresa
WHERE tc.nombre = 'Gasolina 95 E5' AND pr.nombre ILIKE 'MADRID'
ORDER BY p.precio ASC
LIMIT 1;

-- 5) Estación más barata para Gasóleo A a menos de 10 km del centro de Albacete
-- Ejemplo con fórmula Haversine (centro aproximado de Albacete: lat 38.9943, lon -1.8585)
SELECT p.precio, es.direccion, e.nombre AS empresa, m.nombre AS municipio,
       ( 6371 * acos( cos(radians(38.9943)) * cos(radians(es.latitud)) * cos(radians(es.longitud) - radians(-1.8585)) + sin(radians(38.9943)) * sin(radians(es.latitud)) ) ) AS distancia_km
FROM precio p
JOIN tipo_carburante tc ON p.id_carburante = tc.id_carburante
JOIN estacion_servicio es ON p.id_estacion = es.id_estacion
JOIN empresa e ON es.id_empresa = e.id_empresa
JOIN municipio m ON es.id_municipio = m.id_municipio
WHERE tc.nombre='Gasóleo A'
HAVING ( 6371 * acos( cos(radians(38.9943)) * cos(radians(es.latitud)) * cos(radians(es.longitud) - radians(-1.8585)) + sin(radians(38.9943)) * sin(radians(es.latitud)) ) ) < 10
ORDER BY p.precio ASC
LIMIT 1;

-- 6) Provincia con la estación marítima más cara de Gasolina 95 E5
SELECT pr.nombre AS provincia, p.precio AS max_precio
FROM precio p
JOIN tipo_carburante tc ON p.id_carburante = tc.id_carburante
JOIN estacion_servicio es ON p.id_estacion = es.id_estacion
JOIN municipio m ON es.id_municipio = m.id_municipio
JOIN provincia pr ON m.id_provincia = pr.id_provincia
WHERE tc.nombre='Gasolina 95 E5' AND (LOWER(COALESCE(es.tipo_servicio,'')) ILIKE '%mar%' OR LOWER(COALESCE(es.tipo_servicio,'')) ILIKE '%barco%')
ORDER BY p.precio DESC
LIMIT 1;

-- End of queries script

