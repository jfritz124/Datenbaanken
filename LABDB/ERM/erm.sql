DROP TABLE IF EXISTS studiengang CASCADE;
DROP TABLE IF EXISTS stundenplan CASCADE;
DROP TABLE IF EXISTS veranstaltung CASCADE;
DROP TABLE IF EXISTS dozent CASCADE;
DROP TABLE IF EXISTS raum CASCADE;
DROP TABLE IF EXISTS gebaeude CASCADE;
DROP TABLE IF EXISTS uebung CASCADE;
DROP TABLE IF EXISTS vorlesung CASCADE;
DROP TABLE IF EXISTS labor CASCADE;

CREATE TABLE studiengang {
	kuerzel TEXT PRIMARY KEY NOT NULL,
	name TEXT NOT NULL,
	fk_stundenplan_id INTEGER REFERENCES stundenplan (stundenplan_id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
};

CREATE TABLE stundenplan {
	stundenplan_id INTEGER PRIMARY KEY NOT NULL,
	fk_veranstaltung_name TEXT REFERENCES veranstaltung (name) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	fk_studiengang_kuerzel TEXT REFERENCES studiengang (kuerzel) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
};

CREATE TABLE veranstaltung {
	name TEXT PRIMARY KEY NOT NULL,
	wo_tag TEXT NOT NULL,
	start TEXT NOT NULL,
	ende TEXT NOT NULL,
	fachsemester INTEGER NOT NULL,
	haeufigkeit TEXT NOT NULL,
	fk_dozent_mail_1 TEXT REFERENCES dozent (mail) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	fk_dozent_mail_2 TEXT REFERENCES dozent (mail) ON DELETE CASCADE
};

CREATE TABLE dozent {
	mail TEXT PRIMARY KEY NOT NULL,
	name TEXT NOT NULL,
	vorname TEXT NOT NULL,
	grad TEXT,
	sprechzeit TEXT,
	fk_raum_no TEXT REFERENCES raum (no) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
};

CREATE TABLE raum {
	no TEXT PRIMARY KEY NOT NULL,
	name TEXT NOT NULL,
	fk_gebaeude_no TEXT REFERENCES gebaeude (no) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
};

CREATE TABLE gebaeude {
	no TEXT PRIMARY KEY NOT NULL,
	name TEXT NOT NULL
};

CREATE TABLE uebung {
	fk_veranstaltung_name TEXT REFERENCES veranstaltung (name) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
};

CREATE TABLE vorlesung {
	fk_veranstaltung_name TEXT REFERENCES veranstaltung (name) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
};

CREATE TABLE labor {
	fk_veranstaltung_name TEXT REFERENCES veranstaltung (name) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
};

