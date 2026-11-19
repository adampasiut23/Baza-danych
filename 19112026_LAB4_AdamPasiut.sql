#zadanie 1

alter table projekt 
drop foreign key projekt_ibfk_1;

alter table pracownik
drop id_pracownika;

alter table pracownik
add column id_pracownika INT primary key auto_increment;

alter table zadanie
add foreign key (id_pracownika) references pracownik(id_pracownika) on delete set null;

alter table projekt
add column id_pracownika INT;

alter table projekt
add foreign key (id_pracownika) references pracownik(id_pracownika);

#zadanie 2 
alter table zadanie
add column godziny_szacowane integer default 8

select * from zadanie; 

insert into zadanie (nazwa_zadania, godziny_szacowane)
values ('cwiczenie', 4);

update zadanie 
set godziny_szacowane = 12 
where id_zadania = 1;

alter table zadanie 
change column godziny_szacowane godziny_szacowane integer default 6; 

insert into zadanie (nazwa_zadania, godziny_szacowane)
values ('test, czy jak wpisze default to wyskoczy 6', default);

delete from zadanie 
where id_zadania = 5;

#zadanie 3 
alter table projekt 
add column opis_kratki varchar(50);

alter table projekt 
change opis_kratki opis_kratki varchar(200);

select * from projekt;

insert into projekt (nazwa_projektu, data_rozpoczecia)
values ('nowy jork', '2028-02-28');

update projekt 
set opis_kratki = 'MVP' 
WHERE opis_kratki is null and id_projektu = 1;

SELECT * FROM projekt
WHERE opis_kratki IS null and id_projektu = 1;

update projekt 
set opis_kratki = 'pilne wdrożenie' 
WHERE opis_kratki is null and id_projektu = 4;

alter table projekt
drop column opis_kratki;

#zadanie 4 
alter table zadanie 
drop foreign key projekt_ibfk_1;

alter table zadanie 
add column id_projektu INT;

alter table zadanie
add foreign key (id_projektu) references projekt(id_projektu) on delete set null;

delete from projekt
where id_projektu = 4;

select * from projekt;
select * from zadanie;




