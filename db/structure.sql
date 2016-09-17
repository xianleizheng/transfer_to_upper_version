CREATE TABLE "microposts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" varchar(255), "user_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_microposts_on_user_id_and_created_at" ON "microposts" ("user_id", "created_at");
CREATE TABLE "relationships" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "follower_id" integer, "followed_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_relationships_on_followed_id" ON "relationships" ("followed_id");
CREATE UNIQUE INDEX "index_relationships_on_follower_id_and_followed_id" ON "relationships" ("follower_id", "followed_id");
CREATE INDEX "index_relationships_on_follower_id" ON "relationships" ("follower_id");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "email" varchar(255), "created_at" datetime, "updated_at" datetime, "password_digest" varchar(255), "remember_token" varchar(255), "admin" boolean DEFAULT 'f', "picture_name" varchar);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE INDEX "index_users_on_remember_token" ON "users" ("remember_token");
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20160612114030');

INSERT INTO schema_migrations (version) VALUES ('20160612123941');

INSERT INTO schema_migrations (version) VALUES ('20160613011012');

INSERT INTO schema_migrations (version) VALUES ('20160613094238');

INSERT INTO schema_migrations (version) VALUES ('20160614054058');

INSERT INTO schema_migrations (version) VALUES ('20160614103113');

INSERT INTO schema_migrations (version) VALUES ('20160615075241');

INSERT INTO schema_migrations (version) VALUES ('20160622142843');

