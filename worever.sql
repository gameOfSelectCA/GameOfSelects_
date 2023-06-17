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
(null,'Wit Studio','2012-06-01'), -- xpto 101
(null,'MAPPA','2011-06-14'), -- xpto 102
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
(null, 'Shueisha','1997-03-03');



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
    objetivo varchar(450)
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
(null,'Violet Evergarden',2,1500,1001),
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


insert into lightnovel values 
(null,'Violet Evergarden',201 ,2,152, 52);


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
    nome varchar(100),
    fkSaga int,
    constraint saga foreign key (fkSaga) references saga(idSaga),
    constraint pkEpisodio primary key (idEpisodio, fkSaga)
) auto_increment = 2000;

	

create table capitulo(
    idCapitulo int auto_increment,
    nome varchar(100),
    fkSagaCapitulo int,
    constraint fkSagaCapitulo foreign key (fkSagaCapitulo)
        references saga(idSaga),
    constraint pkCapitulo primary key (idCapitulo, fkSagaCapitulo)
) auto_increment = 2500;




/* inserts */




insert into autor values
(null,'Rumiko Takahashi','1957-10-10','vivo'),
(null,'Natsume Akatsuki.',null,'vivo'),
(null,'Tsuyoshi Yoshioka',null,'vivo') ,
(null,'Hajime Isayama','1986-08-29','vivo');


insert into mangaka values
(null,'Rumiko Takahashi','1957-10-10','vivo'),

(null,'Kurone Mishima',null,'vivo'),

(null,'Masahito Watari',null,'vivo'),

(null,'Seiji Kikuchi',null,'vivo') ,
(null,'Hajime Isayama','1986-08-29','vivo'),
 
(null,'Shunsuke Ogata',null,'vivo');

insert into destribuidora values
(null,'Weekly Shōnen Sunday','1959-05-17'),
(null,'Kadokawa Sneaker Bunko',null), 
(null,'Kadokawa Shoten','1945-11-10'), 
(null,'Famitsu Bunko','1998-07-18'),
(null,'Kodansha','1909-01-01'),
(null,'tankobon','1909-01-01');

insert into produtora values 
(null,'Yomiuri TV','1958-02-13'),
(null,'Studio Deen','1975-05-14'),
(null,'Silver Link','2007-12-01');


insert into personagem values
(null,'Inuyasha',200, null,'conseguir todos os fragmentos das joias de quatro almas.'),

(null, 'Kagome',15,'reencarnação da kykio', 'recuperar os fragmentos da joia de quatro almas.'),

(null,'Sesshoumaru',200, null,'se vingar do Naraku'),

(null,'Kasuma',17,null,'viver'),

(null,'Megumin',14,null,'se tornar a maior maga de explosôes'),

(null,'Eren Yeger',17,null,'TATAKAE'),

(null,'Mikasa',15,null,'Erem'),

(null,'Levi',31,null,'L-i-m-p-a-r'),

(null,'Shin Wolford',16,null,'se formar na academia de magia');




insert into obra values
(null,'Sengoku Otogizōshi InuYasha',4,1506,1003),

(null,'Kono Subarashii Sekai ni Shukufuku o!',5,1509,1006),

(null,'kenja no mago',6,1507,1011),
(null,'Shingeki no kyoujin',7,1501,1008);



insert into manga values
(null,'Sengoku Otogizōshi InuYasha',203,4,156,54),

(null,'Kono Subarashii Sekai ni Shukufuku o!',204,5,158,56),

(null,'kenja no mago',205,6,159,57),
(null,'Shingeki no kyoujin',206,7,160,58);



insert into lightnovel values
(null,'Inuyasha',203,4,156,54),
(null,'Kono Subarashii Sekai ni Shukufuku o!',204,5,157,55),
(null,'kenja no mago',205,6,160,59);




insert into anime values
(null,'inuyasha',203,4,112) ,
(null,'Kono Subarashii Sekai ni Shukufuku o!',204,5,113),
(null,'kenja no mago',205,6,114),
(null,'shingeki no kyoujin',206,7,101),
(null,'shingeki no kyoujin',206,7,102);

