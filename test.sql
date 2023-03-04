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
