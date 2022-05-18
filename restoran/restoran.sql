#mysql -uroot < C:\Users\X\Documents\GitHub\zavrsnirad\restoran\restoran.sql


drop database if exists restoran;
create database restoran;
use restoran;


create table musterija(
    sifra int not null primary key auto_increment,
    osoba int not null,
    brojstola int,
    restoran int not null,
    meni int not null,
    rezervacija int not null
);

create table restoran(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    adresa varchar(50),
    vrstarestoran varchar(50),
    brojmjesta int,
    ocjenarestorana int
);

create table rezervacija(
    sifra int not null primary key auto_increment,
    brojljudi int,
    termindolaska datetime,
    kontakt varchar(50),
    restoran int not null
);

create table zaposlenik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    smjena datetime,
    znanje varchar(50)
);

create table meni(
    sifra int not null primary key auto_increment,
    jelo varchar(50),
    pice varchar(50),
    cijena int,
    vrijemecekanja int
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    kontakt varchar(50),
    restoran int not null,
    musterija int not null
);



alter table musterija add foreign key (restoran) references restoran(sifra);
alter table rezervacija add foreign key (restoran) references restoran(sifra);
alter table osoba add foreign key (restoran) references restoran(sifra);

alter table zaposlenik add foreign key (osoba) references osoba(sifra);
alter table musterija add foreign key (osoba) references osoba(sifra);
alter table musterija add foreign key (meni) references meni(sifra);
alter table musterija add foreign key (rezervacija) references rezervacija(sifra);
