create database gameSelect

use gameSelect

create table autor(
idAutor,
nome,
)

create table mangaka(
idMangaka,
nome,
)

create table produrora(
idProdurora,
nome,
)

create table destribuidora(
idDestribuidora,
nome,
)


create table obra(
    idObra,
    nome,
)

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