-- Quiero consultar todos los juegos desarrollados por una empresa específica.
-- El nombre de la empresa es "Epic Games".
SELECT vg.name
FROM video_game vg
JOIN development_company dc ON vg.company_id = dc.id
WHERE dc.name = 'Epic Games';

-- Consulta para traer todos los videojuegos que corren en Nintendo Switch
SELECT vg.name AS videojuego, vg.genre AS genero, vg.release_year AS año_lanzamiento
FROM video_game vg
JOIN video_game_platform vgp ON vg.id = vgp.video_game_id
JOIN platform p ON vgp.platform_id = p.id
WHERE p.name = 'Nintendo Switch'
ORDER BY vg.name;

-- Consulta para traer todas las compañías que están en Japón
SELECT dc.name AS compania
FROM development_company dc
JOIN country c ON dc.country_id = c.id
WHERE c.name = 'Japón'
ORDER BY dc.name;

-- Consulta para traer todos los videojuegos que corren en PlayStation 4
SELECT vg.name AS videojuego, vg.genre AS genero, vg.release_year AS año_lanzamiento
FROM video_game vg
JOIN video_game_platform vgp ON vg.id = vgp.video_game_id
JOIN platform p ON vgp.platform_id = p.id
WHERE p.name = 'PlayStation 4'
ORDER BY vg.name;