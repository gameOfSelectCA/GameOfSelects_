create database gameSelect

use gameSelect

create table autor(
idAutor int primary key auto_increment,
nome varchar(45),
dtNasc date,
statusvida varchar(5),
constraint statusvida check 
(statusvida in ('vivo' or 'morto'))
);

create table mangaka(
idMangaka int primary key auto_increment,
nome varchar(45),
idade int,
statusvida varchar(5),
statusvida check 
(statusvida in ('vivo' or 'morto'))
)auto_increment = 50;

create table produtora(
idProdutora int primary key auto_increment,
nome varchar(45),
dtCriacao date
)auto_increment = 100;

create table destribuidora(
idDestribuidora int primary key auto_increment,
nome varchar(45),
dtCriacao date
)auto_increment = 150;


create table obra(
idObra int auto_increment,
nome varchar(45),
fkAutor int,
constraint fkAutor foreign key (fkAutor)
    references autor(idAutor),
fkGenero int,
constraint fkGenero foreign key (fkGenero)
    references generoPrincipal(idGeneroPrincipal),
fkProtagonistaObra int,
constraint fkProtagonistaObra foreign key (fkProtagonistaObra)
    references personagem(fkProtagonista),
fkPersonagem int,
constraint fkPersonagem foreign key (fkPersonagem)
    references personagem(idPersonagem)
constraint pkObra primary key 
    (idObra,fkAutor,fkGenero,fkProtagonistaObra,fkPersonagem)
)auto_increment = 200;

create table lightnovel(
idLightnovel,
nome int,
fkObra int,
fkAutor int,
fkDestribuidora int,
fkMangaka int,
constraint fkObraAutorLight foreign key(fkObra,fkAutor)
    references obra (idObra,fkAutor),
constraint fkDestribuidoraLight foreign key (fkDestribuidora) REFERENCES destribuidora (idDestribuidora),
constraint fkMangakaLight foreign key (fkMangaka) REFERENCES mangaka (idMangaka)
);

create table manga(
idManga,
nome int,
fkObra int,
fkAutor int,
fkDestribuidora int,
mangaka int,
constraint fkObraAutorManga foreign key(fkObra,fkAutor)
    references obra (idObra,fkAutor),
constraint fkDestribuidoraLight foreign key (fkDestribuidora) REFERENCES destribuidora (idDestribuidora),
constraint fkMangakaLight foreign key (fkMangaka) REFERENCES mangaka (idMangaka),
);

create table manhawa(
idManhawa,
nome int,
fkObra int,
fkAutor int,
fkDestribuidora int,
mangaka int,
constraint fkObraAutorManhawa foreign key(fkObra,fkAutor)
    references obra (idObra,fkAutor),
constraint fkDestribuidoraLight foreign key (fkDestribuidora) REFERENCES destribuidora (idDestribuidora),
constraint fkMangakaLight foreign key (fkMangaka) REFERENCES mangaka (idMangaka),
);

create table anime(
idAnime int primary key auto_increment,
nome int,
fkObra int,
fkAutor int,
fkProdutora int,
constraint fkObraAutorAnime foreign key(fkObra,fkAutor)
    references obra (idObra,fkAutor),
constraint fkProdutoraAnime foreign key (fkProdutora) REFERENCES produtora (idProdutora),
);

create table personagem(
idPersonagem,
nome,
alcunha,
)

create table generoPrincipal(
idGeneroPrincipal
nome
)

create table episodio(
idEpisodio
nome
)

create table capitulo(
idCapitulo
nome
)

create autor(
idAutor
nome
)

create autor(
idAutor
nome
)

create autor(
idAutor
nome
)

create autor(
idAutor
nome
)