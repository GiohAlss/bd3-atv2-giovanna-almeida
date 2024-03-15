#drop database bd_aula;
create database bd_aula;
use bd_aula;


#2, 3 e 4
create table tbl_turma(
cod_turma 		int,
sigla_turma 	varchar(10),
nome_turma 		varchar(100),

constraint pk_turma primary key(cod_turma)
);

create table tbl_disciplinas(
cod_disciplina 		int,
cod_turma 			int,
sigla_disciplina 	varchar(50),

constraint pk_disciplinas primary key(cod_disciplina),
constraint fk_turma_1 foreign key(cod_turma) references tbl_turma(cod_turma)
);

create table tbl_alunos(
cod_aluno 				int,
cod_turma 				int,
nome_aluno				varchar(100),
cpf 					varchar(11),
rg 						varchar(9),
telefone_aluno 			varchar(11),
telefone_responsavel 	varchar(11),
email 					varchar(100),
data_nascimento 		timestamp(6),

constraint pk_alunos primary key(cod_aluno),
constraint fk_turma_2 foreign key(cod_turma) references tbl_turma(cod_turma)
);

create table tbl_frequencia(
cod_frequencia 		int,
cod_aluno 			int,
cod_disciplina 		int,
data_chamada 		timestamp(6),
frequencia 			decimal(2,2),

constraint pk_frequencia primary key(cod_frequencia),
constraint fk_aluno foreign key(cod_aluno) references tbl_alunos(cod_aluno),
constraint fk_disciplina foreign key(cod_disciplina) references tbl_disciplinas(cod_disciplina)
);

#5
insert into tbl_turma(cod_turma, sigla_turma, nome_turma) values
('1', 'ADM', '2A-N-TEC'), ('2', 'DS', '3DSN');

#7
insert into tbl_disciplinas(cod_turma, cod_disciplina, sigla_disciplina) values
('1', '1', 'Adm da Produção'), ('1', '2', 'Economia'), ('1', '3', 'Marketing'), ('1', '4', 'Contabilidade'),  
('2', '5', 'Banco de Dados'),  ('2', '6', 'Programação Web'), ('2', '7', 'Ética'), ('2', '8', 'Inglês Instrumenttal');  

#6
insert into tbl_alunos(cod_turma, cod_aluno, nome_aluno, cpf, rg, telefone_aluno, telefone_responsavel, email, data_nascimento) values
('1', '1', 'Amanda Nogueira', '12345678900', '123456789', '00123456789', '98765432100', 'name.lastname@email.com', '2004-05-25'),
('1', '2', 'Pedro Henrique', '12345678900', '123456789', '00123456789', '98765432100', 'name.lastname@email.com', '2004-04-01'),
('1', '3', 'Maria Augusta', '12345678900', '123456789', '00123456789', '98765432100', 'name.lastname@email.com', '2004-10-21'),
('1', '4', 'Jorge de Souza', '12345678900', '123456789', '00123456789', '98765432100', 'name.lastname@email.com', '2004-01-14'),
('1', '5', 'Carolina Pereira', '12345678900', '123456789', '00123456789', '98765432100', 'name.lastname@email.com', '2004-12-30'),

('2', '6', 'Júlia da Costa', '12345678900', '123456789', '00123456789', '98765432100', 'name.lastname@email.com', '2004-05-17'),
('2', '7', 'Fernanda Moreira', '12345678900', '123456789', '00123456789', '98765432100', 'name.lastname@email.com', '2004-06-06'),
('2', '8', 'Leonardo Santana', '12345678900', '123456789', '00123456789', '98765432100', 'name.lastname@email.com', '2004-07-19'),
('2', '9', 'Marcelo Ferraz', '12345678900', '123456789', '00123456789', '98765432100', 'name.lastname@email.com', '2004-11-03'),
('2', '10', 'Nicolle Soares', '12345678900', '123456789', '00123456789', '98765432100', 'name.lastname@email.com', '2004-09-24');

#8
create view listagem_alunos_turma as
	select  
	ta.nome_aluno, ta.telefone_aluno, ta.telefone_responsavel, ta.email,
	tt.sigla_turma, tt.nome_turma
	from tbl_alunos as ta
	inner join tbl_turma as tt
	on ta.cod_turma = tt.cod_turma
;

#9
create view listagem_disciplina_turma as
select
	td.sigla_disciplina,
	tt.sigla_turma, tt.nome_turma
	from tbl_disciplinas as td
	inner join tbl_turma as tt
	on td.cod_turma = tt.cod_turma
;

#10
create view listagem_alunos_turma_disciplina as
	select
	ta.nome_aluno, ta.telefone_aluno, ta.telefone_responsavel, ta.email,
	tt.sigla_turma, tt.nome_turma,
	td.sigla_disciplina
	from tbl_alunos as ta
	inner join tbl_turma as tt on tt.cod_turma = ta.cod_turma
	inner join tbl_disciplinas as td on td.cod_turma = ta.cod_turma
;