insert into saga values
(null,'inuyasha temporada-1',2052,112,null,2051,null,null,150,null),
(null,'inuyasha temporada-2',2052,112,null,2051,null,null,150,null),
(null,'inuyasha temporada-3',2052,112,null,2051,null,null,150,null),
(null,'inuyasha temporada-4',2052,112,null,2051,null,null,150,null),
(null,'inuyasha temporada-5',2052,112,null,2051,null,null,150,null),
(null,'inuyasha temporada-6',2052,112,null,2051,null,null,150,null),
(null,'Arco de Axel',2053,113,2052,2052,null,157,158,null),
(null,'Arco do Beldia',2053,113,2052,2052,null,157,158,null),
(null,'Um Segundo Arco da Morte',2053,113,2052,2052,null,157,158,null),
(null,'Arco da Wiz',2053,113,2052,2052,null,157,158,null),
(null,'O Arco do Destroyer',2053,113,2052,2052,null,157,158,null),
(null,'Injustiça Judicial',2053,113,2052,2052,null,157,158,null),
(null,'Arco da Masmorra de Keele',2053,113,2052,2052,null,157,158,null),
(null,'Arco da Darkness',2053,113,2052,2052,null,157,158,null),
(null,'Arco do Vanir',2053,113,2052,2052,null,157,158,null),
(null,'Arco da Queda de Shiganshina',2055,101,null,2054,null,null,160,null),
(null,'Arco do Batalha do Distrito de Trost',2055,101,null,2054,null,null,160,null),
(null,'Arco do Treinamento da 104ª Tropa',2055,101,null,2054,null,null,160,null),
(null,'Arco da Titã Fêmea',2055,101,null,2054,null,null,160,null),
(null,'Arco do Confronto dos Titãs',2055,101,null,2054,null,null,160,null),
(null,'Arco do Governo Real',2055,101,null,2054,null,null,160,null),
(null,'Arco do Retorno à Shiganshina',2055,101,null,2054,null,null,160,null),
(null,'Arco de Marley',2056,102,null,2054,null,null,160,null),
(null,'Arco da Guerra por Paradis',2056,102,null,2054,null,null,160,null);



