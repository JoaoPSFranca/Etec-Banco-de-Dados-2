drop schema if exists escola2N1;
Create Schema escola2N1;
Use escola2N1;

Create Table Situacao_Aluno 
(
	cd_situacao_aluno int,
	nm_situacao_aluno varchar(45),
	constraint pk_situacao_aluno primary key (cd_situacao_aluno)
);

Create Table Tipo_Curso
(
	cd_tipo_curso int, 
	nm_tipo_curso varchar(45),
	constraint pk_Tipo_Curso primary key (cd_tipo_curso)
);

create table Professor 
(
	cd_professor int,
	nm_professor varchar(200),
	cd_cpf_professor varchar (15),
	constraint pk_professor primary key (cd_professor)
);

create table disciplina
(
	sg_disciplina varchar (7),
	nm_disciplina varchar (150),
	constraint pk_disciplina primary key (sg_disciplina)
);

Create Table Mencao_Escolar
(
	sg_mencao_escolar varchar (5),
	ds_mencao_escolar text,
	constraint pk_mencao_escolar primary key (sg_mencao_escolar)
);

create table tipo_mencao
(
	cd_tipo_mencao int,
	nm_tipo_mencao varchar(45),
	constraint pk_tipo_mencao primary key (cd_tipo_mencao)
);

create table aluno 
(
	cd_rm_aluno int,
	nm_aluno varchar (240),
	cd_cpf_aluno varchar (15),
	constraint pk_aluno primary key (cd_rm_aluno)
);

Create Table Curso 
(
	sg_curso varchar(5), 
	nm_curso varchar(200),
	cd_tipo_curso int,
	constraint pk_curso primary key (sg_curso),
	constraint fk_curso_tipo_curso foreign key (cd_tipo_curso)
		references tipo_curso(cd_tipo_curso)
);

create table turma 
(
	sg_turma varchar (5),
	aa_turma int,
	cd_semestre int,
	sg_curso varchar (5),
	constraint pk_turma primary key (sg_turma, aa_turma, cd_semestre),
	constraint fk_turma_curso foreign key (sg_curso)
		references curso (sg_curso)
);

create table lista_aluno
(
	sg_turma varchar (5),
	aa_turma int,
	cd_semestre int,
	cd_rm_aluno int,
	cd_situacao_aluno int,
	constraint pk_lista_aluno primary key (sg_turma, aa_turma, cd_semestre, cd_rm_aluno),
	constraint fk_LA_SituacaoA foreign key (cd_situacao_aluno)
		references situacao_aluno (cd_situacao_aluno),
	constraint fk_LA_Turma foreign key (sg_turma, aa_turma, cd_semestre)
		references turma (sg_turma, aa_turma, cd_semestre),
	constraint fk_LA_Aluno foreign key (cd_rm_aluno)
		references aluno (cd_rm_aluno)
);

create table grade
(
	sg_turma varchar (5),
	aa_turma int,
	cd_semestre int,
	sg_disciplina varchar (7),
	constraint pk_grade primary key (sg_turma, aa_turma, cd_semestre, sg_disciplina),
	constraint fk_grade_turma foreign key (sg_turma, aa_turma, cd_semestre)
		references turma (sg_turma, aa_turma, cd_semestre),
	constraint fk_grade_disciplina foreign key (sg_disciplina)
		references disciplina (sg_disciplina)
);

create table atribuicao
(
	sg_turma varchar (5),
	aa_turma int,
	cd_semestre int,
	sg_disciplina varchar (7),
	cd_professor int,
	qt_ch decimal (5,2),
	constraint pk_atribuicao primary key (sg_turma, aa_turma, cd_semestre, sg_disciplina, cd_professor),
	constraint fk_atribuicao_professor foreign key (cd_professor)
		references professor (cd_professor),
	constraint fk_atribuicao_grade foreign key (sg_turma, aa_turma, cd_semestre, sg_disciplina)
		references grade (sg_turma, aa_turma, cd_semestre, sg_disciplina)
);

create table mencao
(
	cd_rm_aluno int,
	sg_turma varchar (5),
	aa_turma int,
	cd_semestre int,
	sg_disciplina varchar (7),
	cd_tipo_mencao int,
	sg_mencao_escolar varchar (5), 
	constraint pk_mencao primary key (cd_rm_aluno, sg_turma, aa_turma, cd_semestre, sg_disciplina, cd_tipo_mencao),
	constraint fk_mencao_tipo_mencao foreign key (cd_tipo_mencao)
		references tipo_mencao (cd_tipo_mencao),
	constraint fk_mencao_escolar foreign key (sg_mencao_escolar)
		references mencao_escolar (sg_mencao_escolar),
	constraint fk_mencao_aluno foreign key (cd_rm_aluno)
		references aluno (cd_rm_aluno),
	constraint fk_mencao_grade foreign key (sg_turma, aa_turma, cd_semestre, sg_disciplina)
		references grade (sg_turma, aa_turma, cd_semestre, sg_disciplina)
);