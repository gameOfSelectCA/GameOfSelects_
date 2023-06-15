-- ^1  select do nome do autor buscando apenas os vivos e que a data de nasc começe com 1

SELECT nome FROM autor where statusvida = 'vivo' and dtNasc like '1%' order by nome;

-- ^2 select do idMangaka e o nome do mangaka buscando as datas de nasc indefinidas 

select idMangaka , nome from mangaka where dtNasc is null;

-- ^3 select idade e alcunha dos personagens com nome 'Monkey D.Luffy'

select idade , alcunha from personagem where nome = 'Monkey D.Luffy' ;

-- ^4 select nome e objetivo do personagem buscando pela idade igual a 17 ordenado pela nome em ordem decrecente    

select nome, objetivo from personagem where idade = 17 order by nome desc;

-- ^5 nome que tem espaço " " no seu nome

select nome from generoPrincipal where nome like '% %';

-- ^6 nome e dtNasc de mangakas mortos de maneira que eles fiquem em uma ordem crescente

select nome, dtNasc from mangaka where statusvida = 'morto' order by dtNasc;


-- ^7 