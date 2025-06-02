CREATE DATABASE easyfiction;
USE easyfiction;

CREATE TABLE fotos_perfil (
id INT PRIMARY KEY AUTO_INCREMENT,
personagem VARCHAR (45),
artista VARCHAR (45),
caminho_arquivo VARCHAR (100)
);

CREATE TABLE usuarios (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45),
dt_Nasc DATE,
nome_exibicao VARCHAR (45),
email VARCHAR (100),
senha VARCHAR (45),
fk_fotos_perfil INT,
	FOREIGN KEY (fk_fotos_perfil) REFERENCES fotos_perfil (id)
);

CREATE TABLE titulos (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (100),
roteirista VARCHAR (50),
desenhista VARCHAR (50),
descricao VARCHAR (500),
editora VARCHAR (45)
);

CREATE TABLE atividades (
id INT AUTO_INCREMENT,
timestamp_inicio DATETIME default CURRENT_TIMESTAMP,
timestamp_final DATETIME default CURRENT_TIMESTAMP,
leitura_concluida TINYINT(1),
fk_usuarios INT,
fk_titulos INT,
	PRIMARY KEY (id, fk_usuarios, fk_titulos),
	FOREIGN KEY (fk_usuarios) REFERENCES usuarios(id),
    FOREIGN KEY (fk_titulos) REFERENCES titulos(id)
);

INSERT INTO fotos_perfil VALUES
	(default, 'Batman', 'Dan Mora', '\assets\fotos_perfil\id1 - Batman.png'),
    (default, 'Supergirl', 'Bilquis Evely', '\assets\fotos_perfil\id2 - Supergirl.png'),
    (default, 'Godspeed', 'Carmine Di Giandomenico', '\assets\fotos_perfil\id3 - Godspeed.png'),
    (default, 'Homem-Aranha', 'Ryan Ottley', '\assets\fotos_perfil\id4 - Homem-Aranha.png'),
    (default, 'Tempestade', 'Lucas Werneck', '\assets\fotos_perfil\id5 - Tempestade.png'),
    (default, 'Galactus', 'Leonard Kirk', '\assets\fotos_perfil\id6 - Galactus.png'),
    (default, 'Optimus Prime', 'Daniel Warren Johnson', '\assets\fotos_perfil\id7 - Optimus Prime.png'),
    (default, 'Elita One', 'Jorge Corona', '\assets\fotos_perfil\id8 - Elita One.png'),
    (default, 'Megatron', 'Jorge Corona', '\assets\fotos_perfil\id9 - Megatron.png');