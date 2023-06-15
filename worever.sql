create database gameSelect ;
drop database gameSelect ;
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
(null, 'Shueisha','1925-01-02');



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


insert into personagem values(null, 'Monkey D.Luffy', 17, 'quinto imperador','ser o rei dos piratas'),(null, 'violet', 14, 'automata','achar a paz'),(null, ' Chise Hatori', 15, 'Sleigh Beggy','aprender magia');

create table obra(
    idObra int auto_increment,
    nome varchar(45),
    fkAutor int,
    constraint fkAutor foreign key (fkAutor) references autor(idAutor),
    fkGenero int,
    constraint fkGenero foreign key (fkGenero) references generoPrincipal(idGeneroPrincipal),
    fkProtagonistaObra int,
    constraint fkProtagonistaObra foreign key (fkProtagonistaObra) references personagem(idPersonagem),
    
    constraint pkObra primary key (
        idObra,
        fkAutor,
        fkGenero,
        fkProtagonistaObra
        
    )
) auto_increment = 200;

insert into obra values
(null,'One Piece',1,1500,1000),
(null,'Violet Evergarden ',2,1500,1001),
(null,'Mahoutsukai no yome',3,1500,1002);

create table lightnovel(
    idLightnovel int primary key auto_increment,
    nome varchar(45),
    fkObra int,
    fkAutor int,
    fkDestribuidora int,
    fkMangaka int,
    constraint fkObraAutorLight foreign key(fkObra, fkAutor) references obra (idObra, fkAutor),
    constraint fkDestribuidoraLight foreign key (fkDestribuidora) REFERENCES destribuidora (idDestribuidora),
    constraint fkMangakaLight foreign key (fkMangaka) REFERENCES mangaka (idMangaka)
)auto_increment = 2050;


insert into lightnovel values (null,'Violet Evergarden',201 ,2,152, 52);

create table manga(
    idManga int primary key auto_increment,
    nome varchar(45),
    fkObra int,
    fkAutor int,
    fkDestribuidoraManga int,
    fkMangakaManga int,
    constraint fkObraAutorManga foreign key(fkObra, fkAutor) references obra (idObra, fkAutor),
    constraint fkDestribuidoraManga foreign key (fkDestribuidoraManga) REFERENCES destribuidora (idDestribuidora),
    constraint fkMangakaManga foreign key (fkMangakaManga) REFERENCES mangaka (idMangaka)
)auto_increment = 2050;

insert into manga values (null,'One Piece', 200, 1, 152,51),(null,'Violet Evergarden',201 ,2,152, 52);

create table manhwa(
    idManhwa int primary key auto_increment,
    nome int,
    fkObra int,
    fkAutor int,
    fkDestribuidora int,
    fkMangakaManhwa int,
    constraint fkObraAutorManhawa foreign key(fkObra, fkAutor) references obra (idObra, fkAutor),
    constraint fkDestribuidoraManhwa foreign key (fkDestribuidora) REFERENCES destribuidora (idDestribuidora),
    constraint fkMangakaManhwa foreign key (fkMangakaManhwa) REFERENCES mangaka (idMangaka)
)auto_increment = 2050;

create table anime(
    idAnime int primary key auto_increment,
    nome varchar(45),
    fkObra int,
    fkAutor int,
    fkProdutora int,
    constraint fkObraAutorAnime foreign key(fkObra, fkAutor) references obra (idObra, fkAutor),
    constraint fkProdutoraAnime foreign key (fkProdutora) REFERENCES produtora (idProdutora)
)auto_increment = 2050;

insert into anime values (null,'One piece' ,200,1,107),(null,'Violet Evergarden' ,201,2,101);
select * from anime;
create table saga(
	idSaga int auto_increment,
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
		references destribuidora(idDestribuidora),
	constraint pkSaga primary key 
    (idSaga, fkAnimeSaga, fkLightSaga, fkMangaSaga, fkManhwaSaga, fkdestribuidoraLightSaga, fkdestribuidoraMangaSaga, fkdestribuidoraManhwaSaga)
);

create table episodio(
    idEpisodio int primary key auto_increment,
    nome varchar(45),
    fkSaga int,
    fkAnime int,
    fkProdutora int,
    constraint saga foreign key (fkSaga) references saga(idSaga),
    constraint Anime foreign key (fkAnime) references anime(idAnime),
    constraint Produrora foreign key (fkProdutora) references produtora(idProdutora)
) auto_increment = 2000;

	

create table capitulo(
    idCapitulo int primary key auto_increment,
    nome varchar(45),
    fkSagaCapitulo int,
    fkManga int,
    fklightNovel int,
    fkManhwa int,
    fkDestribuidora int,
    constraint sagaCapitulo foreign key (fksagaCapitulo) references saga(idSaga),
    constraint Manga foreign key (fkManga) references manga(idManga),
    constraint lightnovel foreign key (fkLightnovel) references lightnovel(idLightnovel),
    constraint manhwa foreign key (fkManhwa) references manhwa(idManhwa),
    constraint Destribuidora foreign key (fkDestribuidora) references destribuidora(idDestribuidora)
) auto_increment = 2500;

