-- ==========================================
-- SCRIPT 02 - ETL 
-- ==========================================

-- 0. FUNCIÓN PARA FECHAS
DROP FUNCTION IF EXISTS parse_fecha_toma(text);

CREATE OR REPLACE FUNCTION parse_fecha_toma(text)
RETURNS timestamp AS $$
DECLARE
    v_text ALIAS FOR $1;
BEGIN
    IF v_text IS NULL OR TRIM(v_text) = '' THEN
        RETURN NULL;
    END IF;

    BEGIN
        RETURN TO_TIMESTAMP(v_text, 'DD/MM/YYYY HH24:MI');
    EXCEPTION WHEN OTHERS THEN
        BEGIN
            RETURN TO_TIMESTAMP(v_text, 'YYYY-MM-DD HH24:MI');
        EXCEPTION WHEN OTHERS THEN
            RETURN NULL;
        END;
    END;
END;
$$ LANGUAGE plpgsql;


-- ==========================================
-- 1. LIMPIAR RAW (primero borramos)
-- ==========================================

TRUNCATE TABLE precios_raw;
