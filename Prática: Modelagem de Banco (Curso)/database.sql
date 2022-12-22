CREATE TABLE "alunos" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"cpf" varchar(11) NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE,
	"turma_atual_Id" integer NOT NULL UNIQUE,
);

CREATE TABLE "turma" (
	"id" serial PRIMARY KEY,
	"nome" TEXT NOT NULL UNIQUE,
);

CREATE TABLE "histórico" (
	"id" serial PRIMARY KEY,
	"alunoId" integer NOT NULL,
	"turmaId" integer NOT NULL,
	"data_entrada" TIMESTAMP WITHOUT TIMEZONE DEFAULT NOW(),
	"data_saida" TIMESTAMP WITHOUT TIMEZONE,
);

CREATE TABLE "projetos" (
	"id" serial PRIMARY KEY,
	"nome" TEXT NOT NULL UNIQUE,
	"data_entrega" TIME,
	"aluno_id" integer NOT NULL,
	"notaId" integer NOT NULL,
	"moduloId" integer NOT NULL,
);

CREATE TABLE "notas" (
	"id" serial PRIMARY KEY,
	"nota_final" TEXT NOT NULL UNIQUE,
);


CREATE TABLE "módulo" (
	"id" serial PRIMARY KEY,
	"nome" TEXT NOT NULL UNIQUE,
);

ALTER TABLE "alunos" ADD CONSTRAINT "alunos_fk0" FOREIGN KEY ("turma_atual_Id") REFERENCES "turma"("id");

ALTER TABLE "histórico" ADD CONSTRAINT "histórico_fk0" FOREIGN KEY ("alunoId") REFERENCES "alunos"("id");
ALTER TABLE "histórico" ADD CONSTRAINT "histórico_fk1" FOREIGN KEY ("turmaId") REFERENCES "turma"("id");

ALTER TABLE "projetos" ADD CONSTRAINT "projetos_fk0" FOREIGN KEY ("aluno_id") REFERENCES "alunos"("id");
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_fk1" FOREIGN KEY ("notaId") REFERENCES "notas"("id");
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_fk2" FOREIGN KEY ("moduloId") REFERENCES "módulo"("id");







