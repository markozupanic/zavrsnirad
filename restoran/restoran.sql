#mysql -uroot < C:\Users\X\Documents\GitHub\zavrsnirad\restoran\restoran.sql


drop database if exists restoran;
create database restoran;
use restoran;


create table proizvod(
    sifra int not null primary key auto_increment,
    vrsta varchar(50),
    naziv varchar(50),
    kolicina decimal(18,2),
    cijena decimal(18,2)
);



create table rezervacija(
    sifra int not null primary key auto_increment,
    brojljudi int,
    termindolaska datetime,
    kontakt varchar(50),
    zaposlenik int not null
);

create table zaposlenik(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    kontakt varchar(50),
    smjena datetime,
    znanje varchar(50)
);

create table proizvodrezervacije(
    sifra int not null primary key auto_increment,
    proizvod int not null,
    rezervacija int not null
);




alter table proizvodrezervacije add foreign key (rezervacija) references rezervacija(sifra);
alter table proizvodrezervacije add foreign key (proizvod) references proizvod(sifra);

alter table rezervacija add foreign key (zaposlenik) references zaposlenik(sifra);
