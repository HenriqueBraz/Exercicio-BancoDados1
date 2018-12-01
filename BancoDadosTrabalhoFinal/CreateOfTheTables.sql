CREATE TABLE AGLOMERADOS(
	COD_ID NUMBER(10) NOT NULL,
	NOME VARCHAR(300) NOT NULL,
	DISTÂNCIA_TERRA VARCHAR(30) NOT NULL,
	DECLINAÇÃO VARCHAR(20) NOT NULL,
	ASC_RETA VARCHAR(10) NOT NULL,
	IDADE VARCHAR(30) NOT NULL,
	MEMBROS_GRUPO VARCHAR(200) NOT NULL,
	IMAGEM VARCHAR (255),
	CONSTRAINTS PK_COD_ID PRIMARY KEY (COD_ID),
	CONSTRAINTS UQ_NOME UNIQUE (NOME)
);
CREATE TABLE GALAXIAS (
	COD_ID NUMBER(10) NOT NULL,
	NOME VARCHAR(100) NOT NULL,
	SIGNIFICADO VARCHAR(450),
	DIAMETRO NUMBER(10),
	OBSERVACAO VARCHAR(400),
	AGLOMERADO NUMBER(10) NOT NULL,
	IMAGEM VARCHAR(255),
	CONSTRAINT PK_GALAXIAS_COD_ID PRIMARY KEY (COD_ID),
	CONSTRAINT UQ_GALAXIAS_NOME UNIQUE (NOME),
	CONSTRAINT FK_GALAXIAS_AGLOMERADO FOREIGN KEY (AGLOMERADO)
	REFERENCES AGLOMERADOS (COD_ID)
);
CREATE TABLE CONSTELACOES (
	COD_ID NUMBER(10) NOT NULL,
	NOME VARCHAR(100) NOT NULL,
	SIGNIFICADO VARCHAR(255),
	AREA VARCHAR(100),
    GALAXIA NUMBER(10) NOT NULL,
	CONSTRAINT PK_CONSTELACOES_COD_ID PRIMARY KEY (COD_ID),
	CONSTRAINT UQ_CONSTELACOES_NOME UNIQUE (NOME),
    CONSTRAINT FK_CONSTELACOES_GALAXIA FOREIGN KEY (GALAXIA)
	REFERENCES GALAXIAS (COD_ID)
);
CREATE TABLE ESTRELAS (
	COD_ID NUMBER(10) NOT NULL,
	NOME VARCHAR(255) NOT NULL,
	CATEGORIA VARCHAR(100),	
	MASSA VARCHAR(100),
	ANCENSAO VARCHAR(100),
	DECLINACAO VARCHAR(100),
	MAG_APARENTE VARCHAR(15),
	MAG_ABSOLUTA VARCHAR(15),
	DISTANCIA VARCHAR(20),
	CLASSIFICACAO VARCHAR(100),
	LUMINOSIDADE VARCHAR(255),
	CONSTELACAO NUMBER(10) NOT NULL,
	IMAGEM VARCHAR(300),
	CONSTRAINT PK_ESTRELAS_COD_ID PRIMARY KEY (COD_ID),
	CONSTRAINT UQ_ESTRELAS_NOME UNIQUE (NOME),
	CONSTRAINT FK_ESTRELAS_CONSTELACOES FOREIGN KEY (CONSTELACAO)
	REFERENCES CONSTELACOES (COD_ID)
);
CREATE TABLE PLANETAS (
	COD_ID NUMBER(10) NOT NULL,
    NOME VARCHAR(100) NOT NULL,
    CATEGORIA VARCHAR (100),
    SATELITES NUMBER(3),
    MASSA VARCHAR(100),
    GRAVIDADE_SUPERFICIAL VARCHAR(100),
    ANO_DESCOBERTA NUMBER(4),
    ORBITA_ESTELAR NUMBER(10) NOT NULL,
    IMAGEM VARCHAR(255),
    CONSTRAINT PK_PLANETAS_COD_ID PRIMARY KEY (COD_ID),
    CONSTRAINT UQ_PLANETAS_NOME UNIQUE (NOME),
    CONSTRAINT FK_PLANETAS_ESTRELAS FOREIGN KEY (ORBITA_ESTELAR)
	REFERENCES ESTRELAS (COD_ID) 
 );
 
 
 --Inserts para a tabela AGLOMERADOS:



