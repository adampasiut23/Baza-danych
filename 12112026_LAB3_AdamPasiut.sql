#zad1
create table pracownik (
id_pracownika INT auto_increment primary key, 
imie varchar(60) NOT NULL,
nazwisko varchar(60) NOT NULL, 
data_urodzenia DATE NOT NULL
);

insert into pracownik (imie, nazwisko, data_urodzenia)
values ('Piotr' 'Kowalski', '2005-01-01');

select * from pracownik;

update pracownik 
set data_urodzenia = '2007-05-11' where id_pracownika = 3

#zad 2 
create table zadanie(
id_zadania INT primary key auto_increment,
nazwa_zadania varchar(150) NOT NULL
piorytet enum('normalny', 'wysoki', 'niski'),
opis text
id_pracownika INT
);

alter table zadanie 
modify piorytet 
enum('normalny', 'wysoki', 'niski') default 'normalny';

insert into zadanie (nazwa_zadania)
values('ZADANIE 1')

#zad 3
CREATE TABLE projekt(
id_projektu INT primary key auto_increment
nazwa_projektu varchar(150)
data_rozpoczecia DATE NOT NULL
data_zakonczenia DATE
);

alter table projekt 
add column menedzer_projektu int,
ADD foreign key(menedzer_projektu) references pracownik(id_pracownika);

alter table zadanie 
add column projekt int,
ADD foreign key(projekt) references projekt(id_projektu);

update zadanie 
set projekt = 1 where id_pracownika = 1;

#zad 4 

CREATE TABLE sprint ( 
id_sprintu INT primary key auto_increment,
numer_sprintu INT unsigned,
data_rozpoczecia DATE,
data_zakonczenia DATE
);

ALTER TABLE zadanie 
ADD COLUMN sprint INT,

ALTER TABLE zadanie
ADD foreign key (sprint) references sprint(id_sprintu) ON delete set null; 

ALTER TABLE zadanie
drop foreign key zadanie_ibfk_2;

INSERT INTO sprint (id_sprintu, numer_sprintu, data_rozpoczecia, data_zakonczenia)
VALUES ('1', '10', '2026-11-20', '2034-12-12');

select * from sprint;

select * from zadanie;
UPDATE zadanie
set sprint = 1 where id_zadania = 2;

INSERT INTO zadanie (id_zadania, nazwa_zadania)
VALUES ('2', 'baza danych');

#zad 5
CREATE TABLE status (
id_statusu INT primary key auto_increment,
nazwa_statusu varchar(20)
);
CREATE TABLE zadanie_has_status (
id_zdarzenia INT primary key auto_increment,
data_zdarzenia datetime default current_timestamp
);

select * from projekt;

insert into status (id_statusu, nazwa_statusu)
values ('3', 'zrobione');

alter table zadanie_has_status
add column zadanie int,
add foreign key(zadanie) references zadanie(id_zadania);

alter table zadanie_has_status
add column status int,
add foreign key(status) references status(id_statusu);

select * from zadanie_has_status;

insert into zadanie_has_status (id_zdarzenia, zadanie, status)
values ('3', '1', '3');

delete from projekt where id_projektu = 3; 

select * from projekt;
select * from zadanie;
DESC zadanie;
INSERT INTO zadanie (nazwa_zadania, projekt)
VALUES ('testowe zadanie', 3);

DROP TABLE sprint; 



