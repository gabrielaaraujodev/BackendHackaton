CREATE TABLE Voluntario (
ID_Voluntario INT PRIMARY KEY,
Nome VARCHAR(100),
CPF INT,
Telefone_PK INT,
Endereco_ VARCHAR(100),
CEP VARCHAR(100),
Data_Nascimento_ DATE,
E_mail VARCHAR(100),
Senha VARCHAR(100),
Profissao VARCHAR(100),
Descricao_Pessoal_ VARCHAR(100),
Formacao_Academica VARCHAR(100)
);

CREATE TABLE Telefone (
ID INT NOT NULL PRIMARY KEY,
Telefone VARCHAR(100)
);


CREATE TABLE ONG (
	ID_ONG INT PRIMARY KEY,
	Nome VARCHAR(100),
	CNPJ VARCHAR(100),
	Endereco VARCHAR(100),
	Telefone_PK VARCHAR(100),	
	Historico VARCHAR(100),
	E_mail VARCHAR(100),
	Senha VARCHAR(100)
);


CREATE TABLE Chat (
ID_Chat INT,
Mensagem VARCHAR(100),
Data_Hora DATE
);


CREATE TABLE Match_Demonstra_Interesse (
ID_Match INT PRIMARY KEY,
Data_Match DATE,
fk_Voluntario_ID_Voluntario INT,
fk_ONG_ID_ONG INT
);






CREATE TABLE Area_Atuacao_ (
Area_Atuacao__PK VARCHAR(100) NOT NULL PRIMARY KEY,
Area_Atuacao_ VARCHAR(100)
);


CREATE TABLE Necessidades (
Necessidades_PK VARCHAR(100) NOT NULL PRIMARY KEY,
Necessidades VARCHAR(100)
);



--------------------------------------------------------------

insert into Voluntario values
('1', 'Gabriel', '1234', 1, 'Rua dos nerdolas', '10.230-423', '1990-01-01', 'gabriel@email.com', 'gab123', 'Programador', 'Eu sou doente de fazer um grupo tão ruim assim', 'Graduação em Curso')

insert into Telefone values (1, '99999-0000')


insert into Voluntario values
('2', 'Rodrigo', '5678', 2, 'Rua dos nerdolas 2', '11.330-443', '1990-01-20', 'rodrigo@email.com', 'rod123', 'Programador', 'Eu sou doente de fazer um grupo tão ruim assim', 'Graduação Completa')

insert into Telefone values (2, '98888-0000')





--------------------------------------------------------------


INSERT INTO ONG (Nome, CNPJ, Endereco, E_mail, Senha)
VALUES ('Amigos do Bem', 12345678000190, 'Rua das Flores, 123 - São Paulo, SP', 'contato@amigosdobem.org', 'senha123Amigos');

INSERT INTO ONG (Nome, CNPJ, Endereco, E_mail, Senha)
VALUES ('Instituto Esperança', 98765432000110, 'Av. Paulista, 456 - São Paulo, SP', 'contato@institutoesperanca.org', 'senhaEsperanca456');

INSERT INTO ONG (Nome, CNPJ, Endereco, E_mail, Senha)
VALUES ('Projeto Vida', 45678912000180, 'Rua da Paz, 789 - Rio de Janeiro, RJ', 'contato@projetovida.org', 'vidaSenha789');

INSERT INTO ONG (Nome, CNPJ, Endereco, E_mail, Senha)
VALUES ('Solidariedade em Ação', 23456789000170, 'Av. Brasil, 1010 - Belo Horizonte, MG', 'contato@solidariedade.org', 'acao123Solidario');

INSERT INTO ONG (Nome, CNPJ, Endereco, E_mail, Senha)
VALUES ('Cuidar do Futuro', 34567890000160, 'Rua do Progresso, 11 - Curitiba, PR', 'contato@cuidarfuturo.org', 'senhaFuturo2024');

INSERT INTO ONG (Nome, CNPJ, Endereco, E_mail, Senha)
VALUES ('Mãos que Ajudam', 56789123000150, 'Rua Central, 222 - Porto Alegre, RS', 'contato@maosqueajudam.org', 'senhaMaos456');

