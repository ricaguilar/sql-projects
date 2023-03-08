SELECT * FROM comics.tebeo;
DROP TABLE comics.tebeo;
DROP TABLE comics.autores;

CREATE TABLE tebeo(
	id INT,
    titulo VARCHAR(50),
    coleccion VARCHAR(20),
    precio DECIMAL(5,2),
    fecha_publicacion DATE,
    editorial VARCHAR(10),
    estado VARCHAR(10),
    PRIMARY KEY (id)
);

CREATE TABLE autores(
	id INT,
    nombre VARCHAR(20),
    apellido VARCHAR(20),
    PRIMARY KEY (id)
);

CREATE TABLE ilustradores(
	id INT,
    nombre VARCHAR(20),
    apellido VARCHAR(20),
    PRIMARY KEY (id)
);

CREATE TABLE comic_autor(
	id INT,
    comic_id INT,
    autor_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (comic_id) REFERENCES tebeo(id),
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

CREATE TABLE personajes(
	id INT,
    nombre VARCHAR(20),
    PRIMARY KEY (id)
);

ALTER TABLE personajes MODIFY COLUMN nombre VARCHAR(25);

CREATE TABLE comic_personajes(
	id INT,
    comic_id INT,
    personaje_id INT,
    PRIMARY KEY (id),
	FOREIGN KEY (personaje_id) REFERENCES personajes(id)
);

ALTER TABLE tebeo
ADD COLUMN paginas INT;
ALTER TABLE tebeo 
CHANGE COLUMN fecha_publicacion fecha_compra DATE;
ALTER TABLE tebeo
MODIFY COLUMN paginas INT AFTER editorial;
ALTER TABLE tebeo
MODIFY COLUMN coleccion VARCHAR(30);

INSERT INTO tebeo VALUES(1, 'Cuenta atras hacia la oscuridad', 'Biblioteca Caballero Luna', 
	15.20, null, 'Marvel', 120, 'leido'),
	(2, 'Deadpool mata al Universo Marvel', 'Marvel Must-Have', 14.25, null, 'Marvel', 104, 'leido'),
    (3, 'La guerra de Wade Wilson', 'Marvel Must-Have', 14.25, null, 'Marvel', 112, 'leido'),
    (4, 'La ultima caceria de Kraven', 'Marvel Must-Have', 17.10, null, 'Marvel', 160, 'leido'),
    (5, 'La conquista de uno mismo', 'Coleccion 100% Marvel', 14.25, null, 'Marvel', 128, 'leido'),
    (6, 'Fanatico Americano', 'Coleccion 100% Marvel', 11.88, '2023-01-26', 'Marvel', 120, 'leido'),
    (7, 'Arma X', 'Marvel Must-Have', 13.70, '2023-01-26', 'Marvel', 152, 'leido'),
    (8, 'El Fondo', 'Marvel Saga', 15.07, '2023-01-26', 'Marvel', 176, 'leido'),
    (9, 'Year One', null, 14.25, '2023-02-04', 'DC Comics', 144, 'leido'),
    (10, 'Sol de Medianoche', 'Marvel Saga', 20.90, '2023-02-23', 'Marvel', 208, 'no leido'),
    (11, 'Authority', null, 31.35, '2023-02-23', 'DC Comics', 320, 'no leido');

SELECT * FROM tebeo;
UPDATE tebeo SET fecha_compra = DATE_FORMAT(fecha_compra, '%d-%m-%Y');

INSERT INTO autores VALUES(
	1, 'Doug', 'Moench'),
	(2, 'Cullen', 'Bunn'),
    (3, 'Duane', 'Swierczynski'),
    (4, 'John Marc', 'DeMatteis'),
    (5, 'Colin', 'Kelly'),
    (6, 'Christopher', 'Priest'),
    (7, 'Barry', 'Windsor-Smith'),
    (8, 'Charlie', 'Huston'),
    (9, 'Frank', 'Miller'),
    (10, 'Warren', 'Ellis'
);

SELECT * FROM tebeo;
SELECT * FROM autores;
SELECT * FROM comic_autor;
SELECT * FROM personajes;

INSERT INTO personajes VALUES(
	1, 'Caballero Luna'),
	(2, 'Deadpool'),
    (3, 'Spiderman'),
    (4, 'Kang'),
    (5, 'U.S.Agent'),
    (6, 'Wolverine'),
    (7, 'Batman'),
    (8, 'Authority'
);

INSERT INTO comic_autor VALUES(
	1, 1, 1
);

INSERT INTO comic_autor VALUES(
	2, 2, 2),(3, 3, 3),
    (4, 4, 4),(5, 5, 5),
    (6, 6, 6),(7, 7, 7),
    (8, 8, 8),(9, 9, 9),
    (10, 10, 8),(11, 11, 10
);

INSERT INTO comic_personajes VALUES(
	1, 1, 1),(2, 2, 2),
    (3, 3, 2),(4, 4, 3),
    (5, 5, 4),(6, 6, 5),
    (7, 7, 6),(8, 8, 1),
    (9, 9, 7),(10, 10, 1),
    (11, 11, 8
);

SELECT * FROM tebeo;
SELECT * FROM autores;
SELECT * FROM comic_autor;
SELECT * FROM comic_personajes;
SELECT * FROM personajes;

INSERT INTO tebeo VALUES(12, 'La mision de medianoche', 'Caballero Luna 1', 
	16.15, null, 'Marvel', 144, 'wishlist'),
    (13, 'Demasiado duro para morir', 'Caballero Luna 2', 
	17.10, null, 'Marvel', 144, 'wishlist'),
    (14, 'Darkhold', 'Coleccion 100% Marvel', 
	18.05, null, 'Marvel', 184, 'wishlist'),
     (15, 'El camino de lo oculto', 'Marvel Premiere', 
	9.50, null, 'Marvel', 120, 'wishlist');

INSERT INTO personajes VALUES(
	9, 'Doctor Extraño');

INSERT INTO autores VALUES(11, 'Jed', 'MacKay');
INSERT INTO autores VALUES(12, 'Steve', 'Orlando');
INSERT INTO autores VALUES(13, 'Jason', 'Aaron');
INSERT INTO autores VALUES(14, 'Roy', 'Thomas');
INSERT INTO autores VALUES(15, 'Brian Michael', 'Bendis');
INSERT INTO autores VALUES(16, 'Mark', 'Millar');
INSERT INTO autores VALUES(17, 'Matt', 'Fraction');
INSERT INTO autores VALUES(18, 'Steve', 'Grant');
INSERT INTO autores VALUES(19, 'Nick', 'Spencer');
INSERT INTO autores VALUES(20, 'Jonathan', 'Hickman');
INSERT INTO autores VALUES(21, 'James', 'Robinson');
INSERT INTO autores VALUES(22, 'Scott', 'Snyder');
INSERT INTO autores VALUES(23, 'James', 'Tynion IV');
INSERT INTO autores VALUES(24, 'Grant', 'Morrison');
INSERT INTO autores VALUES(25, 'John', 'Ostrander');
INSERT INTO autores VALUES(26, 'Jeph', 'Loeb');
INSERT INTO autores VALUES(27, 'Mike', 'Benson');
INSERT INTO autores VALUES(28, 'Ed', 'Brubaker');
INSERT INTO autores VALUES(29, 'Rick', 'Remender');
INSERT INTO autores VALUES(30, 'Christopher', 'Cantwell');
INSERT INTO autores VALUES(31, 'Kieron', 'Gillen');
INSERT INTO autores VALUES(32, 'Tom', 'Taylor');
INSERT INTO autores VALUES(33, 'Greg', 'Pak');
INSERT INTO autores VALUES(34, 'Larry', 'Hama');
INSERT INTO autores VALUES(35, 'Alan', 'Moore');
INSERT INTO autores VALUES(36, 'J. Michael', 'Straczynski');
INSERT INTO autores VALUES(37, 'Margaret', 'Stohl');
INSERT INTO autores VALUES(38, 'Greg', 'Rucka');
INSERT INTO autores VALUES(39, 'Stjepan', 'Sejic');
INSERT INTO autores VALUES(40, 'Andrea', 'Sorrentino');
INSERT INTO autores VALUES(41, 'Sean', 'Murphy');
INSERT INTO autores VALUES(42, 'Garth', 'Ennis');

INSERT INTO personajes VALUES(10, 'Vengadores');
INSERT INTO personajes VALUES(11, 'Nuevos Vengadores');
INSERT INTO personajes VALUES(12, 'Patrulla X');
INSERT INTO personajes VALUES(13, 'Thunderbolts');
INSERT INTO personajes VALUES(14, 'Vengadores Oscuros');
INSERT INTO personajes VALUES(15, 'Thor');
INSERT INTO personajes VALUES(16, 'Punisher');
INSERT INTO personajes VALUES(17, 'Guerreros Secretos');
INSERT INTO personajes VALUES(18, 'Bruja Escarlata');
INSERT INTO personajes VALUES(19, 'Joker');
INSERT INTO personajes VALUES(20, 'Iron Man');
INSERT INTO personajes VALUES(21, 'Capitan America');
INSERT INTO personajes VALUES(22, 'Doctor Doom');
INSERT INTO personajes VALUES(23, 'Hulk');
INSERT INTO personajes VALUES(24, 'Daredevil');
INSERT INTO personajes VALUES(25, 'Ojo de Halcon');
INSERT INTO personajes VALUES(26, '4 Fantasticos');
INSERT INTO personajes VALUES(27, 'Watchmen');
INSERT INTO personajes VALUES(28, 'Spiderman Noir');
INSERT INTO personajes VALUES(29, 'Imposibles Vengadores');
INSERT INTO personajes VALUES(30, 'Gotham Central');
INSERT INTO personajes VALUES(31, 'Harley Quinn');
INSERT INTO personajes VALUES(32, 'Ghost Rider');

INSERT INTO tebeo VALUES(
	16, 'Los ultimos dias de la magia', 'Marvel Premiere', 
	12.30, null, 'Marvel', 176, 'wishlist'),
    (17, 'La guerra Kree-Skrull', 'Marvel Premiere', 
	16.10, null, 'Marvel', 216, 'wishlist'),
    (18, 'Parche', null, 
	13.30, null, 'Marvel', 120, 'wishlist'),
    (19, 'Desunidos', 'Marvel Must-Have', 
	17.10, null, 'Marvel', 176, 'wishlist'),
    (20, 'Fuga', 'Marvel Must-Have', 
	17.10, null, 'Marvel', 168, 'wishlist'),
    (21, 'Dinastia de M', 'Marvel Must-Have', 
	17.10, null, 'Marvel', 112, 'wishlist'),
    (22, 'Civil War', 'Marvel Must-Have', 
	17.10, null, 'Marvel', 208, 'wishlist'),
    (23, 'La ascension de Norman Osborn', 'Marvel Must-Have', 
	22.80, null, 'Marvel', 304, 'wishlist'),
    (24, 'Illuminati', 'Marvel Must-Have', 
	17.10, null, 'Marvel', 136, 'wishlist'),
    (25, 'Invasion Secreta', 'Marvel Must-Have', 
	17.10, null, 'Marvel', 240, 'wishlist'),
    (26, 'Invasion Secreta', 'Marvel Must-Have', 
	19.00, null, 'Marvel', 160, 'wishlist'),
    (27, 'Reunion', 'Marvel Must-Have', 
	19.00, null, 'Marvel', 184, 'wishlist'),
    (28, 'Las guerras asgardianas', 'Marvel Must-Have', 
	14.25, null, 'Marvel', 144, 'wishlist'),
    (29, 'Las edades del trueno', '100% Marvel HC', 
	15.68, null, 'Marvel', 184, 'wishlist'),
	(30, 'Circulo de sangre', '100% Marvel HC', 
	24.70, null, 'Marvel', 312, 'wishlist'),
    (31, 'Regreso a las esencias', 'Marvel Premiere', 
	10.45, null, 'Marvel', 152, 'wishlist'),
    (32, 'Regreso a las esencias', 'Marvel Premiere', 
	10.45, null, 'Marvel', 152, 'wishlist'),
    (33, 'Amanecer de X 01', 'Marvel Premiere', 
	17.10, null, 'Marvel', 272, 'wishlist'),
    (34, 'La dinastia que creo Xavier', 'Marvel Premiere', 
	10.45, null, 'Marvel', 112, 'wishlist'),
    (35, 'Nick Furia, agente de nada', 'Marvel Saga', 
	18.05, null, 'Marvel', null, 'wishlist'),
    (36, 'La senda de las brujas', null, 
	33.25, null, 'Marvel', 344, 'wishlist'),
    (37, 'El viejo Logan', 'Marvel Must-Have', 
	17.10, null, 'Marvel', 240, 'wishlist'),
    (38, 'El ultimo caballero de la tierra', null, 
	20.43, null, 'DC Comics', 192, 'wishlist'),
    (39, 'La ascencion de los hombres murcielago', null, 
	17.05, null, 'DC Comics', 176, 'wishlist'),
    (40, 'El regreso del caballero oscuro', 'Edicion Deluxe', 
	30.40, null, 'DC Comics', 240, 'wishlist'),
	(41, 'Asilo Arkham', 'Edicion Deluxe', 
	30.40, null, 'DC Comics', 232, 'wishlist'),
    (42, 'La guerra del Joker', null, 
	21.85, null, 'DC Comics', 160, 'wishlist'),
	(43, 'El tribunal de los buhos', 'Edicion Deluxe', 
	40.85, null, 'DC Comics', 360, 'wishlist'),
    (44, 'Grotesk', 'Batman e hijo', 
	12.83, null, 'DC Comics', 104, 'wishlist'),
    (45, 'Batman e hijo', 'Batman e hijo', 
	21.85, null, 'DC Comics', 240, 'wishlist'),
	(46, 'La resurrecion de Ra´s Al Ghul', 'Batman e hijo', 
	27.08, null, 'DC Comics', 288, 'wishlist'),
    (47, 'Silencio', null, 
	31.35, null, 'DC Comics', 320, 'wishlist'),
	(48, 'Dios y patria', 'Marvel Saga', 
	19.95, null, 'Marvel', 192, 'wishlist'),
    (49, 'La muerte de Marc Spector', 'Marvel Saga', 
	22.80, null, 'Marvel', 200, 'wishlist'),
    (50, 'Secret Wars', 'Marvel Now', 
	39.90, null, 'Marvel', 344, 'wishlist'),
    (51, 'Dios del miedo, Dios de la guerra', 'Marvel Saga', 
	15.20, null, 'Marvel', 144, 'wishlist'
);

INSERT INTO tebeo VALUES(
	52, 'Invasion Secreta', 'Marvel Deluxe', 
	28.45, null, 'Marvel', 304, 'wishlist');

INSERT INTO tebeo VALUES(
	53, 'Extremis', 'Marvel Must-Have', 
	14.25, null, 'Marvel', 168, 'wishlist');
    
UPDATE tebeo SET coleccion = 'Heroes Marvel' WHERE id = 14;
UPDATE tebeo SET coleccion = 'Heroes Marvel' WHERE id = 5;
UPDATE tebeo SET coleccion = 'Heroes Marvel' WHERE id = 6;

INSERT INTO tebeo VALUES(
	54, 'Civil War', 'Marvel Integral', 
	23.75, null, 'Marvel', 280, 'wishlist');
    
INSERT INTO tebeo VALUES(
	55, 'Soldado de invierno', 'Marvel Integral', 
	28.50, null, 'Marvel', 352, 'wishlist');
    
INSERT INTO tebeo VALUES(
	56, 'Dinastia de M', 'Marvel Deluxe', 
	22.75, null, 'Marvel', 256, 'wishlist');
    
UPDATE tebeo SET coleccion = '100% Marvel' WHERE id = 18;
UPDATE tebeo SET titulo = 'Regreso a Madripur' WHERE id = 18;

INSERT INTO tebeo VALUES(
	57, 'VxX: Primera parte', 'Marvel Deluxe', 
	18.95, null, 'Marvel', 200, 'wishlist'),
    (58, 'VxX: Segunda parte', 'Marvel Deluxe', 
	22.75, null, 'Marvel', 264, 'wishlist'
);

INSERT INTO tebeo VALUES(
	59, 'Origen', '100% Marvel HC', 
	26.55, null, 'Marvel', 280, 'wishlist');
    
INSERT INTO tebeo VALUES(
	60, 'Pottersville', 'Doctor Muerte', 
	13.30, null, 'Marvel', 136, 'wishlist'),
    (61, 'Bedford Falls', 'Doctor Muerte', 
	12.35, null, 'Marvel', 112, 'wishlist'
);
    
INSERT INTO tebeo VALUES(62, 'Amenaza roja', 'Marvel Deluxe',
	18.95, null, 'Marvel', 208, 'wishlist');
    
INSERT INTO tebeo VALUES(
	63, 'El carnicero de dioses', 'Marvel Now',
	27.50, null, 'Marvel', 304, 'wishlist'),
    (64, 'La diosa del trueno', 'Marvel Now',
	36.10, null, 'Marvel', 368, 'wishlist'
);
    
INSERT INTO tebeo VALUES(
	65, 'Las 5 pesadillas', 'Marvel Deluxe',
	18.95, null, 'Marvel', 208, 'wishlist');
    
INSERT INTO tebeo VALUES(
	66, 'Los anillos del Mandarin', 'Marvel Now',
	26.60, null, 'Marvel', 280, 'wishlist');
    
INSERT INTO tebeo VALUES(
	67, 'Axis', 'Marvel Now',
	34.15, null, 'Marvel', 384, 'wishlist');
    
INSERT INTO tebeo VALUES(
	68, 'Superior Iron Man', 'Marvel Now',
	23.75, null, 'Marvel', 248, 'wishlist');

INSERT INTO tebeo VALUES(
	69, 'Planeta Hulk', 'Marvel Must-Have',
	22.80, null, 'Marvel', 376, 'wishlist'),
	(70, 'World War Hulk', 'Marvel Deluxe',
	20.85, null, 'Marvel', 224, 'wishlist'
);

INSERT INTO comic_autor VALUES(
	12, 12, 11),(13, 13, 11),(14, 14, 12),(15, 15, 13),
    (16, 16, 13),(17, 17, 14),(18, 18, 34),(19, 19, 15),
    (20, 20, 15),(21, 21, 15),(22, 22, 16),(23, 23, 10),
    (24, 24, 15),(25, 25, 15),(26, 26, 15),(27, 27, 15),
    (28, 28, 15),(29, 29, 17),(30, 30, 18),(31, 31, 19),
    (32, 32, 27),(33, 33, 20),(34, 34, 20),(35, 35, 20
);

INSERT INTO comic_autor VALUES(
	36, 36, 21),(37, 37, 16),(38, 38, 22),(39, 39, 23),
    (40, 40, 9),(41, 41, 24),(42, 42, 23),(43, 43, 22),
    (44, 44, 25),(45, 45, 24),(46, 46, 24),(47, 47, 26),
    (48, 48, 3),(49, 49, 27),(50, 50, 20),(51, 51, 20),
    (52, 52, 15),(53, 53, 10),(54, 54, 16),(55, 55, 28),
    (56, 56, 15),(57, 57, 15),(58, 58, 15),(59, 59, 28),
    (60, 60, 30),(61, 61, 31),(62, 62, 28),(63, 63, 13),
    (64, 64, 13),(65, 65, 17),(66, 66, 31),(67, 67, 29),
    (68, 68, 32),(69, 69, 33),(70, 70, 33
);

UPDATE comic_autor SET autor_id = 30 WHERE id = 61;

INSERT INTO comic_personajes VALUES(
	12, 12, 1),(13, 13, 1),(14, 14, 10),(15, 15, 9),(16, 16, 9),(17, 17, 10),
    (18, 18, 6),(19, 19, 10),(20, 20, 11),(21, 21, 10),(22, 22, 10),(23, 23, 13),
    (24, 24, 11),(25, 25, 11),(26, 26, 11),(27, 27, 14),(28, 28, 10),(29, 29, 15),
    (30, 30, 16),(31, 31, 3),(32, 32, 1),(33, 33, 12),(34, 34, 12),(35, 35, 17
    );

INSERT INTO comic_personajes VALUES(
	36, 36, 18),(37, 37, 6),(38, 38, 7),(39, 39, 7),(40, 40, 7),(41, 41, 7),
    (42, 42, 19),(43, 43, 7),(44, 44, 7),(45, 45, 7),(46, 46, 7),(47, 47, 7),
    (48, 48, 1),(49, 49, 1),(50, 50, 10),(51, 51, 17),(52, 52, 10),(53, 53, 20),
    (54, 54, 10),(55, 55, 21),(56, 56, 10),(57, 57, 12),(58, 58, 12),(59, 59, 22),
    (60, 60, 22),(61, 61, 22),(62, 62, 21),(63, 63, 15),(64, 64, 15),(65, 65, 20),
    (66, 66, 20),(67, 67, 10),(68, 68, 20),(69, 69, 23),(70, 70, 23
);

INSERT INTO comic_personajes VALUES(
71,71,21),(72,72,21),(73,73,21),(74,74,21),(75,75,27);

INSERT INTO comic_autor VALUES(
71, 71, 19),(72, 72, 19),(73, 73, 19),(74, 74, 19),(75, 75, 36);

INSERT INTO tebeo VALUES(
	71, 'Capitan Anti-america', 'Marvel Now',
	33.25, null, 'Marvel', 360, 'wishlist'),
	(72, 'Heil Hydra', 'Marvel Now',
	28.50, null, 'Marvel', 304, 'wishlist'),
    (73, 'La construccion de un Imperio', 'Marvel Now',
	33.25, null, 'Marvel', 336, 'wishlist'),
    (74, 'Imperio Secreto', 'Marvel Now',
	36.10, null, 'Marvel', 336, 'wishlist'),
    (75, 'Buho Nocturno', 'Antes de Watchmen',
	14.20, null, 'Marvel', 120, 'wishlist'
);

INSERT INTO tebeo VALUES(
	76, 'The killing joke', null,
	16.29, null, 'DC Comics', 96, 'wishlist'
);

INSERT INTO comic_personajes VALUES(76,76,7);
INSERT INTO comic_autor VALUES(76, 76, 35);

UPDATE tebeo SET editorial = 'DC Comics' WHERE id = 75;
UPDATE tebeo SET coleccion = 'Edicion Deluxe' WHERE id = 76;
UPDATE tebeo SET estado = 'leido' WHERE id = 10;
UPDATE comic_personajes SET personaje_id = 29 WHERE id = 67;

INSERT INTO tebeo VALUES(
	77, 'Crepusculo en Babilonia', '100% Marvel',
	12.35, null, 'Marvel', 129, 'wishlist'
);

INSERT INTO comic_personajes VALUES(77,77,28);
INSERT INTO comic_autor VALUES(77, 77, 37);

INSERT INTO tebeo VALUES(
	78, 'Ragnarok', 'Marvel Now',
	36.10, null, 'Marvel', 344, 'wishlist'),
	(79, 'Naufrago en la dimension Z', 'Marvel Now',
	24.70, null, 'Marvel', 264, 'wishlist'),
    (80, 'El clavo de hierro', 'Marvel Now',
	26.60, null, 'Marvel', 280, 'wishlist'),
	(81, 'El soldado del mañana', 'Marvel Now',
	26.60, null, 'Marvel', 264, 'wishlist'),
    (82, 'Sombra roja', 'Marvel Now',
	33.20, null, 'Marvel', 344, 'wishlist'),
	(83, 'Todo muere', 'Marvel Now',
	28.50, null, 'Marvel', 312, 'wishlist'),
    (84, 'El ultimo evento blanco', 'Marvel Now',
	27.50, null, 'Marvel', 288, 'wishlist'),
    (85, 'La guerra de los reinos', 'Marvel Now',
	24.70, null, 'Marvel', 200, 'wishlist'
);

INSERT INTO comic_personajes VALUES(78,78,29),(79,79,21),(80,80,21),(81,81,21),
								(82,82,29),(83,83,10),(84,84,10),(85,85,null);
INSERT INTO comic_autor VALUES(78, 78, 29),(79,79,29),(80,80,29),(81,81,29),
							(82,82,29),(83,83,20),(84,84,20),(85,85,13);

INSERT INTO tebeo VALUES(
	86, 'Infierno en la tierra', null,
	34.68, null, 'DC Comics', 416, 'wishlist'),
	(87, 'Planetary', null,
	38.00, null, 'DC Comics', 432, 'wishlist'),
    (88, 'Planetary', null,
	38.95, null, 'DC Comics', 440, 'wishlist'
);

INSERT INTO comic_autor VALUES(86, 86, 16),(87,87,10),(88,88,10);
INSERT INTO comic_personajes VALUES(86,86,8),(87,87,8),(88,88,8);

INSERT INTO tebeo VALUES(
	89, 'In the line of duty', 'Gotham Central',
	16.29, null, 'DC Comics', 235, 'wishlist'),
	(90, 'Jokers and Madmen', 'Gotham Central',
	21.07, null, 'DC Comics', 285, 'wishlist'),
    (91, 'Corrigan', 'Gotham Central',
	16.52, null, 'DC Comics', 221, 'wishlist'
);

INSERT INTO comic_autor VALUES(89, 89, 28),(90,90,28),(91,91,38);
INSERT INTO comic_personajes VALUES(89,89,30),(90,90,30),(91,91,30);

INSERT INTO tebeo VALUES(
	92, 'Harleen', null,
	23.28, null, 'DC Comics', 208, 'wishlist'),
	(93, 'El impostor', null,
	18.95, null, 'DC Comics', 168, 'wishlist'),
    (94, 'La maldicion del caballero blanco', null,
	27.55, null, 'DC Comics', 272, 'wishlist'),
    (95, 'Autopista al infierno', 'Marvel Deluxe',
	15.20, null, 'Marvel', 152, 'wishlist'
);

INSERT INTO comic_autor VALUES(92, 92, 39),(93,93,40),(94,94,41),(95,95,42);
INSERT INTO comic_personajes VALUES(92,92,31),(93,93,7),(94,94,7),(95,95,32);

SELECT * FROM tebeo;
SELECT * FROM autores