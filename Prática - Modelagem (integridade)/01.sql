CREATE DATABASE INTEGRITY;

CREATE TABLE "customers" (
"id" SERIAL PRIMARY KEY, 
"fullName" TEXT NOT NULL, 
"cpf" TEXT NOT NULL, 
"email" TEXT NOT NULL, 
"password" NUMBER NOT NULL
);

CREATE TABLE "customerPhones"(
"id" SERIAL PRIMARY KEY,
"number" INTEGER NOT NULL UNIQUE,
"type" TEXT NO NULL, 
); 

CREATE TABLE "bankAccount" (
"id" SERIAL PRIMARY KEY,
"accountNumber"  INTEGER NOT NULL UNIQUE,
"agency" TEXT NOT NULL, 
"openDate" DATETIME DEFAULT NOW(),
"closeDate" DATETIME DEFAULT NOW()
);

CREATE TABLE "transactions" (
"id" SERIAL PRIMARY KEY,
"amount" INTEGER NOT NULL, 
"type" TEXT NOT NULL,
"time" WITHOUT TIMEZONE NOW(), 
"description" TEXT NOT NULL, 
"cancelled" BOOLEAN DEFAULT FALSE
);

CREATE TABLE "creditCards" (
"id" SERIAL PRIMARY KEY,
"name" TEXT NOT NULL, 
"number" INTEGER NOT NULL,
"securityCode" INTEGER NOT NULL,
"expirationMonth" TEXT NOT NULL,
"expirationYear" TEXT NOT NULL,
"password" INTEGER NOT NULL,
"limit" INTEGER NOT NULL
);

CREATE TABLE "customerAdresses" (
"id" SERIAL PRIMARY KEY,
"street" TEXT NOT NULL, 
"number" INTEGER NOT NULL, 
"complement" TEXT, 
"postalCode" INTEGER NOT NULL, 
);

CREATE TABLE "cities" (
"id" SERIAL PRIMARY KEY,
"name" TEXT NOT NULL,
);

CREATE TABLE "states" (
"id" SERIAL PRIMARY KEY,
"name" TEXT NOT NULL,
);

ALTER TABLE "customerPhones" ADD CONSTRAINT "customer_Phones_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "customerAdresses" ADD CONSTRAINT "customer_Adresses_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");
ALTER TABLE "customerAdresses" ADD CONSTRAINT "customer_Adresses_fk1" FOREIGN KEY ("cityId") REFERENCES "cities"("id");

ALTER TABLE "bankAccount" ADD CONSTRAINT "bank_account_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");

ALTER TABLE "creditCards" ADD CONSTRAINT "creditCards_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "creditCards"("id");



