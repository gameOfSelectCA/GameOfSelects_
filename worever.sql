drop database gameSelect ;

create database gameSelect ;

use gameSelect;


 create table autor(
    idAutor int primary key auto_increment,
    nome varchar(45),
    dtNasc date,
    statusvida varchar(45)
   
);

insert into autor values
(null,'Eiichiro Oda','1975-01-01','vivo'),
(null,'Kana Akatsuki',null,'vivo'),
(null,'Kore Yamazaki','1990-06-10','vivo');

create table mangaka(
    idMangaka int primary key auto_increment,
    nome varchar(45),
    dtNasc date,
    statusvida varchar(45)
   
) auto_increment = 50;

insert into mangaka values
(null,'Shin-Ei Animation f. fujio', '1933-12-01', 'morto'),
(null,'Eiichiro Oda','1975-01-01','vivo'),
(null,'Kana Akatsuki',null,'vivo'),
(null,'Kore Yamazaki','1990-06-10','vivo');

create table produtora(
    idProdutora int primary key auto_increment,
    nome varchar(45),
    dtCriacao date
) auto_increment = 100;

insert into produtora values
(null,'Shin-Ei Animation', '1976-09-09'),
(null,'Wit Studio','2012-06-01'),
(null,'MAPPA','2011-06-14'),
(null,'Ufotable','2000-10-1'),
(null,'Kyoto Animation','1985-07-12'),
(null,'Trigger','2011-08-22'),
(null,'Bones','1998-10-01'),
(null,'Toei Animation','1948-01-23'),
(null,'studios ghibli','1985-06-15'),
(null,'studio Sunrise','1972-09-01'),
(null,'Bandai Visual','1983-08-23'),
(null,'Madhouse','1972-10-17');

create table destribuidora(
    idDestribuidora int primary key auto_increment,
    nome varchar(45),
    dtCriacao date
) auto_increment = 150;

insert into destribuidora values
(null,'Seven Seas','2004-01-01'),
(null,'Mag Garden','2001-06-05'),
(null,' Kyoto Animation','1981-03-03'),
(null, 'Shueisha','1925-01-02'),
(null, 'Shueisha','1997-03-03'),
(null,' Kyoto Animation','1981-03-03');



create table generoPrincipal(
    idGeneroPrincipal int primary key auto_increment,
    nome varchar(45)
) auto_increment = 1500;

insert into generoPrincipal values
(null,'aventura'),
(null,'ação'),
(null,'terro'),
(null,'ficção cientifica'),
(null,'romance'),
(null,'fantasia'),
(null,'Shonen'),
(null,'Isekai'),
(null,'shoujo'),
(null,'seinen'),
(null,'josei'),
(null,'slice of life')
;

create table personagem(
    idPersonagem int primary key auto_increment,
    nome varchar(45),
    idade int,
    alcunha varchar(45),
    objetivo varchar(45)
) auto_increment = 1000;


insert into personagem values
(null, 'Monkey D.Luffy', 17, 'quinto imperador','ser o rei dos piratas'),
(null, 'violet', 14, 'automata','achar a paz'),
(null, ' Chise Hatori', 15, 'Sleigh Beggy','aprender magia');

create table obra(
    idObra int primary key auto_increment,
    nome varchar(45),
    fkAutor int,
    constraint fkAutor foreign key (fkAutor) references autor(idAutor),
    fkGenero int,
    constraint fkGenero foreign key (fkGenero) references generoPrincipal(idGeneroPrincipal),
    fkProtagonistaObra int,
    constraint fkProtagonistaObra foreign key (fkProtagonistaObra) references personagem(idPersonagem)
) auto_increment = 200;

insert into obra values
(null,'One Piece',1,1500,1000),
(null,'Violet Evergarden ',2,1500,1001),
(null,'Mahoutsukai no yome',3,1500,1002);

create table lightnovel(
    idLightnovel int primary key auto_increment,
    nome varchar(45),
    fkObraLight int,
    fkAutorLight int,
    fkDestribuidora int,
    fkMangaka int,
    constraint fkObraLight foreign key(fkObraLight) references obra (idObra),
    constraint fkAutorLight foreign key(fkAutorLight) references obra (fkAutor),
    constraint fkDestribuidoraLight foreign key (fkDestribuidora) REFERENCES destribuidora (idDestribuidora),
    constraint fkMangakaLight foreign key (fkMangaka) REFERENCES mangaka (idMangaka)
)auto_increment = 2050;


insert into lightnovel values (null,'Violet Evergarden',201 ,2,152, 52);


