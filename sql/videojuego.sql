CREATE DATABASE videojuego;
\c videojuego;

-- =========================================
-- EJECUTAR ARCHIVOS EN ORDEN CORRECTO
-- =========================================

-- 1. Crear e insertar países primero (sin dependencias)
\i /workspaces/dv-sqlpractice/sql/country.sql

-- 2. Crear e insertar fabricantes (depende de countries)
\i /workspaces/dv-sqlpractice/sql/manufacturer.sql

-- 3. Crear e insertar plataformas (depende de manufacturers)
\i /workspaces/dv-sqlpractice/sql/platform.sql

-- 4. Crear e insertar empresas desarrolladoras (depende de countries)
\i /workspaces/dv-sqlpractice/sql/development_company.sql

-- 5. Crear e insertar videojuegos (depende de development_company)
\i /workspaces/dv-sqlpractice/sql/video_game.sql

-- 6. Crear relaciones videojuego-plataforma (depende de video_game y platform)
\i /workspaces/dv-sqlpractice/sql/video_game_platform.sql

-- =========================================
-- NOTA: Las tablas y datos se crean automáticamente 
-- mediante los archivos \i incluidos arriba
-- =========================================

-- Las siguientes definiciones están comentadas porque 
-- se ejecutan automáticamente desde los archivos individuales:

/*
-- TABLE COUNTRY (definida en country.sql)
-- TABLE MANUFACTURER (definida en manufacturer.sql) 
-- TABLE PLATFORM (definida en platform.sql)
-- TABLE DEVELOPMENT_COMPANY (definida en development_company.sql)
-- TABLE VIDEO_GAME (definida en video_game.sql)
-- TABLE VIDEO_GAME_PLATFORM (definida en video_game_platform.sql)
*/


