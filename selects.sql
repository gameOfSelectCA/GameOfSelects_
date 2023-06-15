-- *1  select do nome do autor buscando apenas os vivos e que a data de nasc começe com 1

SELECT nome FROM autor where statusvida = 'vivo' and dtNasc like '1%' order by nome;

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


-- *11 fazer um select que pegue todos os itens da tabela manga
select * from manga;


-- *12 fazer um select que pegue todos os itens da tabela manga
select * from manga;

-- *13 fazer um select que pegue todos os itens da tabela manga
select * from manga;

-- *14 fazer um select que pegue todos os itens da tabela manga
select * from manga;

-- *15 fazer um select que pegue todos os itens da tabela saga cujo o nome seja East Blue
select * from saga where nome='East Blue';