INSERT INTO AGLOMERADOS VALUES('001', 'Aglomerado Fornax', 'null', '-35º ‘27', '03h 38m', 'null', 'Grupo NGC, Abell S0373',  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/NGC_1399_Hubble_WikiSky.jpg/250px-NGC_1399_Hubble_WikiSky.jpg');

INSERT INTO AGLOMERADOS VALUES('002', 'Aglomerado Trio do Leão', '35 milhões de anos luz', '+13º 25’', '11h 17m', 'null', 'Grupo M66, Arp 317, LGG 231, NOGG P1 533, NOGG P2 543', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Galaxies-M65-M66-NGC3628.jpeg/250px-Galaxies-M65-M66-NGC3628.jpeg');

INSERT INTO AGLOMERADOS VALUES('003',' Grupo IC 342/Maffei', 'null', 'null', 'null', 'null', 'Grupo IC342, Grupo Maffei, LGG104', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Maf1atlas.jpg/250px-Maf1atlas.jpg');

INSERT INTO AGLOMERADOS VALUES('004', 'Grupo M96', 'null', '12', '12','null','Grupo Leo I, LGG217, NOGG H 507, NOGG P1 498, NOGG P2 507', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/AnttlersM95-m96.jpg/250px-AnttlersM95-m96.jpg');

INSERT INTO AGLOMERADOS VALUES('005', 'Grupo Centaurus A/M83', 'null', '-44º 58’', '13h 20m','null', 'Grupo NGC 5128, Grupo Centaurus A, Grupo M83, LGG 344', 'null');

INSERT INTO AGLOMERADOS VALUES('006', 'Grupo do Escultor', 'null', '-25º 17’', '00h 48m', 'null', 'Grupo NGC 253, LGG4, Filamento do Escultor, Grupo do Polo Sul, Grupo do Polo Sul Galactico', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Ngc253_2mass_barred_spiral.jpg/250px-Ngc253_2mass_barred_spiral.jpg');

INSERT INTO AGLOMERADOS VALUES('007', 'Aglomerado de Virgem', 'null',' +12º 43’', '12h 27m’', 'null', 'Grupo Virgem I', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Virgngc.jpg/250px-Virgngc.jpg');

INSERT INTO AGLOMERADOS VALUES('008', 'M94', 'null', '12', '12', 'null', 'Grupo NGC 4736, Grupo Canes I, Nuvem de Canes Venaticini, LGG290, NOGG H617, NOGG P1 636, NOGG P2 647', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Ngc4736-nuc-hst-R814G555B450.jpg/280px-Ngc4736-nuc-hst-R814G555B450.jpg');

INSERT INTO AGLOMERADOS VALUES('009', 'Grupo M101', 'null', '+54º 31’', '14h 04m', 'null', 'Grupo NGC 5457, LGG 371, NOGG H758, NOGG P1 766, NOGG P2 781', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/M101_hires_STScI-PRC2006-10a.jpg/280px-M101_hires_STScI-PRC2006-10a.jpg');

INSERT INTO AGLOMERADOS VALUES('010', 'Grupo NGC 5866', 'null', '+56º 26’', '15h 12m', 'null', 'Grupo NGC 5907, LGG 396, NOGG H 836, NOGG H P841, NOGG P2 856', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Ngc5866_hst_big.jpg/250px-Ngc5866_hst_big.jpg');

INSERT INTO AGLOMERADOS VALUES('011', 'Aglomerado Sextans A', '13 Milhões de anos luz', '04º 41’ 34’’ ', '10h 11m', 'null','UGCA 205, DDO75, PGC29653', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Local.group.arp.600pix.jpg/280px-Local.group.arp.600pix.jpg');

INSERT INTO AGLOMERADOS VALUES('012', 'Aglomerado 47 Tucanae', '850 anos luz', '-72º 04’ 52,6’‘', '00h 24m', '~10 bilhões de anos','Tuc, NGC 104, GCI 1', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/47tuc_salt.jpg/200px-47tuc_salt.jpg');

INSERT INTO AGLOMERADOS VALUES('013', 'Aglomerado do Pato Selvagem', '6200 anos luz', '-06º 16’ 00,0’ ', '18h 51m', '220 milhões de anos', 'NGC 6705', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Messier11.jpg/200px-Messier11.jpg');

INSERT INTO AGLOMERADOS VALUES('014', 'Aglomerado de Pegasus', 'null', '+15º', '23h', 'null', 'Cavalo Alado', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Local.group.arp.600pix.jpg/200px-Local.group.arp.600pix.jpg');

INSERT INTO AGLOMERADOS VALUES('015', 'Aglomerado Canes Venatici', 'null', '+40º', '13h', 'null', 'Cães de Caça', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Bootes_%26_Coma_Berenices.gif/250px-Bootes_%26_Coma_Berenices.gif');

INSERT INTO AGLOMERADOS VALUES('016', 'Aglomerado Coma Berenice', 'null', '+22º', '13h', 'null', 'Cabeleira de Berenice', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Ssc2007-10a1.jpg/120px-Ssc2007-10a1.jpg');

INSERT INTO AGLOMERADOS VALUES('017', 'Grupo M94', 'null', '12', '12', 'null', 'Grupo NGC 4736, Grupo Canes I, Nuvem de Canes Venaticini, LGG290, NOGG H617, NOGG P1 636, NOGG P2 647', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Ngc4736-nuc-hst-R814G555B450.jpg/280px-Ngc4736-nuc-hst-R814G555B450.jpg');

INSERT INTO AGLOMERADOS VALUES('018', 'Grupo Local', 'null', 'null', 'null', 'null', 'Galáxia de Andrômedra, Via Láctea, Galáxia do Triângulo', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Local_Group.svg/683px-Local_Group.svg.png');
 
 
 
 
 --Inserts para a tabela GALAXIAS:


 

INSERT INTO GALAXIAS VALUES(1,'ANDROMEDA','Andrômeda, que é abreviação de Galáxia de Andrômeda, recebe o seu nome a partir da área do céu em que aparece, a constelação de Andrômeda. ',220000,'É o mais próximo grande galáxia da Via Láctea.',18,'https://upload.wikimedia.org/wikipedia/commons/9/98/Andromeda_Galaxy_%28with_h-alpha%29.jpg');

INSERT INTO GALAXIAS VALUES(2,'Olho Negro','Ela tem uma faixa escura espetacular de observar a poeira na frente do núcleo brilhante da galáxia, dando origem a seus apelidos do Olho Negro e Olho Mau. ',86000,'',8,'https://upload.wikimedia.org/wikipedia/commons/c/c4/Blackeyegalaxy.jpg');

INSERT INTO GALAXIAS VALUES(3,'BODE','Nomeado pelo Johann Elert Bode, que descobriu esta galáxia em 1774. ',7728000,'',18,'https://upload.wikimedia.org/wikipedia/commons/6/63/Messier_81_HST.jpg');

INSERT INTO GALAXIAS VALUES(4,'CARTWHEEL','A sua aparência visual é semelhante a uma roda de carroça com raios. ',150000,'',18,'https://upload.wikimedia.org/wikipedia/commons/2/26/Cartwheel_Galaxy.jpg');

INSERT INTO GALAXIAS VALUES(5,'CHARUTO','A sua aparência visual é semelhante a um charuto. ','','',18,'https://upload.wikimedia.org/wikipedia/commons/c/ce/M82_HST_ACS_2006-14-a-large_web.jpg');

INSERT INTO GALAXIAS VALUES(6,'COMETA','Esta galáxia é nomeado após a sua aparência incomum, olhando como um cometa. ','','',18,'https://upload.wikimedia.org/wikipedia/commons/0/0f/CometGalaxy.jpg');

INSERT INTO GALAXIAS VALUES(7,'Cosmos Redshift 7 ','O nome desta Galáxia baseia-se numa medição de desvio para o vermelho (z) de cerca de 7 (na verdade, Z = 6.604).','','A galáxia Cosmos Redshift 7 é relatada para ser a mais brilhante das galáxias mais distantes (z> 6) e contêm algumas das primeiras estrelas (primeira geração; População III) que produziram os elementos químicos necessários para a formação posterior de planetas e a vida como nós conhecemos.',18,'https://upload.wikimedia.org/wikipedia/commons/e/ee/Eso1524aArtist’s_impression_of_CR7_the_brightest_galaxy_in_the_early_Universe.jpg');

INSERT INTO GALAXIAS VALUES(8,'Objeto de Hoag','Nomeado pelo Arthur Hoag, que descobriu este objeto em 1950. ',120000,'É do subtipo Galáxia tipo-Hoag, e pode de fato ser uma Galáxia anel-Polar com o anel no plano de rotação do objeto central.',18,'https://upload.wikimedia.org/wikipedia/commons/d/da/Hoag%27s_object.jpg');

INSERT INTO GALAXIAS VALUES(9,'Grande Nuvem de Magalhães ','Nomeado pelo Ferdinand Magellan',14000,'Esta é a quarta maior galáxia do Grupo Local, e forma um par com a Pequena Nuvem de Magalhães, e de pesquisas recentes, não pode ser parte do sistema da Via Láctea de satélites em tudo. ',18,'https://upload.wikimedia.org/wikipedia/commons/9/94/Large.mc.arp.750pix.jpg');

INSERT INTO GALAXIAS VALUES(10,'Pequena Nuvem de Magalhães ','Nomeado pelo Ferdinand Magellan ',7000,'Ela forma um par com a Grande Nuvem de Magalhães, e de pesquisas recentes, não pode ser parte do sistema da Via Láctea de satélites em tudo. ',18,'https://upload.wikimedia.org/wikipedia/commons/7/7a/Small_Magellanic_Cloud_%28Digitized_Sky_Survey_2%29.jpg');

INSERT INTO GALAXIAS VALUES(11,'Objeto de Mayall','Nomeado pelo Nicholas Mayall, do Observatório Lick, que a descobriu.','','Também chamado de VV 32 e Arp 148, este é um objeto muito estranho, e é provável que não seja uma galáxia, mas duas galáxias passando por uma colisão. ',18,'https://cdn.spacetelescope.org/archives/images/thumb700x/heic0810ae.jpg');

INSERT INTO GALAXIAS VALUES(12,'CATAVENTO','Semelhante em aparência a um cata-vento ',200000,'',18,'https://upload.wikimedia.org/wikipedia/commons/c/c5/M101_hires_STScI-PRC2006-10a.jpg');

INSERT INTO GALAXIAS VALUES(13,'SOMBREIRO','Semelhante em aparência a um sombrero. ',50000,'',18,'https://upload.wikimedia.org/wikipedia/commons/5/5e/M104_ngc4594_sombrero_galaxy_hi-res.jpg');

INSERT INTO GALAXIAS VALUES(14,'GIRASSOL','Semelhante a um girassol ',98000,'',18,'https://upload.wikimedia.org/wikipedia/commons/f/f2/Messier_63.jpg');

INSERT INTO GALAXIAS VALUES(15,'GIRINO','O nome vem da semelhança da galáxia a um girino. ','','',18,'https://upload.wikimedia.org/wikipedia/commons/f/f9/UGC_10214HST.jpg');

INSERT INTO GALAXIAS VALUES(16, 'RODAMOINHO' , 'Dada a semelhança a um redemoinho esta galáxia é gravitacionalmente perturbada.' ,86000,'',18,'https://upload.wikimedia.org/wikipedia/commons/d/db/Messier51_sRGB.jpg');

INSERT INTO GALAXIAS  VALUES(17,'NGC 1300','NGC 1300 é uma galáxia espiral barrada (SBb) na direção da constelação de Eridanus.','','',18,'https://upload.wikimedia.org/wikipedia/commons/5/52/Hubble2005-01-barred-spiral-galaxy-NGC1300.jpg');

INSERT INTO GALAXIAS VALUES(18,'Messier 82','Messier 82 (NGC 3034) é uma galáxia irregular localizada a cerca de doze milhões de anos-luz (aproximadamente 3,679 megaparsecs) de distância na direção da constelação de Ursa Maior.','','',18,'https://upload.wikimedia.org/wikipedia/commons/c/ce/M82_HST_ACS_2006-14-a-large_web.jpg');

INSERT INTO GALAXIAS VALUES(19,'NGC 7319','NGC 7319 é uma galáxia espiral barrada pertencente ao Quinteto de Stephan. Está situada na constelação de Pegasus. ','','',18,'https://www.google.com.br/url?sa=i&rct=j&q=&esrc=s&source=imgres&cd=&cad=rja&uact=8&ved=2ahUKEwjM6OrX4aTeAhUIWpAKHQeiCsYQjRx6BAgBEAU&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FNGC_7319&psig=AOvVaw29BEowv6DH2KCzb3NI1SJY&ust=1540665851073014');

INSERT INTO GALAXIAS VALUES(20,'TRIANGULO','A galáxia do Triângulo (Messier 33, NGC 598) é uma galáxia espiral localizada a cerca de três milhões de anos-luz na direção da constelação do Triângulo.',60000,'Pode ser vista a olho nu em um céu noturno sob excelentes condições: é o objeto do céu profundo mais distante a ser visto sem o auxílio de instrumentos ópticos.',18,'https://upload.wikimedia.org/wikipedia/commons/2/2f/M33HunterWilson09.jpg');

INSERT INTO GALAXIAS VALUES(21,'Via Láctea','Via (Estrada, caminho) Leitoso. Formada por centenas de bilhões de estrelas, a galáxia possui estruturas diferenciadas entre si. No bojo central, que possui forma alongada, há uma grande concentração de estrelas, sendo que o exato centro da galáxia abriga um buraco negro supermassivo. Ao seu redor estende-se o disco galáctico, formado por estrelas dos mais diversos tipos, nebulosas e poeira interestelar, dentre outros.', '528500417','É onde moramos',18,'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/ALMA_and_the_centre_of_the_Milky_Way.jpg/280px-ALMA_and_the_centre_of_the_Milky_Way.jpg');



 
 --Inserts para a tabela CONSTELACOES:
 



INSERT INTO CONSTELACOES VALUES (1, 'Andrômeda', 'a princesa do mito grego', '722 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (2, 'Antlia', 'a Máquina Pneumática, ou bomba de ar', '239 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (3, 'Apus', 'a Ave-do-Paraíso', '206 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (4, 'Aquarius', 'Aquário, o Aguadeiro', '980 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (5, 'Aquila', 'a Águia', '652 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (6, 'Ara', 'o Altar, ou Ara', '237 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (7, 'Aries', 'o Carneiro', '441 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (8, 'Auriga', 'o Cocheiro', '657 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (9, 'Boötes', 'o Boieiro, ou Pastor.', '907 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (10, 'Caelum', 'o Cinzel, ou Buril', '125 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (11, 'Camelopardalis', 'a Girafa', '757 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (12, 'Câncer', 'o Caranguejo', '506 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (13, 'Canes Venatici', 'os Cães de Caça, ou Pegureiros', '465 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (14, 'Canis Major', 'o Cão Maior', '380 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (15, 'Canis Minor', 'o Cão Menor', '183 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (16, 'Capricornus', 'Capricórnio, a cabra do mar, ou Amalteia no mito grego', '414 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (17, 'Carina', 'a Carena (ou Quilha) do navio dos míticos argonautas', '494 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (18, 'Cassiopeia', 'a rainha grega', '598 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (19, 'Centaurus', 'o centauro rústico (não confundir com o Sagitário)', '1060 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (20, 'Cepheus', 'o rei mítico', '588 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (21, 'Cetus', 'a Baleia, ou Ceto (monstro marinho do mito grego)', '1231 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (22, 'Chamaeleon', 'o Camaleão', '132 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (23, 'Circinus', 'o Compasso', '93 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (24, 'Columba', 'a Pomba', '270 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (25, 'Coma Berenices', 'a Cabeleira de Berenice', '386 gr. qd.', 21);

INSERT INTO CONSTELACOES VALUES (26, 'Corona Australis', 'a Coroa Austral (ou Coroa do Sul)', '128 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (27, 'Corona Borealis', 'a Coroa Boreal (ou Coroa do Norte)', '179 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (28, 'Corvus', 'o Corvo', '184 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (29, 'Crater', 'a Taça, (na verdade uma salva)', '282 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (30, 'Crux', 'o Cruzeiro do Sul, ou Crucifixo (raro)', '68 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (31, 'Cygnus', 'o Cisne (às vezes também chamada "Cruzeiro do Norte")', '804 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (32, 'Delphinus', 'o Golfinho, ou Delfim', '189 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (33, 'Dorado', 'o Peixe Dourado', '179 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (34, 'Draco', 'o Dragão', '1083 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (35, 'Equuleus', 'Potro, o cavalinho', '72 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (36, 'Eridanus', 'o Rio', '1138 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (37, 'Fornax', 'a Fornalha', '398 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (38, 'Gemini', 'os Gêmeos', '514 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (39, 'Grus', 'o Grou', '366 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (40, 'Hércules', 'em grego, Héracles; filho de Zeus e maior dos heróis gregos', '1225 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (41, 'Horologium', 'o Relógio', '249 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (42, 'Hydra', 'Hidra (a cobra-monstro aquática do mito grego) (Fêmea)', '1303 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (43, 'Hydrus', 'Hidra Macho', '243 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (44, 'Indus', 'o Índio', '294 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (45, 'Lacerta', 'o Lagarto, ou Lagartixa', '201 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (46, 'Leo', 'o Leão, ou Leão Maior (raro)', '947 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (47, 'Leo Minor', 'o Leão Menor, ou Lionete', '232 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (48, 'Lepus', 'a Lebre', '290 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (49, 'Libra', 'a Balança', '538 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (50, 'Lupus', 'o Lobo', '334 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (51, 'Lynx', 'o Lince', '545 sq.deg.',21);

INSERT INTO CONSTELACOES VALUES (52, 'Lyra', 'a Lira', '286 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (53, 'Mensa', 'a Montanha da Mesa na Cidade do Cabo', '153 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (54, 'Microscopium', 'o Microscópio', '210 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (55, 'Monoceros', 'o Unicórnio, ou Monócero', '482 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (56, 'Musca', 'a Mosca', '138 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (57, 'Norma', 'a Régua, ou Esquadro', '165 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (58, 'Octans', 'o Oitante', '291 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (59, 'Ophiuchus', 'Ofiuco, ou Serpentário (tratador de serpentes)', '948 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (60, 'Orion', 'o caçador mítico', '594 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (61, 'Pavo', 'o Pavão', '378 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (62, 'Pegasus', 'Pégaso, o cavalo alado dos gregos', '1121 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (63, 'Perseus', 'Perseu, o herói grego que decapitou Medusa, rainha das górgonas', '615 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (64, 'Phoenix', 'a Fênix', '469 sq.deg.',21);

INSERT INTO CONSTELACOES VALUES (65, 'Pictor', 'o Pintor', '247 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (66, 'Pisces', 'os Peixes', '889 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (67, 'Piscis Austrinus', 'o Peixe Austral, ou Peixe do Sul', '245 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (68, 'Puppis', 'a Popa (do navio)', '673 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (69, 'Pyxis', 'a Bússola', '221 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (70, 'Reticulum', 'o Retículo', '114 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (71, 'Sagitta', 'a Flecha, ou Seta', '80 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (72, 'Sagittarius', 'Sagitário, o Arqueiro (o Quíron dos mitos gregos, centauro erudito e tutor dos heróis)', '867 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (73, 'Scorpius', 'o Escorpião', '497 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (74, 'Sculptor', 'o Escultor', '475 gr. qd.', 21);

INSERT INTO CONSTELACOES VALUES (75, 'Scutum', 'o Escudo', '109 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (76, 'Serpens', 'a Serpente, e única constelação dividida em duas regiões: Serpens Cauda, (a Cauda), e Serpens Caput (a Cabeça)', '637 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (77, 'Sextans', 'o Sextante', '314 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (78, 'Taurus', 'o Touro', '797 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (79, 'Telescopium', 'o Telescópio', '252 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (80, 'Triangulum', 'o Triângulo', '132 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (81, 'Triangulum Australe', 'o Triângulo Austral (Triângulo do Sul)', '110 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (82, 'Tucana', 'o Tucano', '295 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (83, 'Ursa Major', 'a Ursa Maior', '1280 gr. qd.', 21);

INSERT INTO CONSTELACOES VALUES (84, 'Ursa Minor', 'a Ursa Menor', '256 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (85, 'Vela', 'o Velame (do navio)', '500 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (86, 'Virgo', 'a Virgem', '1294 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (87, 'Volans', 'originalmente Piscis Volans, o Peixe-Voador', '141 gr. qd.',21);

INSERT INTO CONSTELACOES VALUES (88, 'Vulpecula', 'a Raposa, o raposinho, originalmente Vulpecula cum Anser, a Raposa com o Ganso', '268 gr. qd.',21);




--Inserts para a tabela ESTRELAS:



INSERT INTO ESTRELAS VALUES ('1','Sol','Estrela', '19891 × 10 ^30 kg',' 286,13°','63,87°','-26,74 ', '4,85',' 1,496×10^11  m', 'G2V', '3,846 × 10 ^26',60,'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/The_Sun_by_the_Atmospheric_Imaging_Assembly_of_NASA%27s_Solar_Dynamics_Observatory_-_20100819.jpg/800px-The_Sun_by_the_Atmospheric_Imaging_Assembly_of_NASA%27s_Solar_Dynamics_Observatory_-_20100819.jpg');

INSERT INTO ESTRELAS VALUES ('2','Sirio','Estrela', ' 2,063',' 06h 45m 08.9173s ',' -16° 42 58',' -1,46 ', ' 1,42',' 0,04 anos-luz ', ' A1V', ' 24,74',14,' https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Sirius_A_and_B_Hubble_photo.jpg/800px-Sirius_A_and_B_Hubble_photo.jpg');

INSERT INTO ESTRELAS VALUES ('3',' Canopus','Estrela', ' 8,0 ± 0,3',' 06h 23m 57,11s ',' -52° 41 44,38',' -0,74 ', '-5,34 ',' 20 anos-luz ', 'A9II', '10700',17,'http://en.es-static.us/upl/2013/05/proxima_centauri-HST-October-2013.jpg');

INSERT INTO ESTRELAS VALUES ('4','Alpha Centauri','Estrela', '0,0039',' 14h 39m 36,49s','-60° 50 02,37','1,33 ', 'A 4,40B 5,85',' 0,004 anos-luz ', 'G2V', '0,015',19,'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/ViaLacteaMeridionalis.jpg/300px-ViaLacteaMeridionalis.jpg');

INSERT INTO ESTRELAS VALUES ('5','Arcturus','Estrela', '0,06',' 14h 15m 39,7s ','+19° 10  56,7','-0,05 ', '0,016 ',' 0,2 anos-luz ', 'K0III', '170','9','https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Arcturus-star.jpg/270px-Arcturus-star.jpg');

INSERT INTO ESTRELAS VALUES ('6','Vega','Estrela', '','18h 36m 56,34s','+38° 47 01,28','0,03', '+0.58',' 0,07 anos-luz ', 'A0Va', '0,45','52','http://www.siteastronomia.com/wp-content/uploads/2013/11/vega.jpg');

INSERT INTO ESTRELAS VALUES ('7',' Gliese 581','Estrela', ' 0,31',' 15h 19m 27s',' -07° 43',' 20,209','10,57',' 0,03 anos-luz ', 'M3V', '0,013',49,' https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/RedDwarfNASA-hue-shifted.jpg/800px-RedDwarfNASA-hue-shifted.jpg');

INSERT INTO ESTRELAS VALUES ('8',' Upsilon Andromedae ','Estrela', ' 0,006','01 h  36 m  47,8416 s ',' + 41 ° 24 ',' 19,6443 ',' 4,10',' 0,05 anos-luz ', 'F9V', '3,57',1,' https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/UAnd_planets.png/800px-UAnd_planets.png');

INSERT INTO ESTRELAS VALUES ('9',' HD 17156','Estrela Subgigante', ' 0,018',' 02h 49m 44,49s','+71° 45 11,6','8,17', '3.70',' 255 anos-luz ', 'G0', '0,45',18,' https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/65Cyb-LB3-apmag.jpg/800px-65Cyb-LB3-apmag.jpg');

INSERT INTO ESTRELAS VALUES ('10',' WASP-11 / HAT-P-10','Estrela Anã ', ' 0,77',' 03h 09m 28,54s','+30° 40 24,85','0,15', 'Null',' 440 anos-luz ', 'K3V', '0,002',7,' https://upload.wikimedia.org/wikipedia/ko/8/8d/WASP-11.jpg');

INSERT INTO ESTRELAS VALUES ('11',' Epsilon Eridani','Estrela', ' 0,02',' 03 h  32 m  55,84496 ',' -09 ° 27 ',' 29,7312',' 3,736',' 10,5 anos-luz ','K2V','0,34',36,' https://upload.wikimedia.org/wikipedia/commons/d/da/Size_epsilon_eridani.png');

INSERT INTO ESTRELAS VALUES ('12','WASP-1 ','Estrela', ' 1,24',' 00 h  20 m  40,077 s ',' + 31 ° 59 ',' 23,79',' 11,79',' 1300 anos-luz ', 'F7V', '2,41',1,' https://upload.wikimedia.org/wikipedia/commons/e/ed/WASP-1.jpg');

INSERT INTO ESTRELAS VALUES ('13',' HD 186427','Estrela', ' 0,07',' 19h 54m 58,37s ',' +41° 52',' 17,53','7,43', '4,11',' 150,8 anos-luz ', 'G8V',31,' https://upload.wikimedia.org/wikipedia/commons/7/7c/HD188753_orbit.jpg');

INSERT INTO ESTRELAS VALUES ('14',' 51 Pegasi','Estrela do tipo Sol', ' 1,06',' 22h 57m 28s',' +20° 46',' 07,8','5,49',' 0,03 anos-luz ', ' G4-5Va', '1,30',62,' https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/51_Pegasi_b_v3.jpg/800px-51_Pegasi_b_v3.jpg');

INSERT INTO ESTRELAS VALUES ('15',' COROT-1','Estrela da Sequência Principal Anã Amarela', ' 0,15',' 06 h  48 m  19.1724s','-03 ° 06 ',' 07.7104 ','13,6',' 2.630 anos-luz ', 'G0V', '0,45',55,'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Heic0612b_H.jpg/800px-Heic0612b_H.jpg');

INSERT INTO ESTRELAS VALUES ('16',' HAT-P-9','Estrela', ' 0,13',' 07 h  20 m  40,454 s ',' + 37 ° 08 ',' 26,35','0,27',' 1560 anos-luz ', 'F','',8,' http://www.robotplanet.dk/astro/exoplanets/hat-p-9_b.png');

INSERT INTO ESTRELAS VALUES ('17','HD 209458 ','Estrela', ' 0,03',' 22h 03m 10,8s','18° 53', '047,65', '0,10',' 154 anos-luz ', 'G0V', '1,61',62,'https://upload.wikimedia.org/wikipedia/commons/0/00/HD209458.jpg');

INSERT INTO ESTRELAS VALUES ('18','Regulo','Estrela mais brilhante da constelação de Leão ', '3,5',' 10h 08m 22,3s','+11° 58','13,5', '-0,52',' 1 anos-luz ', 'B7', '0,31',46,'https://1.bp.blogspot.com/-aINTPhwDmxQ/WKRPvod2AzI/AAAAAAAAOAg/pedqjNb-v_o3WnVOZFqDjAxh3zP79mx7wCLcB/s1600/REGULUS%2BESTRELA%2BCOMPARA%25C3%2587%25C3%2583O.jpg ');

INSERT INTO ESTRELAS VALUES ('19','Espiga','Estrela a mais brilhante da constelação de Virgem ',' 0,68',' 13h 25m 11,5793s ','-11° 09 40,759 ','+1,04', '-3,55',' 260 anos-luz ', 'B1', '12 100',86,'https://upload.wikimedia.org/wikipedia/commons/5/56/Finding_spica.png');

INSERT INTO ESTRELAS VALUES ('20','Rigel ','Estrela a sétima mais brilhante do céu ', ' 18',' 05h 14m 32,3s','-08° 12 05,9 ','0,12', '-6,7',' 700 anos-luz ', 'B8lab', '85 000',60,'https://upload.wikimedia.org/wikipedia/commons/1/1f/Rigel_sun_comparison.png');

INSERT INTO ESTRELAS VALUES ('21','Procion','Estrela', ' 0,012',' 07h 39m 18,12s ','+05° 13 29,96 ','0,37', '2,64',' 0,029 anos-luz ', 'F5IV', '1,0',15,'http://astropt.org/blog/wp-content/uploads/2012/03/canis-minor-procyon.bmp ');

INSERT INTO ESTRELAS VALUES ('22','Beta Centauri ','Estrela', ' 0,017',' 14h 03m 49,4s ','-60° 22 22,9 ','0,60', '-4,62',' 361 anos-luz ', 'B1III', '0,45',19,'http://www.siteastronomia.com/wp-content/uploads/2017/08/beta-centauri-hadar.jpg ');

INSERT INTO ESTRELAS VALUES ('23','Antares','Estrela estrela supergigante vermelha', ' 15,5',' 16h 29m 24,46s ',' -26° 25','+1,09', '-5,28',' 600 anos-luz ', 'A0Va', ' 11 000–65 000',73,'http://www.siteastronomia.com/wp-content/uploads/2013/11/antares.jpg');

INSERT INTO ESTRELAS VALUES ('24',' Aldebaran','Estrela', ' 0,11',' 04h 35m 55,24s ',' +16° 30','0,86', '-0,65',' 1,04 anos-luz ', 'K5III', '32L',78,' http://www.siteastronomia.com/wp-content/uploads/2013/12/aldebaran.jpg');

INSERT INTO ESTRELAS VALUES ('25',' Betelgeuse','Estrela de brilho variável', ' 14',' 05h 55m 10,29s ',' +07° 24','+1,3', '-5,3',' 92 anos-luz ', ' M1-2 Ia-Iab', '4.520-14.968',60,' https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/A_plume_on_Betelgeuse_%28artist%E2%80%99s_impression%29.jpg/200px-A_plume_on_Betelgeuse_%28artist%E2%80%99s_impression%29.jpg');
 
 
 
 --Inserts para a tabela PLANETAS:
 
  

INSERT INTO planetas VALUES ('1','Mercúrio','Planeta', '0' , '3,3011×10^23 kg', '3,7 m/s²','1631' ,1,'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Mercury_in_color_-_Prockter07-edit1.jpg/280px-
Mercury_in_color_-_Prockter07-edit1.jpg');

INSERT INTO planetas VALUES ('2','Vênus','Planeta','0', '4,8685 ×10^24 kg', '8,87 m/s²','1790' ,1,'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Venus-real_color.jpg/280px-Venus-real_color.jpg ');

INSERT INTO planetas VALUES (3,'Terra','Planeta','1', '5,9736×10^24kg', '9,780327 m/s²','' ,1,'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/The_Earth_seen_from_Apollo_17.jpg/300px-The_Earth_seen_from_Apollo_17.jpg');

INSERT INTO planetas VALUES (4,'Marte','Planeta', '2' , '6,4174×10^23 kg', '3,711 m/s²','1460' ,1,'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Mars_Valles_Marineris_EDIT.jpg/280px-Mars_Valles_Marineris_EDIT.jpg');

INSERT INTO planetas VALUES (5,'Jupiter','Gigante Gasoso','79', '1,8986×10^27 kg', '24,79 m/s²','1610' ,1,'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Jupiter_and_its_shrunken_Great_Red_Spot.jpg/300px-Jupiter_and_its_shrunken_Great_Red_Spot.jpg' );

INSERT INTO planetas VALUES (6,'Saturno','Gigante Gasoso','62', '5,6846 × 10^26 kg', '10,44 m/s²','1610' ,1,'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Saturn_during_Equinox.jpg/300px-Saturn_during_Equinox.jpg');

INSERT INTO planetas VALUES (7,'Urano','Gigantes Gasoso','27', '(8,6810 ± 0,0013)×10^25', '8,69 m/s²','1781' ,1,'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Uranus2.jpg/280px-Uranus2.jpg');

INSERT INTO planetas VALUES (8,'Netuno','Gigante Gasoso','14', '1,0243×1026 kg', '11,15 m/s²','1846' ,1,'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Neptune_Full.jpg/280px-Neptune_Full.jpg');

INSERT INTO planetas VALUES (9,'Plutão','Planeta Anão','5', '(1,305 ± 0,007) × 10^22 kg', '0,658 m/s²','1930' ,1,'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Nh-pluto-in-true-color_2x_JPEG.jpg/280px-Nh-pluto-in-true-color_2x_JPEG.jpg');

INSERT INTO planetas VALUES (10,'Éris','Planeta Anão','1', '(1.66±0.02)×10²² kg', '0.82±0.02 m/s² ','1631' ,1,'https://www.inovacaotecnologica.com.br/noticias/imagens/010175111027-eris.jpg');

INSERT INTO planetas VALUES (11,'Ceres','Planeta anão','0', '9,5×10^20 kg', '0,27 m/s²','1801' ,1,'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Color_global_view_of_Ceres_-_Oxo_and_Haulani_craters.png/300px-Color_global_view_of_Ceres_-_Oxo_and_Haulani_craters.png');

INSERT INTO planetas VALUES (12,'Haumea','Planeta Anão','2', '(4,2±0,1)×10^21 kg', '2,4×10-12 m/s²','2004' ,1,'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/2003EL61art.jpg/250px-2003EL61art.jpg');

INSERT INTO planetas VALUES (13,'Makemake','Planeta Anão','1', '3X10^20 kg', '','2005' ,1,'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Makemake_hubble.png/290px-Makemake_hubble.png');

INSERT INTO planetas VALUES (14,'Gliese 581 b','Gigante Gasoso','', '15,65 MT', '','2005' ,7,'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Planet_Gliese_581_b.png/300px-Planet_Gliese_581_b.png');

INSERT INTO planetas VALUES (15,'Gliese 581 c','Planeta','', '≥5,36 MT', '','2007' ,7,'https://upload.wikimedia.org/wikipedia/commons/f/f5/Gliese_581_c.jpg');

INSERT INTO planetas VALUES (16,'Gliese 581 d','Planeta','', '6,98 MT', '','2007' ,7,'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Planet_Gliese_581_d.png/300px-Planet_Gliese_581_d.png');

INSERT INTO planetas VALUES (17,'Gliese 581 e','Planeta','', '1,94 MT', '','2009',7,'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Gliese_581_Artist%27s_impression.jpg/300px-Gliese_581_Artist%27s_impression.jpg');

INSERT INTO planetas VALUES (18,'Gliese 581 g','Planeta','', '3,1 – 4,3 MT', '','2010' ,7,'http://www.astronoo.com/images/articles/gliese581g-illustration_315.jpg');

INSERT INTO planetas VALUES (19,'Gliese 581 f','Gigante Gasoso ou super-terra','','≥ 7,0 M⊕', '','2010' ,7,'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Gliese_581_f.jpg/300px-Gliese_581_f.jpg');

INSERT INTO planetas VALUES (20,'Upsilon Andromedae b (Saffar)','Gigante gasoso','', '1.4 MJ', '','1996' ,8,'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Upsilon_Andromedae_b.jpg/300px-Upsilon_Andromedae_b.jpg');

INSERT INTO planetas VALUES (21,'HD 17156 b','Gigante Gasoso','', '1.275 ± 0.018 MJ', '','2007' ,9,'https://en.wikipedia.org/wiki/HD_17156_b#/media/File:Exoplanet_Comparison_HD_17156_b.png');

INSERT INTO planetas VALUES (22,'WASP-11b/HAT-P-10b','Gigante Gasoso','', '0.460 ± 0.028 MJ', '','2008' ,10,'https://en.wikipedia.org/wiki/WASP-11b/HAT-P-10b#/media/File:Exoplanet_Comparison_WASP-11-HAT-P-10_b.png');

INSERT INTO planetas VALUES (23,'AEgir(Epsilon Eridani b)','Gigante Gasoso','','~1.56 MJ','','2000',11,'https://en.wikipedia.org/wiki/Epsilon_Eridani_b#/media/File:Epsilon_Eridani_b.jpg');

INSERT INTO planetas VALUES (24,'WASP-1b','Gigante Gasoso','', '0.86 ± 0.07 MJ', '','2006' ,12,'https://es.wikipedia.org/wiki/WASP-1b#/media/File:WASP-1b.jpg');

INSERT INTO planetas VALUES (25,'16 Cygni Bb','Gigante Gasoso','', '>1.68 ± 0.15 MJ', '','1996' ,13,'https://it.wikipedia.org/wiki/16_Cygni_Bb#/media/File:16_Cygni_B_b.png');

INSERT INTO planetas VALUES (26,'51 Pegasi b',' Júpiteres quentes','', '0,472 ± 0,039 MJ', '','1995' ,14,'https://pt.wikipedia.org/wiki/51_Pegasi_b#/media/File:Artist_impression_of_the_exoplanet_51_Pegasi_b.jpg');

INSERT INTO planetas VALUES (27,'HD 209458 b','Gigante Gasoso','', '0.69 MJ', '','1999' ,17,'https://en.wikipedia.org/wiki/HD_209458_b#/media/File:Exoplanet_Comparison_HD_209458_b.png');

INSERT INTO planetas VALUES (28,'COROT-1b','Júpiteres quentes','', '1.23±0.10 MJ', '','2007' ,15,'https://en.wikipedia.org/wiki/COROT-1b#/media/File:Exoplanet_Comparison_CoRoT-1_b.png');

INSERT INTO planetas VALUES (29,'COROT-4b (COROT-Exo-4b)','','', '0.72 ± 0.08 MJ', '','2008' ,15,'https://en.wikipedia.org/wiki/COROT-4b#/media/File:Exoplanet_Comparison_CoRoT-4_b.png');

INSERT INTO planetas VALUES (30,'HAT-P-9b','Júpiteres quentes','', '0.78 ± 0.09 MJ', '','2008' ,16,'https://en.wikipedia.org/wiki/HAT-P-9b#/media/File:Exoplanet_Comparison_HAT-P-9_b.png');

















