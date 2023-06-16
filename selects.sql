-- *1  select do nome do autor buscando apenas os vivos e que a data de nasc começe com 1do mais velho pro mais novo

SELECT nome FROM autor where statusvida = 'vivo' and dtNasc like '1%' order by dtNasc;

-- *2 select do idMangaka e o nome do mangaka buscando as datas de nasc indefinidas 

select idMangaka , nome from mangaka where dtNasc is null;

-- *3 select idade e alcunha dos personagens com nome 'Monkey D.Luffy'

select idade , alcunha from personagem where nome = 'Monkey D.Luffy' ;

-- *4 select nome e objetivo do personagem buscando pela idade igual a 17 ordenado pela nome em ordem decrecente    

select nome, objetivo from personagem where idade = 17 order by nome desc;

-- *5 nome que tem espaço " " no seu nome

select nome from generoPrincipal where nome like '% %';

-- *6 nome e dtNasc de mangakas mortos de maneira que eles fiquem em uma ordem crescente

select nome, dtNasc from mangaka where statusvida = 'morto' order by dtNasc;


-- *7 dados da obra com o id 202

select * from obra where idObra =202;

-- *8 busque pelos nomes dos animes onde a fkProdutora tem o id = 107 de maneira onde os nomes fiquem em order alfabética

select nome from anime where fkProdutora = 107 order by nome;


-- *9 busque o nome , id dtNAsc de apenas do primeiro autor que tem a letra o no nome

select idAutor, nome, dtNasc from autor  where nome like '%O%' order by idAutor  limit 1;


-- *10 busque o nome , id dtNAsc de apenas do ultimo autor que tem a letra o no nome

select idAutor, nome, dtNasc from autor  where nome like '%O%' order by idAutor desc limit 1;


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


-- ^ 01 me informe o nome dos animes, o nome de suas produtoras e as datas de criação dessas produtoras nessa order  apenas dos animes que tenham a palavra "ONE" em seus nomes 

select anime.nome , produtora.nome , produtora.dtCriacao from anime join produtora on fkProdutora = idProdutora where anime.nome like '%One%';


-- ^ 02 me informe os id's das sagas, os nomes das sagas e os nomes das produtoras  apenas das sagas que possuem o id maior do que 7 e menor do que 11 de forma que os dados fiquem em uma order crescente ordenada pelo id

select idSaga, saga.nome , idProdutora,  produtora.nome from saga join produtora on fkProdutoraSaga = idProdutora where idSaga > 7 and idsaga <11 and produtora.nome like '%T%' order by idsaga;

-- ^ 03 

select * from anime join obra on fkObraAnime=idObra ;

select * from episodio;
