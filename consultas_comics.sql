SELECT * FROM comics.tebeo;

SELECT t.id, t.titulo, p.nombre, t.precio
FROM tebeo t
LEFT JOIN comic_personajes cp ON t.id = cp.comic_id
LEFT JOIN personajes p ON cp.personaje_id = p.id;

-- Mostrar titulo, nombre del personaje y autor de los comics comprados esten leidos o no leidos
-- Unir nombre y apellido del autor en una sola columna 'escritor'
SELECT t.id, t.titulo, p.nombre, CONCAT(a.nombre, ' ', a.apellido) AS escritor, t.precio, t.editorial, t.estado
FROM tebeo t
LEFT JOIN comic_autor ca ON t.id = ca.comic_id
LEFT JOIN autores a ON ca.autor_id = a.id
LEFT JOIN comic_personajes cp ON t.id = cp.comic_id
LEFT JOIN personajes p ON cp.personaje_id = p.id;

-- Cuanto he gastado en comics de los que estan leidos?
SELECT SUM(t.precio) AS total_gastado, t.estado
FROM tebeo t
JOIN comic_autor ca ON t.id = ca.comic_id
JOIN autores a ON ca.autor_id = a.id
JOIN comic_personajes cp ON t.id = cp.comic_id
JOIN personajes p ON cp.personaje_id = p.id
WHERE estado = 'leido'
GROUP BY t.estado;

-- Cuanto he gastado en comics en total? agrupar leidos y no leidos
SELECT SUM(t.precio) AS total_gastado, t.estado
FROM tebeo t
JOIN comic_autor ca ON t.id = ca.comic_id
JOIN autores a ON ca.autor_id = a.id
JOIN comic_personajes cp ON t.id = cp.comic_id
JOIN personajes p ON cp.personaje_id = p.id
WHERE estado IN ('leido', 'no leido')
GROUP BY t.estado;

-- Cual es el autor mas repetido en la lista de comics?
SELECT CONCAT(a.nombre, ' ', a.apellido) AS escritor, COUNT(*) AS total_comics
FROM tebeo t
JOIN comic_autor ca ON t.id = ca.comic_id
JOIN autores a ON ca.autor_id = a.id
JOIN comic_personajes cp ON t.id = cp.comic_id
JOIN personajes p ON cp.personaje_id = p.id
WHERE estado IN ('leido', 'no leido', 'wishlist')
GROUP BY escritor
ORDER BY total_comics DESC;

-- Cual es el comic mas caro comprado? Ordenar por precios
SELECT t.titulo, MAX(t.precio) AS precio_maximo
FROM tebeo t
WHERE estado IN ('leido', 'no leido')
GROUP BY t.titulo
ORDER BY precio_maximo DESC;
