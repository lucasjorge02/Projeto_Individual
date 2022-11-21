DROP DATABASE IF EXISTS staruniverse;
CREATE DATABASE IF NOT EXISTS StarUniverse;
USE StarUniverse;

CREATE TABLE IF NOT EXISTS Usuario(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  sobrenome VARCHAR(45) NULL,
  CPF CHAR(11) UNIQUE NOT NULL,
  email VARCHAR(80) UNIQUE NULL, constraint ctEmail check(email like'%@%.%'),
  senha VARCHAR(100) NOT NULL
  );


CREATE TABLE IF NOT EXISTS Musica (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome VARCHAR(45) NULL
  );


CREATE TABLE IF NOT EXISTS Votacao (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  data DATETiME DEFAULT CURRENT_TIMESTAMP(),
  Motivo VARCHAR(500) NOT NULL,
  fkMusica INT NOT NULL,
  fkUsuario INT NOT NULL,
  CONSTRAINT ctfkMusica FOREIGN KEY (fkMusica) REFERENCES Musica(id),
  CONSTRAINT ctfkUsuario FOREIGN KEY (fkUsuario) REFERENCES Usuario(id) 
  );
  
CREATE TABLE IF NOT EXISTS MusicaFav (
fkMusica INT, FOREIGN KEY (fkMusica) REFERENCES Musica(id),
fkUsuario INT, FOREIGN KEY (fkUsuario) REFERENCES Usuario(id)
);

INSERT INTO Musica (nome) values 
('Drift Away'),
('Independent Together'),
('Love Like You'),
('True Kinda Love');

SELECT * FROM MusicaFav;
select * from Usuario;
select fkMusica, count(fkMusica) from MusicaFav group by fkMusica;

insert into MusicaFav(fkUsuario, fkMusica) values 
(1,2),
(1,3),
(1,4),
(2,4),
(2,3),
(2,1),
(3,1);

select fkMusica as Musica, count(fkMusica) voto from MusicaFav group by fkMusica

union all

SELECT * FROM MusicaFav  WHERE fkUsuario = 2;

