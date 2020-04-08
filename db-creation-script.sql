CREATE (Nintendo:Compañia {nombre_comp:'Nintendo',fecha_fundacion:1889,lugar_creacion:'Japón'})
CREATE (SEGA:Compañia{nombre_comp:'SEGA',fecha_fundacion:1960,lugar_creacion:'Japón'})
CREATE (Level5:Compañia{nombre_comp:'Level 5',fecha_fundacion:1998,lugar_creacion:'Japón'})
CREATE (EA:Compañia{nombre_comp:'Electronic Arts',fecha_fundacion:1982,lugar_creacion:'Estados Unidos'})
CREATE (Midway:Compañia{nombre_comp:'Midway',fecha_fundacion:1958,lugar_creacion:'Estados Unidos'})
CREATE (NES:Consola {nombre_cons:'NES',fecha_creacion:1983,tipo:'sobremesa'})
CREATE (NintendoDS:Consola {nombre_cons:'Nintendo DS',fecha_creacion:2004,tipo:'portatil'})
CREATE (Nintendo3DS:Consola {nombre_cons:'Nintendo 3DS',fecha_creacion:2011,tipo:'portatil'})
CREATE (MegaDrive:Consola {nombre_cons:'Mega Drive',fecha_creacion:1988,tipo:'sobremesa'})
CREATE (SuperMarioBros:Videojuego {nombre_vid:'Super Mario Bros.',fecha_lanzamiento:1985})
CREATE (SuperMarioBros2:Videojuego {nombre_vid:'Super Mario Bros. 2', fecha_lanzamiento:1988})
CREATE (MarioYSonicJJOO:Videojuego {nombre_vid:'Mario & Sonic en los Juegos Olímpicos',fecha_lanzamiento:2008})
CREATE (LaytonVillaMisteriosa:Videojuego {nombre_vid:'El profesor Layton y la villa misteriosa',fecha_lanzamiento:2007})
CREATE (LaytonCajaPandora:Videojuego {nombre_vid:'El profesor Layton y la caja de Pandora',fecha_lanzamiento:2007})
CREATE (LaytonFuturoPerdido:Videojuego {nombre_vid:'El profesor Layton y el futuro perdido',fecha_lanzamiento:2008})
CREATE (MortalKombat:Videojuego {nombre_vid:'Mortal Kombat',fecha_lanzamiento:1992})
CREATE (FIFA08:Videojuego {nombre_vid:'FIFA 08',fecha_lanzamiento:2007})
CREATE (Mario:Personaje {nombre_pers:'Mario',sexo:'Masculino'})
CREATE (Peach:Personaje {nombre_pers:'Peach',sexo:'Femenino'})
CREATE (Sonic:Personaje {nombre_pers:'Sonic',sexo:'Masculino'})
CREATE (Layton:Personaje {nombre_pers:'Profesor Layton',sexo:'Masculino'})
CREATE (Luke:Personaje {nombre_pers:'Luke Triton',sexo:'Masculino'})
CREATE (Dimitri:Personaje {nombre_pers:'Dimitri Allen',sexo:'Masculino'} )
CREATE (SubZero:Personaje {nombre_pers:'Sub-Zero',sexo:'Masculino'} )
CREATE (Plataformas:Genero {nombre_gen:'Plataformas'})
CREATE (Deportes:Genero {nombre_gen:'Deportes'})
CREATE (Puzzles:Genero {nombre_gen:'Puzzles'})
CREATE (Lucha:Genero {nombre_gen:'Lucha'})