create table manga(
    idManga int primary key auto_increment,
    nome varchar(45),
    fkObraManga int,
    fkAutorManga int,
    fkDestribuidoraManga int,
    fkMangaka int,
    constraint fkObraManga foreign key(fkObraManga) references obra (idObra),
    constraint fkAutorManga foreign key(fkAutorManga) references obra(fkAutor),
    constraint fkDestribuidoraManga foreign key (fkDestribuidoraManga) REFERENCES destribuidora (idDestribuidora),
    constraint fkMangakaManga foreign key (fkMangaka) REFERENCES mangaka (idMangaka)
)auto_increment = 2050;

insert into manga values 
(null,'One Piece', 200, 1, 152,51),
(null,'Violet Evergarden',201 ,2,152, 52);


create table manhwa(
    idManhwa int primary key auto_increment,
    nome int,
    fkObraManhwa int,
    fkAutorManhwa int,
    fkDestribuidora int,
    fkMangaka int,
    constraint fkObraManhawa foreign key(fkObraManhwa) references obra (idObra),
    constraint fkAutorManhwa foreign key(fkAutorManhwa) references obra(fkAutor),
    constraint fkDestribuidoraManhwa foreign key (fkDestribuidora) REFERENCES destribuidora (idDestribuidora),
    constraint fkMangakaManhwa foreign key (fkMangaka) REFERENCES mangaka (idMangaka)
)auto_increment = 2050;

create table anime(
    idAnime int primary key auto_increment,
    nome varchar(45),
    fkObraAnime int,
    fkAutorAnime int,
    fkProdutora int,
    constraint fkObraAnime foreign key(fkObraAnime) references obra (idObra),
    constraint fkAutorAnime foreign key(fkAutorAnime) references obra(fkAutor),
    constraint fkProdutoraAnime foreign key (fkProdutora) REFERENCES produtora (idProdutora)
)auto_increment = 2050;

insert into anime values 
(null,'One piece' ,200,1,107),
(null,'Violet Evergarden' ,201,2,101);

select * from anime;

create table saga(
	idSaga int primary key auto_increment,
    nome varchar(45),
    fkAnimeSaga int,
    fkProdutoraSaga int,
    fkLightSaga int,
    fkMangaSaga int,
    fkManhwaSaga int,
    fkdestribuidoraLightSaga int,
    fkDestribuidoraMangaSaga int,
    fkDestribuidoraManhwaSaga int,
    constraint fkAnimeSaga foreign key (fkAnimeSaga)
		references anime(idAnime),
	constraint fkProdutoraSaga foreign key (fkProdutoraSaga)
		references produtora(idProdutora),
	constraint fkLightSaga foreign key (fkLightSaga)
		references lightnovel(idLightnovel),
	constraint fkMangaSaga foreign key (fkMangaSaga)
		references manga(idManga),
	constraint fkManhwaSaga foreign key (fkManhwaSaga)
		references manhwa(idManhwa),
	constraint fkdestribuidoraLightSaga foreign key (fkdestribuidoraLightSaga)
		references destribuidora(idDestribuidora),
	constraint fkdestribuidoraMangaSaga foreign key (fkdestribuidoraMangaSaga)
		references destribuidora(idDestribuidora),
	constraint fkdestribuidoraManhwaSaga foreign key (fkdestribuidoraManhwaSaga)
		references destribuidora(idDestribuidora)
);

insert into saga values 
(null,'East Blue', 2050, 107, 2050, null, null, 152, null, null),
(null,'Saga Alabasta', 2050, 107, 2050, null, null, 152, null, null),
(null,'Saga Skypiea', 2050, 107, 2050, null, null, 152, null, null),
(null,'Saga Water 7', 2050, 107, 2050, null, null, 152, null, null),
(null,'Saga Thriller Bark', 2050, 107, 2050, null, null, 152, null, null),
(null,'Saga Guerra de Marineford', 2050, 107, 2050, null, null, 152, null, null),
(null,'Uma garota em um pais estrangeiro', null, 100, null, 2051, null, 152, null, null);




create table episodio(
    idEpisodio int auto_increment,
    nome varchar(45),
    fkSaga int,
    constraint saga foreign key (fkSaga) references saga(idSaga),
    constraint pkEpisodio primary key (idEpisodio, fkSaga)
) auto_increment = 2000;

	

create table capitulo(
    idCapitulo int auto_increment,
    nome varchar(45),
    fkSagaCapitulo int,
    constraint fkSagaCapitulo foreign key (fkSagaCapitulo)
        references saga(idSaga),
    constraint pkCapitulo primary key (idCapitulo, fkSagaCapitulo)
) auto_increment = 2500;