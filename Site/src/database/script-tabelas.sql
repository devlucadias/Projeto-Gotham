CREATE DATABASE easyfiction;
USE easyfiction;

-- Tabela para registrar as fotos de perfil da tela inicial
CREATE TABLE fotos_perfil (
id INT PRIMARY KEY AUTO_INCREMENT,
personagem VARCHAR (45),
artista VARCHAR (45)
);

-- Tabela para registrar os usuários
CREATE TABLE usuarios (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45),
nome_exibicao VARCHAR (45),
email VARCHAR (100),
senha VARCHAR (45),
fk_fotos_perfil INT,
	FOREIGN KEY (fk_fotos_perfil) REFERENCES fotos_perfil (id)
);

-- Tabela para registrar os quadrinhos
CREATE TABLE titulos (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (100),
roteirista VARCHAR (50),
desenhista VARCHAR (50),
descricao VARCHAR (1000),
editora VARCHAR (45),
numero_edicao INT,
total_paginas INT
);

-- Tabela para registrar atividade do usuário
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

-- Inserção das fotos de perfil no banco de dados
INSERT INTO fotos_perfil VALUES
	(default, 'Batman', 'Dan Mora'),
    (default, 'Supergirl', 'Bilquis Evely'),
    (default, 'Godspeed', 'Carmine Di Giandomenico'),
    (default, 'Homem-Aranha', 'Ryan Ottley'),
    (default, 'Tempestade', 'Lucas Werneck'),
    (default, 'Galactus', 'Leonard Kirk'),
    (default, 'Optimus Prime', 'Daniel Warren Johnson'),
    (default, 'Elita One', 'Jorge Corona'),
    (default, 'Megatron', 'Jorge Corona');

-- Inserção dos quadrinhos no banco de dados
INSERT INTO titulos VALUES
	(default, 'Supergirl - Mulher do Amanhã', 'Tom King', 'Bilquis Evely',
		'Kara Zor-El passou por muitas aventuras épicas ao longo dos anos, mas hoje acredita estar sem propósito. Aonde quer que vá, as pessoas só a veem como prima do Superman. Até que tudo muda, quando uma garota alienígena a procura para uma missão de vingança contra os vilões que exterminaram seu planeta. Agora, uma kryptoniana, um cachorro e uma criança com o coração partido partem para o espaço em uma jornada que mudará suas vidas para sempre. Escrita pelo aclamado Tom King e com arte da brilhante Bilquis Evely, a obra foi indicada ao Prêmio Eisner de melhor minissérie.',
        'DC Comics', 1, 25),

	(default, 'Transformers', 'Daniel Warren Johnson', 'Daniel Warren Johnson',
		'Optimus Prime deveria ter liderado os Autobots à vitória. Em vez disso, o destino de Cybertron é desconhecidoe seus aliados caíram longe de casa, ao lado de seus inimigos: os Decepticons. À medida que essas forças titânicas renovam sua guerra na Terra, uma coisa fica imediatamente clara: o planeta nunca mais será o mesmo. Novas alianças são formadas, o campo de batalha se transforma e a única esperança de sobrevivência da humanidade é Optimus Prime.',
        'Skybound', 1, 33),
        
	(default, 'Tempestade', 'Murewa Ayodele', 'Lucas Werneck',
		'Ororo Munroe viveu muitas vidas. Ela foi uma ladra, uma deusa, uma X-Men, uma rainha e agora... uma Vingadora! Ela é um mutante nível omega, sendo a mais respeitada e influente porta voz mutante no cenário mundial, ela pretende ser uma força de mudança positiva. Porém um grande colapso em uma instalação nuclear na cidade de Oklahoma tira Tempestade de seu santuário em Atlanta e a leva para um conflito moral que testará sua determinação!',
        'Marvel', 1, 29);

-- Marcando um confere
SELECT * FROM fotos_perfil;
SELECT * FROM titulos;
SELECT * FROM usuarios;
SELECT * FROM atividades;