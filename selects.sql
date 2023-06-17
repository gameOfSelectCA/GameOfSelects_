-- *1  select do nome do autor buscando apenas os vivos e que a data de nasc começe com 1do mais velho pro mais novo

SELECT nome FROM autor where statusvida = 'vivo' and dtNasc like '1%' order by dtNasc;

-- *2 select do idMangaka e o nome do mangaka buscando as datas de nasc indefinidas 

select idMangaka , nome from mangaka where dtNasc is null;

-- *3 select idade e alcunha dos personagens com nome 'Monkey D.Luffy'

select idade , alcunha from personagem where nome = 'Monkey D.Luffy' ;

-- *4 select nome e objetivo do personagem buscando pela idade igual a 17 ordenado pela nome em ordem decrecente    

select nome, objetivo from personagem where idade = 17 order by nome desc;

-- *5 nome de personagem que possuem espaço " " no seu nome

select nome from generoPrincipal where nome like '% %';

-- *6 nome e dtNasc de mangakas mortos de maneira que eles fiquem em uma ordem crescente

select nome, dtNasc from mangaka where statusvida = 'morto' order by dtNasc;


-- *7 dados da obra com o id 202

select * from obra where idObra =202;


-- *8 busque pelos nomes dos animes onde a fkProdutora tem o id = 107

select nome from anime where fkProdutora = 107 ;


-- *9 busque o nome , id e dtNAsc de apenas do primeiro autor que tem a letra o no nome

select idAutor, nome, dtNasc from autor  where nome like '%O%' order by idAutor  limit 1;


-- *10 busque o id nome ,  dtNAsc de apenas do primeiro autor que tem a letra o no nome

select idAutor, nome, dtNasc from autor  where nome like '%O%' order by idAutor limit 1;


-- *11 fazer um select que pegue todos os itens da tabela manga em order decrescente pelo id
select * from manga order by idManga desc;


-- *12 fazer um select que pegue todos os dados da tabela episodio onde o nome possua a letra "A" em qualquer posição
select * from episodio where  nome like '%A%';

-- *13 fazer um select que pegue os 2 primeiros dados da tabela autor
select * from autor limit 2;

-- *14 fazer um select que deixe os dados de maneira decrecente ordenandos pelo id e pegue os 2 ultimos dados da tabela autor
select * from autor  order by idAutor desc limit 2 ;

-- *15 fazer um select que pegue todos os itens da tabela saga cujo o nome seja "East Blue"
select * from saga where nome='East Blue';


-- ^ 01 me informe o nome dos animes, o nome de suas produtoras e as datas de criação dessas produtoras nessa ordem apenas dos animes que tenham a palavra "ONE" em seus nomes 

select anime.nome , produtora.nome , produtora.dtCriacao from anime join produtora on fkProdutora = idProdutora where anime.nome like '%One%';


-- ^ 02 me informe os id's das sagas, os nomes das sagas e os nomes das produtoras apenas das sagas que possuem o id maior do que 7 e menor do que 11 de forma que os dados fiquem em uma ordem crescente ordenados pelo id sendo que o nome da produtora precise ter a letra t em algum lugar

select idSaga, saga.nome , idProdutora,  produtora.nome from saga join produtora on fkProdutoraSaga = idProdutora where idSaga > 7 and idsaga <11 and produtora.nome like '%T%' order by idsaga;

-- ^ 03 me informe os nomes das obras, e animes que Oriundam dessa respectivas obras junto aos id's desses animes selecionando apenas os nomes de animes que sejam diferentes dos nomes de suas obras   

select obra.nome, anime.nome, idAnime from anime join obra on fkObraAnime=idObra where anime.nome != obra.nome;


-- ^ 04 me diga a quantidade de episodios que fazem parte da primeira e da segunda temporada de inuyasha juntas ("inuyasha temporada-1","inuyasha temporada-2")

select count(idEpisodio) from episodio join saga on idsaga = fkSaga where saga.nome ='inuyasha temporada-1' or saga.nome ='inuyasha temporada-2';


-- ^ 05 capture os ids dos episodios, os nomes dos episodios e os nomes das sagas onde onde o id dos episodios sejam maior que 2002 e menor 2050 e o nome dos episodios começem com a letra "O"

select episodio.idEpisodio, episodio.nome, saga.nome from episodio join saga on idsaga = fkSaga where idEpisodio >2002 and idEpisodio <2050 and episodio.nome like 'O%';

-- ^ 06 capture os ids dos epsodios, os nomes dos episodios e das sagas
select episodio.idEpisodio, episodio.nome, saga.nome from episodio join saga on idsaga = fkSaga ;


-- ^ 07 capture apenas o id e nome do ultimo episodio cadastrado da primeira temporada de inuyasha
select  max(idEpisodio) ,max(nome) from episodio;



-- ^ 08 busque pelos nomes e data de nascimento dos autores e pelo nomes de seus mangas selecinando apenas os que NÃO são nulos

select autor.nome,autor.dtNasc, manga.nome from autor join manga on fkAutorManga=idAutor where dtNasc is not  null;


-- ^ 09  busque o id e o nome dos mangas e o nome e dtCriação de suas distribuidoras na order alfabetica pelo nome da distribuidora

select idManga, manga.nome, destribuidora.nome, dtCriacao from manga join destribuidora on idDestribuidora = fkDestribuidoraManga order by destribuidora.nome;

-- ^ 10 busque o nome da obra e o seu genero principal apenas dos generos que tenham a letra "A" e exiba esses dados na ordem alfabetica pelo nome da obra
select obra.nome, generoPrincipal.nome from obra join generoPrincipal on idGeneroPrincipal= fkGenero where generoPrincipal.nome like '%A%' order by obra.nome;


-- ! 01 select dos nomes dos 'protagonistas', os nomes das obras e de seus animes onde o protagonista precise ter mais de 16 anos 

select personagem.nome, obra.nome, anime.nome from personagem join obra on fkProtagonistaObra = idPersonagem join anime on anime.fkObraAnime= obra.idObra where personagem.idade >16;


-- ! 02 mostre por meio de um select chamado resultado quantos episodios a "inuyasha temporada-1 " tem a mais do que "inuyasha temporada-4" 

select (select count(idEpisodio) from episodio join saga on idsaga = fkSaga where saga.nome ='inuyasha temporada-4' )-(select count(idEpisodio) from episodio join saga on idsaga = fkSaga where saga.nome ='inuyasha temporada-1');


-- ! 03 

