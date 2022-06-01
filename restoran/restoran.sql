#mysql -uroot < C:\Users\X\Documents\GitHub\zavrsnirad\restoran\restoran.sql


drop database if exists restoran;
create database restoran;
use restoran;


create table proizvod(
    sifra int not null primary key auto_increment,
    vrsta varchar(50) not null,
    naziv varchar(50) not null,
    kolicina decimal(18,2) not null,
    cijena decimal(18,2) not null
);



create table rezervacija(
    sifra int not null primary key auto_increment,
    brojljudi int not null,
    termindolaska datetime not null,
    kontakt char(10) not null ,
    zaposlenik int 
);

create table zaposlenik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    kontakt char(10) not null,
    smjena int not null,
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




insert into proizvod(sifra,vrsta,naziv,kolicina,cijena) values
(null,'hrana','pizza',3,54),(null,'piće','vino',3,14.99),
(null,'hrana','tjestenina',6,63.49),(null,'piće','pivo',5,19.99),
(null,'hrana','grill',8,110),(null,'piće','sok',8,16),
(null,'hrana','plodovimora',4,80),(null,'piće','rakija',1,13),
(null,'hrana','biftek',1,139.99),(null,'piće','žesta',6,15);


insert into rezervacija(sifra,brojljudi,termindolaska,kontakt) values
values(null,8,2022-06-15-16-00,098562387),
values(null,2,2022-06-13-19-30,098562327),
values(null,4,2022-06-14-14-00,098562337),
values(null,6,2022-06-07-18-00,098562347),
values(null,13,2022-06-29-21-00,098562357);

insert into zaposlenik(sifra,ime,prezime,kontakt,smjena) values
(null,'marko','dujić',0950234789,1),(null,'ivan','lukić',0951234989,1),
(null,'filip','bakrenić',0951334789,2),(null,'luka','horvat',0951234789,2);

insert into proizvodrezervacije(sifra,proizvod,rezervacija) values
(null,3,1),(null,1,2),(null,7,3),(null,5,4),(null,9,5);










