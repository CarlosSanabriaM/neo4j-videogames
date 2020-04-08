# Querys
## Consultas elementales

### Nombre de videojuegos, junto a su fecha de lanzamiento, ordenados por fecha de lanzamiento
```sql
MATCH (n:Videojuego)
RETURN n.nombre_vid AS NombreVideojuego ,n.fecha_lanzamiento AS FechaLanzamiento
ORDER BY n.fecha_lanzamiento
```

### Nombre de los personajes que salen en videojuegos desarrollados por SEGA
```sql
MATCH (p:Personaje)<-[:TIENE]-(v:Videojuego)<-[:DESARROLLÓ]-(c:Compañia)
WHERE c.nombre_comp="SEGA"
RETURN DISTINCT p.nombre_pers AS NombrePersonaje
```

### Nombre de una consola junto al número de videojuegos que puede ejecutar
```sql
MATCH (c:Consola)-[ej:PUEDE_EJECUTAR]->(v:Videojuego)
RETURN c.nombre_cons AS NombreConsola, COUNT(*) AS NumeroDeJuegos
```

### Numero de compañias que desarrollaron los videojuegos
```sql
MATCH (v:Videojuego) <-[d:DESARROLLÓ]-(c:Compañia)
RETURN v.nombre_vid AS NombreVideojuego, COUNT(c) AS NumeroCompañiasQueLoDesarrollaron
```




## Querys dificultad intermedia

### Personajes que no salen en videojuegos de NES
```sql
MATCH (p:Personaje),(c:Consola)
WHERE c.nombre_cons="NES"
AND NOT (p)<-[:TIENE]-(:Videojuego)<-[:PUEDE_EJECUTAR]-(c)
RETURN p AS Personajes
```

### Videojuegos que surgen de las colaboraciones entre compañías que colaboraron más de 2 veces
```sql
MATCH (c1:Compañia)-[:DESARROLLÓ]->(v:Videojuego)<-[:DESARROLLÓ]-(c2:Compañia),
(c1)-[colab:COLABORÓ_CON]-(c2)
WHERE size(colab.fecha_col) > 2
RETURN DISTINCT v AS Videojuegos
```

__Explicación:__ La relación colaboró_con tiene un atributo fecha_col, que es una lista, que
guarda los años en los que colaboran las dos compañías de la relación para cada uno de los juegos que hicieron juntas.

### Videojuegos para consolas portátiles, que han sido desarrollados por los creadores de dicha consola portátil (se muestra el videojuego junto a la consola portátil donde se ejecuta y la compañía que crea/desarrolla ambos)
```sql
MATCH (comp:Compañia)-[:DESARROLLÓ]->(v:Videojuego),
(v)<-[:PUEDE_EJECUTAR]-(c:Consola)<-[:CREÓ]-(comp)
WHERE c.tipo="portatil"
RETURN v AS Videojuegos ,c AS Consolas ,comp AS Compañias
```

### Número de consolas en las que sale el personaje Mario y una lista con los nombres de esas consolas
```sql
MATCH (c:Consola)-[p:PUEDE_EJECUTAR]->(v:Videojuego)-[t:TIENE]->(per:Personaje)
WHERE per.nombre_pers = 'Mario'
RETURN count(c) AS Cantidad ,collect(c.nombre_cons) AS Consolas
```




## Querys dificultad avanzada

### Videojuegos que son precuela (directa o indirecta) de Layton y el futuro perdido
```sql
MATCH (v1:Videojuego)-[:ES_SECUELA_DE*]->(v2:Videojuego)
WHERE v1.nombre_vid="El profesor Layton y el futuro perdido"
RETURN v2 AS Videojuegos
```

### Camino mínimo de colaboraciones entre SEGA y Level5
```sql
MATCH (c1:Compañia { nombre_comp: 'SEGA' }), (c2:Compañia { nombre_comp:'Level 5' } ),
	p = shortestPath((c1) – [:COLABORÓ_CON*] – (c2))
RETURN p
```
