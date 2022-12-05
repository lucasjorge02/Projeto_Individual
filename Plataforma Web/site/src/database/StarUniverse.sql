DROP DATABASE IF EXISTS staruniverse;
CREATE DATABASE IF NOT EXISTS StarUniverse;
USE StarUniverse;

CREATE TABLE IF NOT EXISTS Usuario(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  email VARCHAR(80) UNIQUE NULL, constraint ctEmail check(email like'%@%.%'),
  senha VARCHAR(100) NOT NULL
);

insert into Usuario (nome, email, senha) values
('Lucas', 'Lucas@gmail.com', 'Lucas123'),
('Mariana','Mariana@gmail.com', 'Mariana123'),
('Victor', 'Victor@gmail.com', 'Victor123');


CREATE TABLE IF NOT EXISTS Musica (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome VARCHAR(45) NULL
);

INSERT INTO Musica (nome) values 
('Drift Away'),
('Independent Together'),
('Love Like You'),
('True Kinda Love');

CREATE TABLE IF NOT EXISTS Enquetes (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  Pergunta Varchar(90) not null
);

insert into Enquetes(Pergunta) values
('Quem Machucou o olho da Pink Pearl?'),
('Qual elemento da Lápis-Lazuli controla?'),
('A música Love Like You foi feita pela Rebbeca Sugar?');
 
CREATE TABLE IF NOT EXISTS Resposta (
  fkEnquete INT NOT NULL,
  fkUsuario INT NOT NULL,
  CONSTRAINT ctfkEnquete FOREIGN KEY (fkEnquete) REFERENCES Enquetes(id),
  CONSTRAINT ctfkUsuario FOREIGN KEY (fkUsuario) REFERENCES Usuario(id),
  resposta VARCHAR(30) NOT NULL
);

insert into Resposta (fkUsuario, fkEnquete, resposta) values
(1,1,'Pink Diamond'),
(2,1,'White Diamond'),
(2,2,'Gelo'),
(3,2,'Água');

CREATE TABLE IF NOT EXISTS MusicaFav (
fkMusica INT, FOREIGN KEY (fkMusica) REFERENCES Musica(id),
fkUsuario INT, FOREIGN KEY (fkUsuario) REFERENCES Usuario(id)
);

insert into MusicaFav(fkUsuario, fkMusica) values 
(1,2),
(1,3),
(1,4),
(2,4),
(2,3),
(2,1),
(3,1);


SELECT * FROM MusicaFav;
select * from Usuario;
select * from resposta;

select count(fkEnquete) as VGraf, resposta from resposta group by resposta

union all

select fkUsuario, fkEnquete from resposta where fkUsuario = 1;

select fkMusica, count(fkMusica) from MusicaFav group by fkMusica;


select fkMusica as Musica, count(fkMusica) voto from MusicaFav group by fkMusica

union all

SELECT * FROM MusicaFav  WHERE fkUsuario = 2;

truncate table resposta;