insert into episodio values
(null,'A Garota que Volta no Tempo e o Garoto Lacrado',8),
(null, 'As pessoas atrás da Jóia de Quatro Almas',8),
(null, 'A volta pelo poço ComeOssos',8),
(null, 'Yura dos Cabelos Invertidos',8),
(null, 'O Temível Príncipe Sesshoumaru',8),  
(null, 'Tessaiga: o canino de aço destruidor',8),  
(null, 'O confronto: Sesshoumaru vs. Tessaiga',8),
(null, 'O Senhor Feudal youkai: Sapo de tsukumo',8), 
(null, 'Entra em cena Shippou!; Os irmãos youkai relâmpago Hitten e Manten',8),
(null, 'Confronto da espada: relâmpago contra Tesaiga',8),
(null, 'A máscara da maldição que ressuscita na época actual',8),
(null, 'Tatarimoke e o pequeno espírito mau',8),
(null, 'O segredo do primeiro dia: Inuyasha de cabelos pretos',8),
(null, 'O roubo dos ossos sagrados da Kikyou',8),
(null, 'O renascimento da infeliz sacerdotisa Kikyou',8),
(null, 'O buraco do vento na mão direita: Miroku, o monge delinquente',8),
(null, 'A tinta corrompida do pintor do Inferno',8),
(null, 'A aliança de Naraku e Sesshoumaru',8),
(null, 'Volte para a sua era, Kagome!',8),
(null, 'O enigma de Onigumo, o ladrão diabólico',8),
(null, 'A verdade sobre a origem de Naraku; A alma de Kikyou (Parte 1)',8),
(null, 'A verdade sobre a origem de Naraku; A alma de Kikyou (Parte 2)',8),
(null, 'A voz de Kagome e o beijo de Kikyou',8),
(null, 'Sango, a exterminadora de youkais',8),
(null, 'Derrotando o plano de Naraku',8),
(null, 'O segredo da Jóia de Quatro Almas é finalmente revelado',8),
(null, 'O Lago da Escuridão controlado pelo Deus da Água',8),
(null,'Miroku cai numa armadilha',9),
(null,'A angústia de Sango e a vida de Kohaku',9),
(null,'A Tessaiga roubada e o confronto no castelo de Naraku',9),
(null,'Jinenji, o youkai bondoso e solitário',9),
(null,'Kikyou e Inuyasha atraídos pelo Miasma',9),
(null,'Kikyou é raptada',9),
(null,'Tesaiga e Tenseiga',9),
(null,'A célebre espada escolhe o seu verdadeiro mestre',9),
(null,'O rapto de Kagome; Kouga, o youkai lobo superveloz',9),
(null,'O youkai que se apaixonou por Kagome',9),
(null,'Separados, os dois se dão conta dos seus sentimentos',9),
(null,'Um plano ardiloso; A luta de vida ou morte',9),
(null,'A armadilha de Kagura, a mestra dos ventos',9),
(null,'A dança de Kagura e o espelho de Kanna',9),
(null,'A Ferida do Vento refletida',9),
(null,'A Tesaiga é finalmente quebrada',9),
(null,'A espada malígna de Kaijinbou',9),
(null,'Sesshoumaru saca Toukijin',9),
(null,'Juuroumaru e Kageroumaru',9),
(null,'O coração de Onigumo ainda vive em Naraku',9),
(null,'Quero voltar ao lugar onde nos conhecemos',9),
(null,'A memória perdida de Kohaku',9),
(null,'O rosto que não sai do meu coração',9),
(null,'O coração consumido de Inuyasha',9),
(null,'A verdadeira natureza do youkai não pode ser reprimida',9),
(null,'O inimigo mortal do meu pai: Ryoukossei',9),
(null,'Onda Explosiva: o ataque supremo da Tessaiga',9),
(null,'A flor de pedra e o primeiro amor de Shippou',10),
(null,'A armadilha da bela princesa na névoa',10),
(null,'Tudo o que aconteceu na noite em Tougenkyou (Parte 1)',10),
(null,'Tudo o que aconteceu na noite em Tougenkyou (Parte 2)',10),
(null,'As belas irmãs aprendizes',10),
(null,'A sacerdotisa das sombras; Uma maldição de 50 anos',10),
(null,'Kikyou aparece!; O uso do Shikigami',10),
(null,'A maldição cruel de Tsubaki',10),
(null,'A sacerdotisa azul e a sacerdotisa vermelha que bloqueiam o caminho',10),
(null,'Tahou, o youkai gigante da torre!',10),
(null,'Adeus aos dias de juventude',10),
(null,'A barreira de Naraku; A decisão de Kagura',10),
(null,'O devastador vento da traição',10),
(null,'O grande desafio de Shippou',10),
(null,'O terrível homem sem rosto',10),
(null,'A memória recuperada de Onigumo',10),
(null,'A batalha dos três até à morte',10),
(null,'O estranho treino de Toutousai',10),
(null,'A mãe e os sentimentos de Shiori',10),
(null,'A Tessaiga vermelha que quebra a barreira',10),
(null,'A conspiração dos quatro youkais gatos de fogo',10),
(null,'Os alvos são: Sesshoumaru e Inuyasha',10),
(null,'Os gatos de fogo e a espada de dois caninos',10),
(null,'Sango, só você',10),
(null,'O plano de Jaken para roubar a Tessaiga',10),
(null,'Sesshoumaru e o rapto de Rin',10),
(null,'Naraku despedaçado; E seu paradeiro?',10),
(null,'A ligação entre o Presente e a Época das Guerras',10),
(null,'A youkai loba e a grande promessa',11),
(null,'O proposta de casamento super veloz',11),
(null,'O aumento da energia maligna; A cabeça do youkai',11),
(null,'O segredo da princesa',11),
(null,'A viagem solitária de Kikyou',11),
(null,'Os três youkais do Deus Macaco',11),
(null,'O confronto entre Inuyasha e Houjo',11),
(null,'A corajosa declaração de Souta',11),
(null,'O espiritualista misterioso e a Kirara negra',11),
(null,'A ambição dos ressuscitados',11),
(null,'O enigma do monge devasso',11),
(null,'Os criadores da Jóia de Quatro Almas (Parte 1)',11),
(null,'Os criadores da Jóia de Quatro Almas (Parte 2)',11),
(null,'Jaken fica doente',11),
(null,'Kirara não volta',11),
(null,'Kikyou e Kagome sozinhas numa caverna',11),
(null,'Kouga e Sesshoumaru! Um perigoso confronto!',11),
(null,'Pesadelo Real! A batalha na Floresta do Desespero',11),
(null,'Sete anos depois: As neves eternas',11),
(null,'O líder dos youkais lobos é atacado por um zombi',11),
(null,'O exército dos sete ressuscitados',11),
(null,'Mukotsu, o envenenador',11),
(null,'O terrível guerreiro de aço, Guinkoutsu',11),
(null,'Sepultados sob as chamas',11),
(null,'As primeiras lágrimas de Inuyasha',11),
(null,'O segredo do explendor puro',11),
(null,'O monte sagrado Hakurei',11),
(null,'Surge o líder dos Shichinintai: Bankotsu',11),
(null,'Acerto de contas: Banryuu contra Ferida do Vento',12),
(null,'A barreira na Ilha Hijiri',12),
(null,'O Dokko sagrado e o segredo da múmia',12),
(null,'A batalha solitária de Kouga',12),
(null,'Engolido pela luz negra',12),
(null,'A nova aparência de Naraku',12),
(null,'O rio de fogo',12),
(null,'No coração do Monte Hakurei',12),
(null,'Um Santo divino e malicioso',12),
(null,'Adeus!; Uma marcha fúnebre para Jakotsu',12),
(null,'A batalha final!; O último e mais forte dos Shichinintai',12),
(null,'Poderosa Banryuu!; O combate mortal dentro do Monte Hakurei',12),
(null,'Naraku regenerado além da escuridão',12),
(null,'Adeus, minha querida Kikyou',12),
(null,'A escuridão no coração de Kagome',12),
(null,'Transformando a dor em coragem',12),
(null,'Os terríveis youkais secos',12),
(null,'Os youkais invadem o festival cultural',12),
(null,'Cho Kyukai e as noivas roubadas',12),
(null,'O rugido e a ferida no coração de Shippou',12),
(null,'Os pergaminhos de Kannon',12),
(null,'A mais perigosa confissão de Miroku',12),
(null,'A mulher que amou Sesshoumaru (Parte 1)',12),
(null,'A mulher que amou Sesshoumaru (Parte 2)',12),
(null,'O último banquete do mestre de Miroku',12),
(null,'Um youkai invisível aparece!',12),
(null,'O nome da ancestral é Kagome',12),
(null,'A Sobrevivência numa terra infestada de youkais',12),
(null,'O grande duelo na cascata Shohun',13),
(null,'Sentimentos eternos',13),
(null,'A libertação do monstruoso cavalo youkai Entei',13),
(null,'A fuga de Entei',13),
(null,'A viagem em busca do pai',13),
(null,'Housenki e o último fragmento',13),
(null,'Os estranhos guardiões do portal',13),
(null,'Abi, a incontrolável dominadora de aves',13),
(null,'Uma fatídica canção de amor antes de nos encontrarmos (Parte 1)',13),
(null,'Uma fatídica canção de amor antes de nos encontrarmos (Parte 2)',13),
(null,'A flecha que causa problemas',13),
(null,'A luz que guia à um santo',13),
(null,'A intuição de Kagome',13),
(null,'Proteger e roubar',13),
(null,'Uma Reunião Cruel',13),
(null,'A youkai que conecta com o outro Mundo',13),
(null,'O youkai que protege o fragmento',13),
(null,'Sesshoumaru enfrenta Inuyasha',13),
(null,'Aniquilando Naraku',13),
(null,'Uma Correria de Ratos youkai',13),
(null,'A Decisão de Kohaku',13),
(null,'Um Jovem violento que atrai a Felicidade',13),
(null,'O erro no Passado do monge Miroku',13),
(null,'Para sempre junto de Sesshoumsama',13),
(null,'Kohaku, Sango, Kirara e o Jardim Secreto da Flor',13),
(null,'O maior dos inimigo; Pupa parasita de Shippou',13),
(null,'A Grande Pista para Derrotar Naraku',13),
(null,'O compromisso do casal para o uso da Jóia (parte 1)',13),
(null,'O compromisso do casal para o uso da Jóia (parte 2)',13),
(null,'Esta deusa autoproclamada e uma reencarnação em outro mundo!',14),
(null,'Uma explosão para este chūnibyō!',14),
(null,'Um tesouro de lingerie para esta mão direita!',14),
(null,'Magia explosiva para este inimigo formidável!',15),
(null,'Um prêmio por esta espada amaldiçoada!',15),
(null,'Uma conclusão para essa luta inútil!',15),
(null,'Uma segunda morte nesta estação congelante!',16),
(null,'Uma mão carinhosa para nossa equipe quando não conseguirmos superar o inverno!',17),
(null,'Uma bênção para esta loja maravilhosa!',18),
(null,'Uma última chama para esta fortaleza aberrante!',18),
(null,'Alívio para este julgamento injusto!',19),
(null,'Um amigo para essa garota demônio escarlate!',19),
(null,'Paz para o mestre deste labirinto!',20),
(null,'Um noivo para a filha desta nobre!',21),
(null,'Um escravo de um cavaleiro mascarado!',22),
(null,'Um escravo de um cavaleiro mascarado!',22),
(null,'Um convite para esse idiota acabado!',22),
(null,'Turismo para esta cidade miserável!',23),
(null,'Uma deusa para esta cidade de fontes termais corruptas!',23),
(null,'Uma bênção para este grupo maravilhoso!',23),
(null, 'Um bebê na floresta vai à capital', 23),
(null, 'O novo aluno não-convencional', 23),
(null, 'Surge uma emergência!', 23),
(null, 'O nome do instigador', 23),
(null, 'Um novo herói pioneiro', 23),
(null, 'Estouro de uma guerra e um exercício de treinamento em conjunto', 23),
(null, 'Vamos ao acampamento!', 23),
(null, 'Um pedido iluminado pelas estrelas', 23),
(null, 'O neto, o artefato mágico e a festa de noivado', 23),
(null, 'A queda do império', 23),
(null, 'A mais poderosa companhia de mágicos', 23),
(null, 'Então, vamos pelo mundo', 23);



