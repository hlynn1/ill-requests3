CREATE TABLE "activities" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "request_id" integer, 
	"status_id" integer, "date" date, "note" text, "created_at" datetime, "updated_at" datetime);

CREATE TABLE "locations" 
 ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "code" varchar(255), "name" varchar(255), 
	"address" varchar(255), "created_at" datetime, "updated_at" datetime);

CREATE TABLE "requests" 
 ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
	"customer_id" integer, "oclcnum" integer, "title" varchar(255), "author" varchar(255), "pub" varchar(255), 
	"locationplaced" varchar(255), "location_id" integer, "duedate" date, "bclitem" integer, 
	"created_at" datetime, "updated_at" datetime, "dateplaced" date);

CREATE TABLE "statuses" 
 ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
	"name" varchar(255), "description" varchar(255), "created_at" datetime, "updated_at" datetime);