CREATE
	(Nintendo)-[:COLABORÓ_CON {fecha_col:[2006]}]->(SEGA),
	(SEGA)-[:COLABORÓ_CON {fecha_col:[2006]}]->(Nintendo) ,
	(Nintendo)-[:COLABORÓ_CON {fecha_col:[2005,2005,2006]}]->(Level5),
	(Level5)-[:COLABORÓ_CON {fecha_col:[2005,2005,2006]}]->(Nintendo),
	(SEGA)-[:COLABORÓ_CON {fecha_col:[2000]}]->(EA),
	(EA)-[:COLABORÓ_CON {fecha_col:[2000]}]->(SEGA),
	(EA)-[:COLABORÓ_CON {fecha_col:[2002]}]->(Nintendo),
	(Nintendo)-[:COLABORÓ_CON {fecha_col:[2002]}]->(EA),
	(Nintendo)-[:DESARROLLÓ {fecha_comienzo_desarrollo:2005}]->(LaytonCajaPandora),
	(Level5)-[:DESARROLLÓ {fecha_comienzo_desarrollo:2005}]->(LaytonCajaPandora),
	(Nintendo)-[:DESARROLLÓ {fecha_comienzo_desarrollo:2005}]->(LaytonVillaMisteriosa),
	(Level5)-[:DESARROLLÓ {fecha_comienzo_desarrollo:2005}]->(LaytonVillaMisteriosa),
	(Nintendo)-[:DESARROLLÓ {fecha_comienzo_desarrollo:2006}]->(LaytonFuturoPerdido),
	(Level5)-[:DESARROLLÓ {fecha_comienzo_desarrollo:2006}]->(LaytonFuturoPerdido),
	(Nintendo)-[:DESARROLLÓ {fecha_comienzo_desarrollo:2006}]->(MarioYSonicJJOO),
	(SEGA)-[:DESARROLLÓ {fecha_comienzo_desarrollo:2006}]->(MarioYSonicJJOO),
	(Nintendo)-[:DESARROLLÓ {fecha_comienzo_desarrollo:1983}]->(SuperMarioBros),
	(Nintendo)-[:DESARROLLÓ {fecha_comienzo_desarrollo:1985}]->(SuperMarioBros2),
	(EA)-[:DESARROLLÓ]->(FIFA08),
	(Midway)-[:DESARROLLÓ {fecha_comienzo_desarrollo:1989}]->(MortalKombat),
	(Nintendo)-[:CREÓ {fecha_comienzo_creación:1980}]->(NES),
	(Nintendo)-[:CREÓ {fecha_comienzo_creación:2003}]->(NintendoDS),
	(Nintendo)-[:CREÓ {fecha_comienzo_creación:2011}]->(Nintendo3DS),
	(SEGA)-[:CREÓ {fecha_comienzo_creación:1983}]->(MegaDrive),
	(LaytonVillaMisteriosa)-[:TIENE]->(Layton),
	(LaytonVillaMisteriosa)-[:TIENE]->(Luke),
	(LaytonVillaMisteriosa)-[:ES_DE_GENERO]->(Puzzles),
	(LaytonCajaPandora)-[:ES_SECUELA_DE]->(LaytonVillaMisteriosa),
	(LaytonCajaPandora)-[:TIENE]->(Layton),
	(LaytonCajaPandora)-[:TIENE]->(Luke),
	(LaytonCajaPandora)-[:ES_DE_GENERO]->(Puzzles),
	(LaytonFuturoPerdido)-[:ES_SECUELA_DE]->(LaytonCajaPandora),
	(LaytonFuturoPerdido)-[:TIENE]->(Layton),
	(LaytonFuturoPerdido)-[:TIENE]->(Luke),
	(LaytonFuturoPerdido)-[:TIENE]->(Dimitri),
	(LaytonFuturoPerdido)-[:ES_DE_GENERO]->(Puzzles),
	(NintendoDS)-[:PUEDE_EJECUTAR]->(LaytonVillaMisteriosa),
	(NintendoDS)-[:PUEDE_EJECUTAR]->(LaytonCajaPandora),
	(NintendoDS)-[:PUEDE_EJECUTAR]->(LaytonFuturoPerdido),
	(NintendoDS)-[:PUEDE_EJECUTAR]->(MarioYSonicJJOO),
	(NintendoDS)-[:PUEDE_EJECUTAR]->(FIFA08),
	(MegaDrive)-[:PUEDE_EJECUTAR]->(MortalKombat),
	(MarioYSonicJJOO)-[:TIENE]->(Sonic),
	(MarioYSonicJJOO)-[:TIENE]->(Mario),
	(MarioYSonicJJOO)-[:TIENE]->(Peach),
	(MarioYSonicJJOO)-[:ES_DE_GENERO]->(Deportes),
	(FIFA08)-[:ES_DE_GENERO]->(Deportes),
	(NES)-[:PUEDE_EJECUTAR]->(SuperMarioBros),
	(NES)-[:PUEDE_EJECUTAR]->(SuperMarioBros2),
	(SuperMarioBros)-[:TIENE]->(Mario),
	(SuperMarioBros)-[:TIENE]->(Peach),
	(SuperMarioBros)-[:ES_DE_GENERO]->(Plataformas),
	(SuperMarioBros2)-[:ES_SECUELA_DE]->(SuperMarioBros),
	(SuperMarioBros2)-[:TIENE]->(Mario),
	(SuperMarioBros2)-[:TIENE]->(Peach),
	(MortalKombat)-[:TIENE]->(SubZero),
	(SuperMarioBros2)-[:ES_DE_GENERO]->(Plataformas),
	(MortalKombat)-[:ES_DE_GENERO]->(Lucha)