insert into capitulo values
(null,'InuYasha capitulo1',8),
(null,'InuYasha capitulo2',8),
(null,'InuYasha capitulo3',8),
(null,'InuYasha capitulo4',8),
(null,'InuYasha capitulo5',8),
(null,'InuYasha capitulo6',8),
(null,'InuYasha capitulo7',8),
(null,'InuYasha capitulo8',8),
(null,'InuYasha capitulo9',8),
(null,'InuYasha capitulo93',8),
(null,'InuYasha capitulo94',9),
(null,'InuYasha capitulo95',9),
(null,'InuYasha capitulo96',9),
(null,'InuYasha capitulo97',9),
(null,'InuYasha capitulo98',9),
(null,'InuYasha capitulo99',9),
(null,'InuYasha capitulo186',9),
(null,'InuYasha capitulo187',9),
(null,'InuYasha capitulo188',9),
(null,'InuYasha capitulo189',9),
(null,'InuYasha capitulo190',9),
(null,'InuYasha capitulo191',10),
(null,'InuYasha capitulo192',10),
(null,'InuYasha capitulo193',10),
(null,'InuYasha capitulo194',10),
(null,'InuYasha capitulo195',10),
(null,'InuYasha capitulo196',10),
(null,'InuYasha capitulo197',10),
(null,'InuYasha capitulo198',10),
(null,'InuYasha capitulo199',10),
(null,'InuYasha capitulo279',10),
(null,'InuYasha capitulo280',11),
(null,'InuYasha capitulo281',11),
(null,'InuYasha capitulo282',11),
(null,'InuYasha capitulo283',11),
(null,'InuYasha capitulo284',11),
(null,'InuYasha capitulo285',11),
(null,'InuYasha capitulo286',11),
(null,'InuYasha capitulo287',11),
(null,'InuYasha capitulo288',11),
(null,'InuYasha capitulo289',11),
(null,'InuYasha capitulo372',11),
(null,'InuYasha capitulo373',12),
(null,'InuYasha capitulo374',12),
(null,'InuYasha capitulo375',12),
(null,'InuYasha capitulo376',12),
(null,'InuYasha capitulo377',12),
(null,'InuYasha capitulo378',12),
(null,'InuYasha capitulo379',12),
(null,'InuYasha capitulo380',12),
(null,'InuYasha capitulo465',12),
(null,'InuYasha capitulo466',13),
(null,'InuYasha capitulo467',13),
(null,'InuYasha capitulo468',13),
(null,'InuYasha capitulo469',13),
(null,'InuYasha capitulo470',13),
(null,'InuYasha capitulo471',13),
(null,'InuYasha capitulo472',13),
(null,'InuYasha capitulo558',13),
(null,'kono subarashii sekai ni shukufuku wo capitulo1',14),
(null,'kono subarashii sekai ni shukufuku wo capitulo2',14),
(null,'kono subarashii sekai ni shukufuku wo capitulo3',14),
(null,'kono subarashii sekai ni shukufuku wo capitulo4',14),
(null,'kono subarashii sekai ni shukufuku wo capitulo5',14),
(null,'kono subarashii sekai ni shukufuku wo capitulo6',14),
(null,'kono subarashii sekai ni shukufuku wo capitulo7',14),
(null,'kono subarashii sekai ni shukufuku wo capitulo8',15),
(null,'kono subarashii sekai ni shukufuku wo capitulo9',15),
(null,'kono subarashii sekai ni shukufuku wo capitulo10',15),
(null,'kono subarashii sekai ni shukufuku wo capitulo11',15),
(null,'kono subarashii sekai ni shukufuku wo capitulo12',15),
(null,'kono subarashii sekai ni shukufuku wo capitulo13',15),
(null,'kono subarashii sekai ni shukufuku wo capitulo14',15),
(null,'kono subarashii sekai ni shukufuku wo capitulo15',16),
(null,'kono subarashii sekai ni shukufuku wo capitulo16',16),
(null,'kono subarashii sekai ni shukufuku wo capitulo17',16),
(null,'kono subarashii sekai ni shukufuku wo capitulo18',16),
(null,'kono subarashii sekai ni shukufuku wo capitulo19',16),
(null,'kono subarashii sekai ni shukufuku wo capitulo20',16),
(null,'kono subarashii sekai ni shukufuku wo capitulo21',16),
(null,'kono subarashii sekai ni shukufuku wo capitulo22',17),
(null,'kono subarashii sekai ni shukufuku wo capitulo23',17),
(null,'kono subarashii sekai ni shukufuku wo capitulo24',17),
(null,'kono subarashii sekai ni shukufuku wo capitulo25',17),
(null,'kono subarashii sekai ni shukufuku wo capitulo26',17),
(null,'kono subarashii sekai ni shukufuku wo capitulo27',17),
(null,'kono subarashii sekai ni shukufuku wo capitulo28',17),
(null,'kono subarashii sekai ni shukufuku wo capitulo29',18),
(null,'kono subarashii sekai ni shukufuku wo capitulo30',18),
(null,'kono subarashii sekai ni shukufuku wo capitulo31',18),
(null,'kono subarashii sekai ni shukufuku wo capitulo32',18),
(null,'kono subarashii sekai ni shukufuku wo capitulo33',18),
(null,'kono subarashii sekai ni shukufuku wo capitulo34',18),
(null,'kono subarashii sekai ni shukufuku wo capitulo35',18),
(null,'kono subarashii sekai ni shukufuku wo capitulo36',19),
(null,'kono subarashii sekai ni shukufuku wo capitulo37',19),
(null,'kono subarashii sekai ni shukufuku wo capitulo38',19),
(null,'kono subarashii sekai ni shukufuku wo capitulo39',19),
(null,'kono subarashii sekai ni shukufuku wo capitulo40',19),
(null,'kono subarashii sekai ni shukufuku wo capitulo41',19),
(null,'kono subarashii sekai ni shukufuku wo capitulo42',19),
(null,'kono subarashii sekai ni shukufuku wo capitulo43',20),
(null,'kono subarashii sekai ni shukufuku wo capitulo44',20),
(null,'kono subarashii sekai ni shukufuku wo capitulo45',20),
(null,'kono subarashii sekai ni shukufuku wo capitulo46',20),
(null,'kono subarashii sekai ni shukufuku wo capitulo47',20),
(null,'kono subarashii sekai ni shukufuku wo capitulo48',20),
(null,'kono subarashii sekai ni shukufuku wo capitulo49',20),
(null,'kono subarashii sekai ni shukufuku wo capitulo50',21),
(null,'kono subarashii sekai ni shukufuku wo capitulo51',21),
(null,'kono subarashii sekai ni shukufuku wo capitulo52',21),
(null,'kono subarashii sekai ni shukufuku wo capitulo53',21),
(null,'kono subarashii sekai ni shukufuku wo capitulo54',21),
(null,'kono subarashii sekai ni shukufuku wo capitulo55',21),
(null,'kono subarashii sekai ni shukufuku wo capitulo56',21),
(null,'kono subarashii sekai ni shukufuku wo capitulo57',22),
(null,'kono subarashii sekai ni shukufuku wo capitulo58',22),
(null,'kono subarashii sekai ni shukufuku wo capitulo59',22);
