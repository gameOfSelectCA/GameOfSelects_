create database gameSelect use gameSelect create table autor(
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

create table mangaka(
    idMangaka int primary key auto_increment,
    nome varchar(45),
    idade int,
    statusvida varchar(5),
    statusvida check (
        statusvida in (
            'vivo'
            or 'morto'
        )
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
    constraint fkPersonagem foreign key (fkPersonagem) references personagem(idPersonagem) constraint pkObra primary key (
        idObra,
        fkAutor,
        fkGenero,
        fkProtagonistaObra,
        fkPersonagem
    )
) auto_increment = 200;

create table lightnovel(
idLightnovel int auto_increment,
nome int,
fkObra int,
fkAutor int,
fkDestribuidora int,
fkMangaka int,
constraint fkObraAutorLight foreign key(fkObra,fkAutor)
    references obra (idObra,fkAutor),
constraint fkDestribuidoraLight foreign key (fkDestribuidora) REFERENCES destribuidora (idDestribuidora),
constraint fkMangakaLight foreign key (fkMangaka) REFERENCES mangaka (idMangaka),
constraint pkLightnovel primary key (fkDestribuidora, idLightnovel)
)auto_increment = 250;

create table manga(
idManga int auto_increment,
nome int,
fkObra int,
fkAutor int,
fkDestribuidora int,
fkMangaka int,
constraint fkObraAutorManga foreign key(fkObra,fkAutor)
    references obra (idObra,fkAutor),
constraint fkDestribuidoraLight foreign key (fkDestribuidora) REFERENCES destribuidora (idDestribuidora),
constraint fkMangakaLight foreign key (fkMangaka) REFERENCES mangaka (idMangaka),
constraint pkManga primary key (fkDestribuidora, idManga)
)auto_increment = 300;

create table manhawa(
idManhawa int auto_increment,
nome int,
fkObra int,
fkAutor int,
fkDestribuidora int,
fkMangaka int,
constraint fkObraAutorManhawa foreign key(fkObra,fkAutor)
    references obra (idObra,fkAutor),
constraint fkDestribuidoraLight foreign key (fkDestribuidora) REFERENCES destribuidora (idDestribuidora),
constraint fkMangakaLight foreign key (fkMangaka) REFERENCES mangaka (idMangaka),
constraint pkManhawa primary key (fkDestribuidora, idManhawa)
)auto_increment = 350;

create table anime(
idAnime int auto_increment,,
nome int,
fkObra int,
fkAutor int,
fkProdutora int,
constraint fkObraAutorAnime foreign key(fkObra,fkAutor)
    references obra (idObra,fkAutor),
constraint fkProdutoraAnime foreign key (fkProdutora) REFERENCES produtora (idProdutora),
constraint pkanime primary key (fkProdutora, idAnime)
)auto_increment = 400;


create table personagem(
    idPersonagem int primary key auto_increment,
    nome varchar(45),
    idade int,
    alcunha varchar(45),
    objetivo varchar(45),
) auto_increment = 1000;

create table generoPrincipal(
    idGeneroPrincipal int primary key auto_increment,
    nome varchar(45)
) auto_increment = 1500;

create table episodio(
    idEpisodio int primary key auto_increment,
    nome varchar(45),
    fkSaga int,
    fkAnime int,
    fkProdutora int,
    constraint saga foreign key (fkSaga) references saga(idSaga),
    constraint Anime foreign key (fkAnime) references anime(iAnime),
    constraint Produrora foreign key (fkProdutora) references produrora(idProdurora)
) auto_increment = 2000;

create table capitulo(
    idCapitulo int primary key auto_increment,
    nome varchar(45),
    fkSaga int,
    fkManga int,
    fklightNovel int,
    fkManhwa int,
    fkDestribuidora int,
    constraint saga foreign key (fksaga) references saga(idSaga),
    constraint Manga foreign key (fkManga) references manga(idManga),
    constraint lightnovel foreign key (fkLightnovel) references lightnovel(idLightnovel),
    constraint manhawa foreign key (fkManhawa) references manhawa(idManhawa),
    constraint Destribuidora foreign key (fkDestribuidora) references destribuidora(idDestribuidora)
) auto_increment = 2500;