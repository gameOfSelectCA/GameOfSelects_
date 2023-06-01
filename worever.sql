create database gameSelect ;
use gameSelect;
 create table autor(
    idAutor int primary key auto_increment,
    nome varchar(45),
    dtNasc date,
    statusvida varchar(5),
    constraint statusvida check (
        statusvida in (
            'vivo'
            or 'morto'
        )
    )
);

insert into autor values 
();


create table mangaka(
    idMangaka int primary key auto_increment,
    nome varchar(45),
    idade int,
    statusvida2 varchar(5),
    constraint statusvida2 check (
	statusvida2 in ('vivo' or 'morto')
    )
) auto_increment = 50;

create table produtora(
    idProdutora int primary key auto_increment,
    nome varchar(45),
    dtCriacao date
) auto_increment = 100;

create table destribuidora(
    idDestribuidora int primary key auto_increment,
    nome varchar(45),
    dtCriacao date
) auto_increment = 150;

create table generoPrincipal(
    idGeneroPrincipal int primary key auto_increment,
    nome varchar(45)
) auto_increment = 1500;

create table personagem(
    idPersonagem int primary key auto_increment,
    fkProtagonista int,
    constraint fkProtagonista foreign key (fkProtagonista)
		references personagem(idPersonagem),
    nome varchar(45),
    idade int,
    alcunha varchar(45),
    objetivo varchar(45)
) auto_increment = 1000;

create table obra(
    idObra int auto_increment,
    nome varchar(45),
    fkAutor int,
    constraint fkAutor foreign key (fkAutor) references autor(idAutor),
    fkGenero int,
    constraint fkGenero foreign key (fkGenero) references generoPrincipal(idGeneroPrincipal),
    fkProtagonistaObra int,
    constraint fkProtagonistaObra foreign key (fkProtagonistaObra) references personagem(fkProtagonista),
    fkPersonagem int,
    constraint fkPersonagem foreign key (fkPersonagem) references personagem(idPersonagem),
    constraint pkObra primary key (
        idObra,
        fkAutor,
        fkGenero,
        fkProtagonistaObra,
        fkPersonagem
    )
) auto_increment = 200;



create table lightnovel(
    idLightnovel int primary key auto_increment,
    nome int,
    fkObra int,
    fkAutor int,
    fkDestribuidora int,
    fkMangaka int,
    constraint fkObraAutorLight foreign key(fkObra, fkAutor) references obra (idObra, fkAutor),
    constraint fkDestribuidoraLight foreign key (fkDestribuidora) REFERENCES destribuidora (idDestribuidora),
    constraint fkMangakaLight foreign key (fkMangaka) REFERENCES mangaka (idMangaka)
)auto_increment = 2050;

create table manga(
    idManga int primary key auto_increment,
    nome int,
    fkObra int,
    fkAutor int,
    fkDestribuidoraManga int,
    fkMangakaManga int,
    constraint fkObraAutorManga foreign key(fkObra, fkAutor) references obra (idObra, fkAutor),
    constraint fkDestribuidoraManga foreign key (fkDestribuidoraManga) REFERENCES destribuidora (idDestribuidora),
    constraint fkMangakaManga foreign key (fkMangakaManga) REFERENCES mangaka (idMangaka)
)auto_increment = 2050;

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
    nome int,
    fkObra int,
    fkAutor int,
    fkProdutora int,
    constraint fkObraAutorAnime foreign key(fkObra, fkAutor) references obra (idObra, fkAutor),
    constraint fkProdutoraAnime foreign key (fkProdutora) REFERENCES produtora (idProdutora)
)auto_increment = 2050;

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