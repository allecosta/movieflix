CREATE DATABASE movieflix;

USE movieflix;

CREATE TABLE usuario (
	id_usuario int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome varchar(255) NOT NULL,
    login varchar(255) NOT NULL,
    senha varchar(255) NOT NULL,
    matricula int NOT NULL,
    cargo varchar(255) NOT NULL
) COLLATE='utf8mb4_0900_ai_ci' ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE filme (
	id_filme int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome varchar(255) NOT NULL
) COLLATE='utf8mb4_0900_ai_ci' ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE horario (
	id_horario int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    hora time NOT NULL
) COLLATE='utf8mb4_0900_ai_ci' ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE sala (
	id_sala int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome varchar(255) NOT NULL
) COLLATE='utf8mb4_0900_ai_ci' ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE ingresso (
	id_ingresso int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    poltrona int NOT NULL,
    valorPago float NOT NULL,
    dataCompra date NOT NULL,
    horaCompra time NOT NULL,
    sessao_id int UNIQUE NOT NULL,
    FOREIGN KEY (sessao_id) REFERENCES sessao (id_sessao)
) COLLATE='utf8mb4_0900_ai_ci' ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE cliente (
	id_cliente int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome varchar(255) NOT NULL,
    ingresso_id int UNIQUE NOT NULL,
    FOREIGN KEY (ingresso_id) REFERENCES ingresso (id_ingresso)
) COLLATE='utf8mb4_0900_ai_ci' ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE sessao (
	id_sessao int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    data date NOT NULL,
    filme_id int UNIQUE NOT NULL,
    horario_id int UNIQUE NOT NULL,
    sala_id int UNIQUE NOT NULL,
    usuario_id int UNIQUE NOT NULL,
    cliente_id int UNIQUE NOT NULL,
    FOREIGN KEY (filme_id) REFERENCES filme (id_filme),
    FOREIGN KEY (horario_id) REFERENCES horario (id_horario),
    FOREIGN KEY (sala_id) REFERENCES sala (id_sala),
    FOREIGN KEY (usuario_id) REFERENCES usuario (id_usuario),
    FOREIGN KEY (cliente_id) REFERENCES cliente (id_cliente)
) COLLATE='utf8mb4_0900_ai_ci' ENGINE=InnoDB AUTO_INCREMENT=1;















