-- ===========================
-- SCRIPT 01: CREACIÓN DE TABLAS (DDL)
-- Actividad 2 - Base de Datos
-- ===========================

-- 1) Provincia
CREATE TABLE IF NOT EXISTS provincia (
    id_provincia SERIAL PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

-- 2) Municipio
CREATE TABLE IF NOT EXISTS municipio (
    id_municipio SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    id_provincia INT NOT NULL REFERENCES provincia(id_provincia)
);

-- 3) Empresa
CREATE TABLE IF NOT EXISTS empresa (
    id_empresa SERIAL PRIMARY KEY,
    nombre VARCHAR(150) UNIQUE NOT NULL
);

-- 4) Estación de Servicio
CREATE TABLE IF NOT EXISTS estacion_servicio (
    id_estacion SERIAL PRIMARY KEY,
    direccion VARCHAR(500),
    codigo_postal VARCHAR(10),
    margen VARCHAR(10),
    latitud NUMERIC(12,6),
    longitud NUMERIC(12,6),
    horario VARCHAR(800),
    tipo_servicio VARCHAR(200),
    id_municipio INT REFERENCES municipio(id_municipio),
    id_empresa INT REFERENCES empresa(id_empresa)
);

-- 5) Tipo de carburante
CREATE TABLE IF NOT EXISTS tipo_carburante (
    id_carburante SERIAL PRIMARY KEY,
    nombre VARCHAR(150) UNIQUE NOT NULL
);

-- 6) Precio por carburante y estación
CREATE TABLE IF NOT EXISTS precio (
    id_precio SERIAL PRIMARY KEY,
    id_estacion INT NOT NULL REFERENCES estacion_servicio(id_estacion),
    id_carburante INT NOT NULL REFERENCES tipo_carburante(id_carburante),
    precio NUMERIC(10,3),
    fecha_actualizacion TIMESTAMP
);

-- 7) Tabla RAW (datos originales del CSV)
CREATE TABLE IF NOT EXISTS precios_raw (
    provincia TEXT,
    municipio TEXT,
    localidad TEXT,
    codigo_postal TEXT,
    direccion TEXT,
    margen TEXT,
    longitud TEXT,
    latitud TEXT,
    toma_datos TEXT,
    precio_gasolina_95_e5 TEXT,
    precio_gasolina_95_e10 TEXT,
    precio_gasolina_95_e5_premium TEXT,
    precio_gasolina_98_e5 TEXT,
    precio_gasolina_98_e10 TEXT,
    precio_gasoleo_a TEXT,
    precio_gasoleo_premium TEXT,
    precio_gasoleo_b TEXT,
    precio_gasoleo_c TEXT,
    precio_bioetanol TEXT,
    porc_bioalcohol TEXT,
    precio_biodiesel TEXT,
    porc_ester_metilico TEXT,
    precio_glp TEXT,
    precio_gnc TEXT,
    precio_gnl TEXT,
    precio_hidrogeno TEXT,
    precio_95_e25 TEXT,
    precio_95_e85 TEXT,
    precio_adblue TEXT,
    precio_diesel_renovable TEXT,
    precio_gasolina_renovable TEXT,
    precio_metanol TEXT,
    precio_amoniaco TEXT,
    precio_bgnc TEXT,
    precio_bgnl TEXT,
    rotulo TEXT,
    tipo_venta TEXT,
    rem TEXT,
    horario TEXT,
    tipo_servicio TEXT
);