INSERT INTO ONG (Nome, CNPJ, Endereco, E_mail, Senha)
VALUES ('Lar dos Sonhos', 78901234000140, 'Av. dos Anjos, 333 - Recife, PE', 'contato@lardossonhos.org', 'sonho789Lar');

INSERT INTO ONG (Nome, CNPJ, Endereco, E_mail, Senha)
VALUES ('Sorrisos Brilhantes', 90123456000130, 'Rua da Alegria, 444 - Salvador, BA', 'contato@sorrisos.org', 'brilho123Sorrisos');

INSERT INTO ONG (Nome, CNPJ, Endereco, E_mail, Senha)
VALUES ('Educar para Transformar', 12234567000120, 'Av. do Saber, 555 - Brasília, DF', 'contato@educartransformar.org', 'transforma2024');

INSERT INTO ONG (Nome, CNPJ, Endereco, E_mail, Senha)
VALUES ('Saúde em Movimento', 34345678000110, 'Rua da Saúde, 666 - Florianópolis, SC', 'contato@saudeemmovimento.org', 'saudeSenha345');

INSERT INTO ONG (Nome, CNPJ, Endereco, E_mail, Senha)
VALUES ('Alimentar com Amor', 56456789000100, 'Av. do Alimento, 777 - Fortaleza, CE', 'contato@alimentarcomamor.org', 'amorAlimento2023');















INSERT INTO Voluntario (Nome, CPF, RegistroConselho, Formacao_Academica, E_mail, Senha)
VALUES ('João da Silva', 123456780, 123456, 'Psicologia', 'joao.silva@example.com', 'senhaSegura123');

INSERT INTO Voluntario (Nome, CPF, RegistroConselho, Formacao_Academica, E_mail, Senha)
VALUES ('Maria Oliveira', 98765432, 987654, 'Medicina', 'maria.oliveira@example.com', 'senhaForte456');

INSERT INTO Voluntario (Nome, CPF, RegistroConselho, Formacao_Academica, E_mail, Senha)
VALUES ('Pedro Santos', 45678912, 654321, 'Educação Física', 'pedro.santos@example.com', 'senhaTop789');

INSERT INTO Voluntario (Nome, CPF, RegistroConselho, Formacao_Academica, E_mail, Senha)
VALUES ('Ana Souza', 654321, 321654, 'Enfermagem', 'ana.souza@example.com', 'senhaAna456');

INSERT INTO Voluntario (Nome, CPF, RegistroConselho, Formacao_Academica, E_mail, Senha)
VALUES ('Lucas Pereira', 789123, 789123, 'Odontologia', 'lucas.pereira@example.com', 'senhaLucas123');

INSERT INTO Voluntario (Nome, CPF, RegistroConselho, Formacao_Academica, E_mail, Senha)
VALUES ('Carla Nunes', 321987, 654987, 'Administração', 'carla.nunes@example.com', 'senhaSegura999');

INSERT INTO Voluntario (Nome, CPF, RegistroConselho, Formacao_Academica, E_mail, Senha)
VALUES ('Fernando Lima', 1597655, 123789, 'Arquitetura', 'fernando.lima@example.com', 'senhaFernando');

INSERT INTO Voluntario (Nome, CPF, RegistroConselho, Formacao_Academica, E_mail, Senha)
VALUES ('Juliana Farias', 8527419, 987123, 'Enfermagem', 'juliana.farias@example.com', 'senhaJuliana');

INSERT INTO Voluntario (Nome, CPF, RegistroConselho, Formacao_Academica, E_mail, Senha)
VALUES ('Bruno Costa', 9871277, 321987, 'Contabilidade', 'bruno.costa@example.com', 'senhaBruno789');

INSERT INTO Voluntario (Nome, CPF, RegistroConselho, Formacao_Academica, E_mail, Senha)
VALUES ('Isabela Vieira', 123788, 654123, 'Nutrição', 'isabela.vieira@example.com', 'senhaIsabela123');

INSERT INTO Voluntario (Nome, CPF, RegistroConselho, Formacao_Academica, E_mail, Senha)
VALUES ('Gabriel Almeida', 4563999, 789456, 'Direito', 'gabriel.almeida@example.com', 'senhaGabriel');