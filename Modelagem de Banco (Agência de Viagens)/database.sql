CREATE TABLE "company" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"abreviation" TEXT NOT NULL UNIQUE,
);

CREATE TABLE "flight" (
	""id" SERIAL PRIMARY KEY,
	"flght_number" varchar(7) NOT NULL UNIQUE,
	"company_id" integer NOT NULL UNIQUE,
	"from_AirportId" integer NOT NULL UNIQUE,
	"to_airportId" integer NOT NULL UNIQUE,
	"departure_hour" TIMESTAMP WITHOUT TIMEZONE NOT NULL,
	"arrival_hour" TIMESTAMP WITHOUT TIMEZONE NOT NULL,
);
CREATE TABLE "airport" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"abreviation" varchar(3) NOT NULL UNIQUE,
	"cityId" integer NOT NULL UNIQUE,
;)

CREATE TABLE "state" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
);

CREATE TABLE "public.cities" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"stateid" integer NOT NULL UNIQUE,
);


ALTER TABLE "flight" ADD CONSTRAINT "flight_fk0" FOREIGN KEY ("company_id") REFERENCES "company"("id");
ALTER TABLE "flight" ADD CONSTRAINT "flight_fk1" FOREIGN KEY ("from_AirportId") REFERENCES "airport"("id");
ALTER TABLE "flight" ADD CONSTRAINT "flight_fk2" FOREIGN KEY ("to_airportId") REFERENCES "airport"("id");

ALTER TABLE "airport" ADD CONSTRAINT "airport_fk0" FOREIGN KEY ("cityId") REFERENCES "cities"("id");


ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateid") REFERENCES "state"("id");






