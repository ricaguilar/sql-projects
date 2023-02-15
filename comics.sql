CREATE TABLE comics.comics(
	id SERIAL,
    nombre VARCHAR(50),
    titulo VARCHAR(50),
    fecha_publicacion DATE,
    escritor VARCHAR(40),
    dibujante VARCHAR(40),
    paginas NUMERIC,
    editorial_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (editorial_id) REFERENCES editorial(id)
);

DROP TABLE comics;
SELECT * FROM comics;

INSERT INTO comics(
	nombre, titulo, fecha_publicacion, 
	escritor, dibujante, paginas, editorial_id) VALUES(
	'Biblioteca Caballero Luna 1', 'Cuenta atras hacia la oscuridad', '2022-02-10', 'Doug Moench', 
    'Bill Sienkiewicz', 192, 1),
    ('Deadpool', 'Mata al Universo Marvel', '2020-10-01', 'Cullen Bunn', 
    'Dalibor Talajic', 104, 1),
	('Deadpool', 'La guerra de Wade Wilson', '2021-08-01', 'Duane Swierczynski', 
    'Jason Pearson', 112, 1),
    ('Spiderman', 'La ultima caceria de Kraven', '2021-07-28', 'J.M. DeMatteis', 
    'Mike Zeck', 160, 1),
    ('Kang El Conquistador', 'La conquista de uno mismo', '2022-04-21', 'Collin Kelly, Jackson Lanzing', 
    'Carlos Magno', 128, 1),
    ('US Agent', 'Fanatico Americano', '2021-10-28', 'Christopher J. Priest', 
    'Georges Jeanty', 120, 1),
    ('Wolverine', 'Arma X', '2022-04-28', 'Barry Windsor-Smith', 
    'Barry Windsor-Smith', 152, 1),
    ('Caballero Luna', 'El Fondo', '2022-02-10', 'Charlie Huston', 
    'David Finch', 176, 1),
	('Batman', 'Year One', '2007-01-10', 'Frank Miller', 
    'David Mazzucchelli', 144, 3
);
    
UPDATE comics SET nombre = 'Caballero Luna' 
WHERE nombre = 'Biblioteca Caballero Luna 1';

SELECT * FROM comics;

CREATE TABLE editorial(
	id INT PRIMARY KEY,
    nombre VARCHAR(50),
    ciudad VARCHAR(50),
    pais VARCHAR(50)
);

SELECT * FROM editorial;
DROP TABLE editorial;

INSERT INTO editorial VALUES(
	1, 'Panini Comics', 'Modena', 'Italia'
);
INSERT INTO editorial VALUES(
	2, 'ECC Ediciones', 'Barcelona', 'España'
);
INSERT INTO editorial VALUES(
	3, 'DC Comics', 'California', 'Estados Unidos'
);

CREATE TABLE coleccion (
    comic_id SERIAL,
    nombre VARCHAR(50),
    titulo VARCHAR(50),
	condicion VARCHAR(50),
    precio NUMERIC(4,2),
    formato VARCHAR(50),
    FOREIGN KEY (comic_id) REFERENCES marvel_comics(id)
);

SELECT * FROM coleccion;
DROP TABLE coleccion;

INSERT INTO coleccion(nombre, titulo, condicion, precio, formato) VALUES(
	'Caballero Luna', 'Cuenta atras hacia la oscuridad', 'leido', 15.20, 'Cartone'
);

SELECT * FROM comics;

ALTER TABLE comics
ADD COLUMN status VARCHAR(40);

UPDATE comics SET status = 'leido';