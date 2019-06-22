#!/usr/bin/env bash

# Verifica que tu cluster esta en buen estado
curl localhost:9200/_cat/health

# Inserta un documento en el indice de "meetup", con el id #1
curl -XPOST 'localhost:9200/meetup/_doc/1?pretty' -H 'Content-Type: application/json' -d'{"nombre" : "Osvaldo", "apellido" : "Mercado"}'

# Busca todos los documentos disponibles en el indice
curl -XGET 'localhost:9200/meetup/_search?pretty' -H 'Content-Type: application/json'

# Cuenta todos los documentos disponibles en el indice
curl -XGET 'localhost:9200/meetup/_search?pretty' -H 'Content-Type: application/json'


# Inserta un documento en el indice de "meetup", SIN id
curl -XPOST 'localhost:9200/meetup/_doc/?pretty' -H 'Content-Type: application/json' -d'{"nombre" : "Osvaldo", "apellido" : "Mercado"}'


# Actualiza un documento en el indice de "meetup" con un id autogenerado
curl -XPOST 'localhost:9200/meetup/_doc/W364VGoBv1fIKC754dlF?pretty' -H 'Content-Type: application/json' -d'{"nombre" : "Osvaldo", "apellido" : "Mercado Coss"}'

# Actualiza un documento y añade un campo nuevo, en el indice de "meetup" con un id autogenerado
curl -XPOST 'localhost:9200/meetup/_doc/W364VGoBv1fIKC754dlF?pretty' -H 'Content-Type: application/json' -d'{"nombre" : "Osvaldo", "apellido" : "Mercado Coss", "edad": 30}'


# Actualiza un documento y añade +15 a la edad que tenga
curl -XPOST "localhost:9200/meetup/_update/W364VGoBv1fIKC754dlF?pretty" -H 'Content-Type: application/json' -d'
{
  "script" : "ctx._source.edad += 15"
}
'

# Query DSL (Domain Specific Language)


# Busca todos los documentos con el apellido "Mercado"
curl -XGET "localhost:9200/meetup/_search?pretty&q=apellido:Mercado" -H 'Content-Type: application/json'


# Borrar indice y todos sus documentos
curl -XDELETE localhost:9200/meetup


# Re-inserta un documento, con un email
curl -XPOST localhost:9200/meetup/_doc/?pretty -H'Content-type:application/json' -d'{"nombre":"Osvaldo","apellido":"Mercado","email":"omercadocoss@gmail.com"}'

# Busca todos los documentos
curl -XGET localhost:9200/meetup/_search/?pretty -H'Content-type:application/json'

# Busca el documento especifico (busca las diferencias entre las respuestas entre buscar y tomar el documento en especifico)
curl -XGET localhost:9200/meetup/_doc/YH5LVWoBv1fIKC75UdnO?pretty -H'Content-type:application/json'

# Busca en el indice todas las personas llamadas Mercado
curl -XGET localhost:9200/meetup/_search?pretty -H'Content-type:application/json' -d'{"query":{"match":{"apellido": "Mercado"}}}'

# Inserta alguien con el apellido "Mercado Coss"
curl -XPOST localhost:9200/meetup/_doc/?pretty -H'Content-type:application/json' -d'{"nombre":"Osvaldo","apellido":"Mercado Coss","email":"omercadocoss@gmail.com"}'

# Busca a la persona con el email  omercadocoss@gmail.com (introduccion a scores)
curl -XGET localhost:9200/meetup/_search?pretty -H'Content-type:application/json' -d'{"query":{"match":{"email": "omercadocoss@gmail.com"}}}'

# Busca a la persona con el apellido "Mercado Coss" (multiples registros)
 curl -XGET localhost:9200/meetup/_search?pretty -H'Content-type:application/json' -d'{"query":{"match":{"apellido": "Mercado Coss"}}}'

# Busca a la persona con el apellido "Mercado Coss" (match_phrase)
 curl -XGET localhost:9200/meetup/_search?pretty -H'Content-type:application/json' -d'{"query":{"match_phrase":{"apellido": "Mercado Coss"}}}'

# Explica porque haces un match query y porque el score
curl -H'Content-type:application/json' -XGET localhost:9200/meetup/_search?pretty -d'{"query":{"match":{"apellido":"Mercado Coss"}},"explain":true}'

# Se trata de insertar un key con subkey
curl -XPOST 'localhost:9200/meetup/_doc' -H 'Content-Type: application/json' -d'{"nombre":{"primer":"Osvaldo","segundo":"Mercado"}, "edad": 35}

# Checar el mapping, porque no funciona el instert
curl -XPOST 'localhost:9200/meetup/' -H 'Content-Type: application/json'

# Insertar con subkeys
curl -XPOST 'localhost:9200/meetup/_doc?pretty' -H 'Content-Type: application/json' -d'{"nombre":"Osvaldo","apellido":"Mercado", "edad": 35,"subnombre":{"primero":"Osvaldo"}}'

# Obtener datos con subkeys
curl -H'Content-type:application/json' -XGET localhost:9200/meetup/_search?pretty -d'{"query":{"match":{"subnombre.primero":"Osvaldo"}}}'

# Crear nuevo indice con mapping
{"mappings":{"properties":{"apellido":{"type":"text","fields":{"keyword":{"type":"keyword","ignore_above":256}}},"email":{"type":"text","fields":{"keyword":{"type":"keyword","ignore_above":256}}},"edad":{"type":"long"},"email_alterno":{"type":"text","analyzer":"standard"},"apodos":{"type":"text","analyzer":"standard"},"nombre":{"type":"text","fields":{"keyword":{"type":"keyword","ignore_above":256}}}}}}

#
curl -XPOST 'localhost:9200/meetup/_doc?pretty' -H 'Content-Type: application/json' -d'{"nombre":"Osvaldo","apellido":"Mercado", "edad": 35,"email":"omercadocoss@gmail.com","email_alterno":"omercadocoss@gmail.com","apodos":"El Guero Sin Palmas"}'

# buscar en todos los campos disponibles
curl -H'Content-type:application/json' -XGET localhost:9200/meetup_alterno/_search?pretty -d'{"query":{"query_string":{"query":"Guero"}}}'


# Analyzer sobre el texto
curl -X POST "localhost:9200/_analyze?pretty" -H 'Content-Type: application/json' -d'
{
  "analyzer": "standard",
  "text": "El Güero Sin Palma"
}
'

# Tokenizer
curl -X POST "localhost:9200/_analyze?pretty" -H 'Content-Type: application/json' -d'
{
  "tokenizer": "standard",
  "text": "omercadocoss@gmail.com"
}
'

# Tokenizer con acentos
curl -X POST "localhost:9200/_analyze" -H 'Content-Type: application/json' -d'
{
  "tokenizer": "standard",
  "filter":  [ "lowercase", "asciifolding" ],
  "text":      "A mí NO me estés GRITANDO!!!"
}
'

curl -X POST "localhost:9200/_analyze" -H 'Content-Type: application/json' -d'
{
  "analyzer": "whitespace",
  "text":     "The quick brown fox."
}
'


