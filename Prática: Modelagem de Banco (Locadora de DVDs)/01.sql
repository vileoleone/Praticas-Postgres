CREATE TABLE "disco" (
	"id" serial PRIMARY KEY,
	"número" integer NOT NULL UNIQUE,
	"código_de_barras" numeric NOT NULL UNIQUE,
	"filmeId" integer NOT NULL UNIQUE,
);

CREATE TABLE "filme" (
	""id" serial PRIMARY KEY,
	"titulo" TEXT NOT NULL UNIQUE,
	"categoriaId" integer NOT NULL,
);

CREATE TABLE "categorias" (
	"id" serial PRIMARY KEY,
	"tipo" TEXT NOT NULL UNIQUE,
);

CREATE TABLE "atores" (
	"id" serial PRIMARY KEY,
	"nome" TEXT NOT NULL,
	"data de nascimento" DATE NOT NULL,
	"paísId" integer NOT NULL,
	"filmeId" integer NOT NULL,
);

CREATE TABLE "país" (
	"id" serial PRIMARY KEY,
	"nome" TEXT NOT NULL,
);

CREATE TABLE "clientes" (
	"id" serial PRIMARY KEY,
	"nome" TEXT NOT NULL,
	"endereçoId" integer NOT NULL,
	"telefone" integer NOT NULL,
);

CREATE TABLE "public.endereços" (
	"id" serial PRIMARY KEY,
	"rua" TEXT NOT NULL UNIQUE,
	"número" integer NOT NULL UNIQUE,
	"complemento" TEXT NOT NULL,
	"bairro" TEXT NOT NULL UNIQUE,
	"cidadeId" integer NOT NULL UNIQUE,
);

CREATE TABLE "estados" (
	"id" serial PRIMARY KEY,
	"nome" TEXT NOT NULL UNIQUE,
);

CREATE TABLE "public.cidades" (
	"id" serial PRIMARY KEY,,
	"nome" TEXT NOT NULL UNIQUE,
	"estadoId" integer NOT NULL UNIQUE,
);

CREATE TABLE "locação" (
	"id" serial PRIMARY KEY,
	"clienteId" integer NOT NULL,
	"discoId" integer NOT NULL,
	"data de locação" DATE NOT NULL,
);

CREATE TABLE "devolução" (
	""id" serial PRIMARY KEY,
	"clienteId" integer NOT NULL,
	"discoId" integer NOT NULL,
	"data_de_devolução" DATE NOT NULL,
	"nota_fime" integer NOT NULL,
	"nota_atendimento" integer NOT NULL,
);



ALTER TABLE "disco" ADD CONSTRAINT "disco_fk0" FOREIGN KEY ("filmeId") REFERENCES "filme"("id");

ALTER TABLE "filme" ADD CONSTRAINT "filme_fk0" FOREIGN KEY ("categoriaId") REFERENCES "categorias"("id");


ALTER TABLE "atores" ADD CONSTRAINT "atores_fk0" FOREIGN KEY ("paísId") REFERENCES "país"("id");
ALTER TABLE "atores" ADD CONSTRAINT "atores_fk1" FOREIGN KEY ("filmeId") REFERENCES "filme"("id");


ALTER TABLE "clientes" ADD CONSTRAINT "clientes_fk0" FOREIGN KEY ("endereçoId") REFERENCES "endereços"("id");

ALTER TABLE "endereços" ADD CONSTRAINT "endereços_fk0" FOREIGN KEY ("cidadeId") REFERENCES "cidades"("id");


ALTER TABLE "cidades" ADD CONSTRAINT "cidades_fk0" FOREIGN KEY ("estadoId") REFERENCES "estados"("id");

ALTER TABLE "locação" ADD CONSTRAINT "locação_fk0" FOREIGN KEY ("clienteId") REFERENCES "clientes"("id");
ALTER TABLE "locação" ADD CONSTRAINT "locação_fk1" FOREIGN KEY ("discoId") REFERENCES "disco"("id");

ALTER TABLE "devolução" ADD CONSTRAINT "devolução_fk0" FOREIGN KEY ("clienteId") REFERENCES "clientes"("id");
ALTER TABLE "devolução" ADD CONSTRAINT "devolução_fk1" FOREIGN KEY ("discoId") REFERENCES "disco"("id");







